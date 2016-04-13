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

        public List<noticia> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<noticia> tb = getTable();
                return tb.ToList();
            }
        }

        public List<noticia> Listar(DateTime data,String text)
        {
            using (dbDataContext db = getDataContext())
            {                
                text = "%" + text + "%";
                String sql =" select n.* " +
                            " from noticias n " +
                            " where (n.data_postagem between {0} and {1} ) " +
                            " and((n.titulo_postagem like {2} ) or(n.corpo_noticia like {2} )) ";
                var query = db.ExecuteQuery<noticia>(sql, data, data.AddDays(1), text);
                return query.ToList();
            }
        }

    }
}
