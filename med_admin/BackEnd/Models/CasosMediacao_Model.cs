using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;

namespace BackEnd.Models
{
    public class CasosMediacao_Model
    {
        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<casos_mediacao> getTable()
        {
            dbDataContext db = getDataContext();
            Table<casos_mediacao> tb = db.GetTable<casos_mediacao>();
            return tb;
        }

        public bool Inserir(casos_mediacao a)
        {
            // função para cadastrar
            try
            {
                Table<casos_mediacao> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public casos_mediacao Obter(int id_tipo_registro)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<casos_mediacao> tb = db.GetTable<casos_mediacao>();
                return tb.First(p => p.id_tipo_registro == id_tipo_registro);
            }
        }

        public List<casos_mediacao> Listar()
        {
            using (dbDataContext db = getDataContext())
            {                
                Table<casos_mediacao> tb = getTable();
                return tb.ToList();
            }
        }

        public List<casos_mediacao> ListarPrioridade()
        {            
            using (dbDataContext db = getDataContext())
            {
                String sSql = "select * from casos_mediacao order by prioridade";
                var query = db.ExecuteQuery<casos_mediacao>(sSql);
                return query.ToList();
            }
        }

        

    }
}
