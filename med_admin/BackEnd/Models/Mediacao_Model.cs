using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;
using System.Data.Linq;
using System.Data.Common;

namespace BackEnd.Models
{
    public class Mediacao_Model
    {
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }        
        
        public bool InserirMediacaoTotal(mediacao m, List<mediacao_parte> partes)
        {
            dbDataContext context = getDataContext();
            using (DbConnection conn = context.Connection)
            {
                conn.Open();
                using (DbTransaction trans = conn.BeginTransaction())
                {                   
                    try
                    {
                        Table<mediacao> tb = context.GetTable<mediacao>();

                        tb.Context.Transaction = trans;

                        tb.InsertOnSubmit(m);
                        tb.Context.SubmitChanges();

                        foreach (mediacao_parte mp in partes)
                        {
                            Table<mediacao_parte> tbParte = context.GetTable<mediacao_parte>();
                            tbParte.Context.Transaction = trans;
                            mp.mediacao_id = m.id;
                            tbParte.InsertOnSubmit(mp);
                            tbParte.Context.SubmitChanges();
                        }                        

                        trans.Commit();
                        return true;
                    }
                    catch (Exception e)
                    {
                        message = e.Message;
                        trans.Rollback();
                        return false;
                    }
                }                
            }
        }

        public string message;

        public Table<mediacao> getTable()
        {
            dbDataContext context = getDataContext();
            Table<mediacao> tb = context.GetTable<mediacao>();
            return tb;            
        }

        public Table<mediacao_parte> getTablePartes()
        {
            dbDataContext context = getDataContext();
            Table<mediacao_parte> tb = context.GetTable<mediacao_parte>();
            return tb;
        }

        public bool Inserir(mediacao a)
        {
            // função para cadastrar
            try
            {
                Table<mediacao> tb = getTable();
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

        public bool Alterar(mediacao a)
        {
            try
            {
                dbDataContext context = getDataContext();
                Table<mediacao> tb = getTable();

                context.alteraMediacao(a.id, a.id_solicitacao, a.numero, a.tema_conflito, a.data_mediacao, a.id_mediador,
                        a.id_tipo_registro, a.objeto, a.id_local, a.documento_link, a.status, a.resolucao);
                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
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
            catch (Exception e)
            {
                message = e.Message;
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
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

    }
}