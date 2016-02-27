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
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<solicitacao> getTable()
        {
            dbDataContext db = getDataContext();
            Table<solicitacao> tb = db.GetTable<solicitacao>();
            return tb;
        }


        public int Inserir(solicitacao a)
        {
            // função para cadastrar cidade
            try
            {
                Table<solicitacao> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }
        }

        public bool Alterar(solicitacao a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<solicitacao> tb = getTable();

                db.alteraSolicitacoes(a.id, a.descricao_problema, a.descricao_caso, a.solicitante_nome,
                                    a.solicitante_telefone, a.solicitante_endereco, a.solicitante_email,
                                    a.solicitante_periodo_atendimento, a.detalhes_partes, a.id_local);

                tb.Context.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public solicitacao Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<solicitacao> tb = db.GetTable<solicitacao>();
                return tb.First(p => p.id == id);
            }
        }
    }
}