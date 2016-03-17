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

        public bool InsereImagem(noticia a, Binary imagem)
        {
            // função que insere uma imagem na notícia especificada
            try
            {
                dbDataContext db = getDataContext();
                Table<noticia_imagem> tb = db.GetTable<noticia_imagem>();
                noticia_imagem n = new noticia_imagem();
                n.id_noticia = a.id;
                n.imagem = imagem;

                tb.InsertOnSubmit(n);
                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }
    }
}
