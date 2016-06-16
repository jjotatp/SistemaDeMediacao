using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;


namespace BackEnd.Models
{

    public class Solicitacao_Model
    {
        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<solicitacao> getTable()
        {
            dbDataContext db = getDataContext();
            Table<solicitacao> tb = db.GetTable<solicitacao>();
            return tb;
        }


        public bool Inserir(solicitacao a)
        {
            // função para cadastrar cidade
            try
            {
                Table<solicitacao> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public bool Alterar(solicitacao a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<solicitacao> tb = getTable();

                db.alteraSolicitacoes(a.id, a.descricao_caso, a.solicitante_nome,
                                    a.solicitante_telefone, a.solicitante_endereco, a.solicitante_email,
                                    a.solicitante_periodo_atendimento, a.solicitante_dia_atendimento, a.detalhes_partes, a.id_local);

                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public solicitacao Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                solicitacao s = new solicitacao();
                try
                {
                    Table<solicitacao> tb = db.GetTable<solicitacao>();
                    s = tb.First(p => p.id == id);
                    return s;
                }
                catch (Exception e)
                {
                    message = e.Message;
                    return s;
                }
            }
        }

        public List<solicitacao> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<solicitacao> tb = getTable();
                return tb.ToList();
            }
        }

        public List<v_solicitacao> ListarPorTexto(String nomeCampo, String valorParametro)
        {
            using (dbDataContext db = getDataContext())
            {
                valorParametro = "%" + valorParametro + "%";
                String sSql = " select * from v_solicitacoes " +
                               " where " + nomeCampo + " like {0}";
                var query = db.ExecuteQuery<v_solicitacao>(sSql, valorParametro);
                return query.ToList();
            }
        }

        public List<solicitacao> ListarPorData(DateTime valorParametro)
        {
            using (dbDataContext db = getDataContext())
            {
                String sSql = " select s.id ID,s.solicitante_nome Nome, l.descricao Local, s.data Data, c.nome Cidade from solicitacoes s " +
                               " left join cidades c on (s.id_cidade_abertura = c.id) " +
                               " left join locais l on (s.id_local = l.id) where s.data = {0}";
                var query = db.ExecuteQuery<solicitacao>(sSql, valorParametro);
                return query.ToList();
            }
        }

        public bool TransferirSolicitacao(int id_solicitacao, int id_local)
        {
            // carrega a solicitação e atualizar
            try
            {
                solicitacao s = new solicitacao();
                s = Obter(id_solicitacao);
                s.id_local = id_local;
                Alterar(s);
                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public bool Excluir(solicitacao s)
        {
            try
            {
                String sql = "delete from solicitacoes where id = {0}";
                dbDataContext db = getDataContext();
                db.ExecuteCommand(sql, s.id);

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public List<agendamento> CarregaAgendamentos(solicitacao s)
        {            
            try
            {
                String sql = "select * from agendamentos where id_solicitacao = {0}";
                dbDataContext db = getDataContext();
                var query = db.ExecuteQuery<agendamento>(sql, s.id);
                                
                return query.ToList();
            }
            catch (Exception e)
            {
                message = e.Message;
                return null;
            }
        }
    }
}