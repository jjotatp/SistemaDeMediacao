using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using med_admin.Controllers;
using System.Data.Linq;

namespace med_admin.Models
{
    public class Mediador_Model : Controller
    {
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<mediador> getTable()
        {
            dbDataContext db = getDataContext();
            Table<mediador> tb = db.GetTable<mediador>();
            return tb;
        }

        public int Inserir(mediador a)
        {
            // função para cadastrar cidade
            try
            {
                Table<mediador> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }
        }

        public bool Alterar(mediador a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<mediador> tb = getTable();

                db.alteraMediador(a.id, a.nome, a.patente, a.id_local, a.usuario, a.senha);
                tb.Context.SubmitChanges();

                return true;
            }
            catch
            {
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

        // GET: Mediador_
        public ActionResult Index()
        {
            return View();
        }
    }
}