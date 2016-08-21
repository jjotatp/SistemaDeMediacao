using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Mediador_Model
    {
        public const int PERM_PADRAO = 1;
        public const int PERM_AVANCADO = 2;
        public const int PERM_ADMIN = 3;

        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<mediador> getTable()
        {
            dbDataContext db = getDataContext();
            Table<mediador> tb = db.GetTable<mediador>();
            return tb;
        }

        public bool InserirAtualizar(mediador a)
        {
            // função para cadastrar ou atualizar mediador
            try
            {
                Table<mediador> tb = getTable();
                dbDataContext db = getDataContext();

                if (a.alcance == "")
                {
                    Local_Model local_m = new Local_Model();
                    // se o alcance vier em branco, então pega o numero_opm do local selecionado
                    // permitindo que o mediador tenha controle somente daquele local
                    a.alcance = local_m.Obter(a.id_local).numero_opm;
                }

                if (a.id == 0)
                {
                    db.cadMediador(a.nome, a.patente, a.id_local, a.usuario, a.senha, a.ativo, a.nivel_permissao, a.alcance, a.RE);
                    tb.Context.SubmitChanges();
                }
                else
                {
                    db.alteraMediador(a.id, a.nome, a.patente, a.id_local, a.usuario, a.senha, a.ativo, a.nivel_permissao, a.alcance, a.RE);
                    tb.Context.SubmitChanges();
                }

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public mediador Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<mediador> tb = db.GetTable<mediador>();
                return tb.First(p => p.id == id);
            }
        }

        public List<mediador> Listar(string alcance)
        {
            message = "";
            try
            {
                using (dbDataContext db = getDataContext())
                {
                    Table<mediador> tb = getTable();

                    // para buscar somente dos locais que começam com o alcance
                    // ex: 255% terá como resultado todos que começam com 255
                    alcance = alcance + "%";

                    // faz a busca trazendo os ativos
                    String sSql = "select m.* from mediadores m "+
                                    " join locais l on (l.id = m.id_local) "+
                                    " where (m.ativo = 1) and (l.numero_opm like {0} )";
                    var query = db.ExecuteQuery<mediador>(sSql,alcance);
                    return query.ToList();
                }
            }
            catch (Exception e)
            {
                message = e.Message;
                return null;
            }
        }

        public List<v_mediador> ListarPorNome(string Nome, string alcance, bool SomenteAtivos)
        {
            try
            {
                message = "";
                using (dbDataContext db = getDataContext())
                {
                    Nome = "%" + Nome + "%";

                    String sSql =   "select m.*from v_mediadores m " +
                                    "join mediadores med on (med.id = m.id) " +
                                    "join locais l on (l.id = med.id_local) " +
                                    "where ((m.Nome like {0} ) or (m.RE like {0} )) ";
                                    
                    if (SomenteAtivos)
                    {
                        sSql = sSql + " and ( m.Ativo = 1 )";
                    }
                    // faz join com a tabela de locais(nucleos) para trazer somente os mediadores dos locais
                    // que estão de acordo com o alcance no cabeçalho da função
                    alcance = alcance + "%";
                    sSql = sSql + "and ( l.numero_opm like {1} ) ";

                    var query = db.ExecuteQuery<v_mediador>(sSql, Nome, alcance);
                    return query.ToList(); 
                }
            }
            catch (Exception e)
            {
                message = e.Message;
                return null;
            }
        }

        public mediador ObterUsuario(string usuario)
        {
            using (dbDataContext db = getDataContext())
            {
                mediador d = new mediador();
                Table<mediador> tb = getTable();
                try
                {
                    d = tb.First(p => (p.usuario == usuario) && (p.ativo == true));
                }
                catch (Exception e)
                {
                    message = e.Message;                    
                }
                return d;
            }
        }

        public mediador ObterUsuarioLogin(String usuario, String senha)
        {            
            Table<mediador> tb = getTable();
            var med = ( from p in tb
                        where p.usuario == usuario && p.senha == senha && p.ativo == true
                        select p).SingleOrDefault();                                   
            return med;        
        }
    }
}