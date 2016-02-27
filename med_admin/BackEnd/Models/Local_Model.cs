using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Local_Model 
    {

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<local> getTable()
        {
            dbDataContext db = getDataContext();
            Table<local> tb = db.GetTable<local>();
            return tb;
        }

        public bool InserirAtualizar(local a)
        {
            // função para cadastrar ou atualizar local
            try
            {
                Table<local> tb = getTable();
                dbDataContext db = getDataContext();

                if (a.id == 0)
                {
                    tb.InsertOnSubmit(a);
                    tb.Context.SubmitChanges();
                }
                else
                {
                    db.alteraLocal(a.id, a.nome, a.descricao, a.cidade, a.bairro, a.tipo_logradouro, a.logradouro,
                                    a.numero, a.CEP, a.data_inicio_atividade);
                    tb.Context.SubmitChanges();
                }

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
    }
}