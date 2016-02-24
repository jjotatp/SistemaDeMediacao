using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using med_admin.Controllers;
using System.Data.Linq;

namespace med_admin.Models
{
    public class Local_Model : Controller
    {

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<local> getTable()
        {
            dbDataContext db = getDataContext();
            Table<local> tb = db.GetTable<local>();
            return tb;
        }

        public int Inserir(local a)
        {
            // função para cadastrar cidade
            try
            {
                Table<local> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }
        }

        public bool Alterar(local a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<local> tb = getTable();

                db.alteraLocal(a.id, a.nome, a.descricao, a.cidade, a.bairro, a.tipo_logradouro, a.logradouro, 
                                    a.numero, a.CEP, a.data_inicio_atividade);
                tb.Context.SubmitChanges();

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

        // GET: Local_Model
        public ActionResult Index()
        {
            return View();
        }
    }
}