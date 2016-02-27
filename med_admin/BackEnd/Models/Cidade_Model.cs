using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using med_admin.Controllers;

namespace med_admin.Model
{
    public class CidadeModel : Controller
    {
        public dbDataContext getDataContext(){ dbDataContext db = new dbDataContext(); return db; }

        public Table<cidade> getTable()
        {
            dbDataContext db = getDataContext();
            Table<cidade> tbCidade = db.GetTable<cidade>();
            return tbCidade;            
        }

        public int Inserir(cidade a)
        {
            // função para cadastrar cidade
            try
            {
                Table<cidade> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }          
        }

        public bool Alterar(cidade a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<cidade> tb = getTable();

                db.alteraCidade(a.id, a.nome, a.estado);
                tb.Context.SubmitChanges();
                
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

        // GET: CidadeModel
        public ActionResult Index()
        {
            return View();
        }
    }
}