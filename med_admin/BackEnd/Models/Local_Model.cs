using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Local_Model 
    {
        public String message;       

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<local> getTable()
        {
            dbDataContext db = getDataContext();
            Table<local> tb = db.GetTable<local>();
            return tb;
        }

        public bool InserirAtualizar(local a)
        {
            // função para cadastrar ou atualizar local
            try
            {
                Table<local> tb = getTable();
                dbDataContext db = getDataContext();

                if (a.id == 0)
                {
                    tb.InsertOnSubmit(a);
                    tb.Context.SubmitChanges();
                }
                else
                {                                                            
                    db.alteraLocal(a.id, a.nome, a.descricao, a.id_cidade, a.bairro, a.logradouro,
                                    a.numero, a.CEP, a.data_inicio_atividade, a.telefone, a.ativo);
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

        public local Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<local> tb = db.GetTable<local>();
                return tb.First(p => p.id == id);
            }
        }

        public List<local> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<local> tb = getTable();
                var query = db.ExecuteQuery<local>("select * from locais where ativo = 1");
                return query.ToList();
            }
        }

        public List<v_nucleo> ListarPorNome(String Nome, Boolean SomenteAtivos)
        {
            message = "";
            try
            {
                using (dbDataContext db = getDataContext())
                {
                    Nome = "%" + Nome + "%";
                    string sSql = " select * from v_nucleos where ( Nome like {0} ) ";
                    if (SomenteAtivos)
                    {
                         sSql = sSql + " and ( ativo = 1 )";
                    }                    
                    var query = db.ExecuteQuery<v_nucleo>(sSql, Nome);
                    return query.ToList();
                }
            }
            catch (Exception e)
            {
                message = e.Message;
                return null;
            }

        }        
    }
}