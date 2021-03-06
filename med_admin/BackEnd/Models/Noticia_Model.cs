﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;
using System.IO;
using System.Net;
using System.Text;
using System.Drawing;


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

        public bool Alterar(noticia a)
        {
            try
            {
                dbDataContext context = getDataContext();
                Table<noticia> tb = getTable();

                context.alteraNoticia(a.id, a.imagem_nome, a.imagem_caminho, a.titulo_postagem, 
                    a.corpo_noticia, a.id_mediador_edicao, a.id_local_edicao, a.data_edicao, a.prioridade);

                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
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

        public List<noticia> Listar(String text)
        {
            IEnumerable<noticia> query;
            text = "%" + text + "%";
            String sql = " select n.* " +
                         " from noticias n " +
                         " where ((n.titulo_postagem like {0} ) or(n.corpo_noticia like {0} )) ";
            using (dbDataContext db = getDataContext())
            {
                query = db.ExecuteQuery<noticia>(sql, text);

                return query.ToList();
            }
        }

        public List<noticia> Listar(DateTime data,String text, Int32 qtd = 30)
        {
            IEnumerable<noticia> query;
            text = "%" + text + "%";
            String sql = " select top "+qtd.ToString()+" n.* " +
                         " from noticias n " +
                         " where ((n.titulo_postagem like {0} ) or (n.corpo_noticia like {0} )) " +
                         " and (n.data_postagem between {1} and {2} ) ";
            using (dbDataContext db = getDataContext())
            {
                query = db.ExecuteQuery<noticia>(sql, text, data, data.AddDays(1));

                return query.ToList();
            }
        }

        public List<noticia> ListarSite()
        {
            IEnumerable<noticia> query;
            String sql =" select n.id, n.titulo_postagem, n.corpo_noticia, n.imagem_caminho, n.imagem_nome, n.data_postagem, n.data_edicao, n.prioridade " +
                        " from noticias n " +
                        " order by n.prioridade, coalesce(n.data_edicao, n.data_postagem) desc";
            using (dbDataContext db = getDataContext())
            {
                query = db.ExecuteQuery<noticia>(sql);

                return query.ToList();
            }
        }

        public noticia Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<noticia> tb = db.GetTable<noticia>();
                return tb.First(p => p.id == id);
            }
        }
    }
}
