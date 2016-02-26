using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using med_admin.Controllers;
using System.Data.Linq;

namespace med_admin.Models
{
    public class TipoRegistro_Model : Controller
    {

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<tipo_registro> getTable()
        {
            dbDataContext db = getDataContext();
            Table<tipo_registro> tb = db.GetTable<tipo_registro>();
            return tb;
        }

        public int Inserir(tipo_registro a)
        {
            // função para cadastrar cidade
            try
            {
                Table<tipo_registro> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }
        }

        public bool Alterar(tipo_registro a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<tipo_registro> tb = getTable();

                db.alteraTipoRegistro(a.id, a.descricao);
                tb.Context.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public tipo_registro Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<tipo_registro> tb = db.GetTable<tipo_registro>();
                return tb.First(p => p.id == id);
            }
        }

        // GET: TipoRegistro_Model
        public ActionResult Index()
        {
            return View();
        }
    }
}