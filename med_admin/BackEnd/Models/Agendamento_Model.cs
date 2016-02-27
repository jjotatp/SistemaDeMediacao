using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using med_admin.Controllers;
using System.Data.Linq;

namespace med_admin.Models
{
    public class Agendamento_Model : Controller
    {
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<agendamento> getTable()
        {
            dbDataContext db = getDataContext();
            Table<agendamento> tb = db.GetTable<agendamento>();
            return tb;
        }

        public int Inserir(agendamento a)
        {
            // função para cadastrar cidade
            try
            {
                Table<agendamento> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }
        }

        public bool Alterar(agendamento a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<agendamento> tb = getTable();

                db.alteraAgendamento(a.id, a.id_solicitacao, a.descricao, a.data);
                tb.Context.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public agendamento Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<agendamento> tb = db.GetTable<agendamento>();
                return tb.First(p => p.id == id);
            }
        }

        // GET: Agendamento_Model
        public ActionResult Index()
        {
            return View();
        }
    }
}