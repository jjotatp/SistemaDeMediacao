using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;


namespace BackEnd.Models
{
    public class Configuracao_Model
    {
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<configuracao> getTable()
        {
            dbDataContext db = getDataContext();
            Table<configuracao> tb = db.GetTable<configuracao>();
            return tb;
        }

        public bool Inserir(configuracao c)
        {
            // função para cadastrar cidade
            try
            {
                Table<configuracao> tb = getTable();
                dbDataContext db = getDataContext();

                if (c.id == 0)
                {
                    tb.InsertOnSubmit(c);
                    tb.Context.SubmitChanges();
                    return true;
                }
                else
                {
                    return false;
                }

                
            }
            catch
            {
                return false;
            }
        }

        public configuracao Obter(String nome_portal)
        {
            configuracao c = new configuracao();

            using (dbDataContext db = getDataContext())
            {
                Table<configuracao> tb = db.GetTable<configuracao>();
                c = tb.First(p => p.nome_conf == nome_portal);
            }

            return c;
        }

    }
}
