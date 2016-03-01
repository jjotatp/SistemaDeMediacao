using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;

namespace BackEnd.Models
{
    public class Cidade_Model
    {
        public dbDataContext getDataContext(){ dbDataContext db = new dbDataContext(); return db; }

        public Table<cidade> getTable()
        {
            dbDataContext db = getDataContext();
            Table<cidade> tbCidade = db.GetTable<cidade>();
            return tbCidade;            
        }

        public bool InserirAtualizar(cidade a)
        {
            // função para cadastrar cidade
            try
            {
                Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();

                if (a.id == 0)
                {
                    tb.InsertOnSubmit(a);
                    tb.Context.SubmitChanges();
                }
                else
                {
                    db.alteraCidade(a.id, a.nome, a.estado);
                    tb.Context.SubmitChanges();
                }

                return true;
            }
            catch
            {
                return false;
            }          
        }

        public cidade Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<cidade> tb = db.GetTable<cidade>();
                return tb.First(p => p.id == id);
            }
        }

        public List<cidade> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<cidade> tabelaCidade = getTable();
                return tabelaCidade.ToList();
            }
        }

        public List<cidade> ListarPorNome(string Nome)
        {
            using (dbDataContext db = getDataContext())
            {

                String sSql = "select * from cidades C where C.nome like '%" + Nome + "%' ";
                var query = db.ExecuteQuery<cidade>(sSql);
                return query.ToList();
            }
        }
    }
}