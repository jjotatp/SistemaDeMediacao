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
                                    a.numero, a.CEP, a.data_inicio_atividade, a.telefone);
                    tb.Context.SubmitChanges();
                }

                return true;
            }
            catch
            {
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
                return tb.ToList();
            }
        }

        public List<local> ListarPorNome(string Nome)
        {
            using (dbDataContext db = getDataContext())
            {
                String sSql = "select * from locais l where l.nome like '%" + Nome + "%' ";
                var query = db.ExecuteQuery<local>(sSql);
                return query.ToList();
            }
        }
    }
}