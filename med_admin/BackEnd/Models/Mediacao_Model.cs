using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Mediacao_Model
    {
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<mediacao> getTable()
        {
            dbDataContext db = getDataContext();
            Table<mediacao> tb = db.GetTable<mediacao>();
            return tb;
        }

        public Table<mediacao_parte> getTablePartes()
        {
            dbDataContext db = getDataContext();
            Table<mediacao_parte> tb = db.GetTable<mediacao_parte>();
            return tb;
        }

        public int Inserir(mediacao a)
        {
            // função para cadastrar
            try
            {
                Table<mediacao> tb = getTable();
                tb.InsertOnSubmit(a);
                tb.Context.SubmitChanges();

                return a.id;
            }
            catch
            {
                return 0;
            }
        }

        public bool Alterar(mediacao a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<mediacao> tb = getTable();

                db.alteraMediacao(a.id, a.id_solicitacao, a.numero, a.tema_conflito, a.data_mediacao, a.id_mediador,
                    a.id_tipo_registro, a.objeto, a.id_local, a.documento_link, a.status, a.resolucao);
                tb.Context.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public String getStatus(int iStatus)
        {
            String sStatus;
            // status:
            // 1 - concluído
            // 2 - cancelado
            switch (iStatus)
            {
                case 1:  sStatus = "Concluída";
                    break;
                case 2:  sStatus = "Cancelada";
                    break;        
                default: sStatus = "Nenhum";
                    break;
            }
                   
            return sStatus;
        }

        public bool InserirParte(mediacao_parte p)
        {            
            try
            {
                Table<mediacao_parte> tb = getTablePartes();
                if (p != null)
                {                    
                    tb.InsertOnSubmit(p);
                    tb.Context.SubmitChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool RemoverParte(mediacao_parte p)
        {            
            try
            {
                Table<mediacao_parte> tb = getTablePartes();
                if (p != null)
                {
                    tb.DeleteOnSubmit(p);
                    tb.Context.SubmitChanges();                    
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch { return false; }
        }

    }
}