using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Mediador_Model
    {
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
                    tb.InsertOnSubmit(a);
                    tb.Context.SubmitChanges();
                }
                else
                {
                    db.alteraMediador(a.id, a.nome, a.patente, a.id_local, a.usuario, a.senha);
                    tb.Context.SubmitChanges();
                }

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

        public List<mediador> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<mediador> tb = getTable();
                return tb.ToList();
            }
        }

        public List<mediador> ListarPorNome(string Nome)
        {
            using (dbDataContext db = getDataContext())
            {
                Nome = "%" + Nome + "%";
                String sSql = "select * from mediadores m where m.nome like {0}";
                var query = db.ExecuteQuery<mediador>(sSql,Nome);
                return query.ToList();
            }
        }

        public mediador ObterUsuario(string usuario)
        {
            using (dbDataContext db = getDataContext())
            {
                mediador d = new mediador();
                Table<mediador> tb = getTable();
                try {
                    tb.First(p => p.usuario == usuario);
                }
                catch {}
                return d;
            }
        }
    }
}