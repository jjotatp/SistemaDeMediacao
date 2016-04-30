﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;


namespace BackEnd.Models
{
    public class Depoimento_Model
    {
        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<depoimento> getTable()
        {
            dbDataContext db = getDataContext();
            Table<depoimento> tb = db.GetTable<depoimento>();
            return tb;
        }

        public bool Inserir(depoimento a)
        {
            // função para cadastrar
            try
            {
                Table<depoimento> tb = getTable();
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

        public bool Alterar(depoimento a)
        {
            try
            {
                dbDataContext context = getDataContext();
                Table<depoimento> tb = getTable();

                context.alteraDepoimento(a.id, a.nome, a.idade, a.descricao, a.id_mediador, a.data, a.status);

                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public List<depoimento> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<depoimento> tb = getTable();
                return tb.ToList();
            }
        }

        public depoimento Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<depoimento> tb = db.GetTable<depoimento>();
                return tb.First(p => p.id == id);
            }
        }

        //public List<noticia> Listar(String text)
        //{
        //    IEnumerable<noticia> query;
        //    text = "%" + text + "%";
        //    String sql = " select n.* " +
        //                 " from noticias n " +
        //                 " where ((n.titulo_postagem like {0} ) or(n.corpo_noticia like {0} )) ";
        //    using (dbDataContext db = getDataContext())
        //    {
        //        query = db.ExecuteQuery<noticia>(sql, text);

        //        return query.ToList();
        //    }
        //}

        //public List<noticia> Listar(DateTime data,String text)
        //{
        //    IEnumerable<noticia> query;
        //    text = "%" + text + "%";
        //    String sql = " select n.* " +
        //                 " from noticias n " +
        //                 " where ((n.titulo_postagem like {0} ) or(n.corpo_noticia like {0} )) " +
        //                 " and (n.data_postagem between {1} and {2} ) ";
        //    using (dbDataContext db = getDataContext())
        //    {
        //        query = db.ExecuteQuery<noticia>(sql, text, data, data.AddDays(1));

        //        return query.ToList();
        //    }
        //}

    }
}