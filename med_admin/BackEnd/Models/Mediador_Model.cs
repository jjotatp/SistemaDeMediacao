﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Mediador_Model
    {
        public const int PERM_PADRAO = 1;
        public const int PERM_AVANCADO = 2;
        public const int PERM_ADMIN = 3;

        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<mediador> getTable()
        {
            dbDataContext db = getDataContext();
            Table<mediador> tb = db.GetTable<mediador>();
            return tb;
        }

        public bool InserirAtualizar(mediador a)
        {
            // função para cadastrar ou atualizar mediador
            try
            {
                Table<mediador> tb = getTable();
                dbDataContext db = getDataContext();

                if (a.id == 0)
                {
                    db.cadMediador(a.nome, a.patente, a.id_local, a.usuario, a.senha, a.ativo, a.nivel_permissao);
                    tb.Context.SubmitChanges();
                }
                else
                {
                    db.alteraMediador(a.id, a.nome, a.patente, a.id_local, a.usuario, a.senha, a.ativo, a.nivel_permissao);
                    tb.Context.SubmitChanges();
                }

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
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

        public List<mediador> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<mediador> tb = getTable();
                var query = db.ExecuteQuery<mediador>("select * from mediadores where ativo = 1");
                return query.ToList();
            }
        }

        public List<v_mediador> ListarPorNome(string Nome, bool SomenteAtivos)
        {
            using (dbDataContext db = getDataContext())
            {
                Nome = "%" + Nome + "%";
                String sSql = "select * from v_mediadores m where m.Nome like {0}";
                if (SomenteAtivos)
                {
                    sSql = sSql + " and ( m.Ativo = 1 )";
                }
                var query = db.ExecuteQuery<v_mediador>(sSql, Nome);
                return query.ToList(); 
            }
        }

        public mediador ObterUsuario(string usuario)
        {
            using (dbDataContext db = getDataContext())
            {
                mediador d = new mediador();
                Table<mediador> tb = getTable();
                try
                {
                    d = tb.First(p => (p.usuario == usuario) && (p.ativo == true));
                }
                catch (Exception e)
                {
                    message = e.Message;                    
                }
                return d;
            }
        }

        public mediador ObterUsuarioLogin(String usuario, String senha)
        {            
            Table<mediador> tb = getTable();
            var med = ( from p in tb
                        where p.usuario == usuario && p.senha == senha && p.ativo == true
                        select p).SingleOrDefault();                                   
            return med;        
        }
    }
}