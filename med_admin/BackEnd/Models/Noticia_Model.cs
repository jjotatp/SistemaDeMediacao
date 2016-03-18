using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;


namespace BackEnd.Models
{
    public class Noticia_Model
    {
        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<noticia> getTable()
        {
            dbDataContext db = getDataContext();
            Table<noticia> tb = db.GetTable<noticia>();
            return tb;
        }

        public bool Inserir(noticia a)
        {
            // função para cadastrar
            try
            {
                Table<noticia> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return true;
            }
            catch(Exception e)
            {
                message = e.Message;
                return false;                
            }
        }        
    }
}
