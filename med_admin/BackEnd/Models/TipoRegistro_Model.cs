using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class TipoRegistro_Model
    {

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<tipo_registro> getTable()
        {
            dbDataContext db = getDataContext();
            Table<tipo_registro> tb = db.GetTable<tipo_registro>();
            return tb;
        }

        public bool InserirAtualizar(tipo_registro a)
        {
            // função para cadastrar tipo_registro
            try
            {
                Table<tipo_registro> tb = getTable();
                dbDataContext db = getDataContext();

                if (a.id == 0)
                {
                    tb.InsertOnSubmit(a);
                    tb.Context.SubmitChanges();
                }
                else
                {
                    db.alteraTipoRegistro(a.id, a.descricao);
                    tb.Context.SubmitChanges();
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Alterar(tipo_registro a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<tipo_registro> tb = getTable();

                db.alteraTipoRegistro(a.id, a.descricao);
                tb.Context.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public tipo_registro Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<tipo_registro> tb = db.GetTable<tipo_registro>();
                return tb.First(p => p.id == id);
            }
        }

        public List<tipo_registro> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<tipo_registro> tb = getTable();
                return tb.ToList();
            }
        }

        public List<v_total_tipos_registro> Totalizar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<v_total_tipos_registro> tb = db.GetTable<v_total_tipos_registro>();
                return tb.ToList();
            }
        }

        public List<v_total_tipos_registro> Totalizar(String sDataIni, String sDataFim, int idLocal, bool bTodosLocais)
        {
            using (dbDataContext db = getDataContext())
            {
                IEnumerable<v_total_tipos_registro> query;
                String sSql = " select t.ID, t.DESCRICAO, " +
                            "( select COUNT(*) " +
                            "from mediacoes m where (m.id_tipo_registro = t.id)";
                if ((sDataIni != "") && (sDataFim != ""))
                {
                    sSql = sSql + "and ( m.data_mediacao between {0} and {1}) ";

                    if ( ! bTodosLocais ){
                        sSql = sSql + "and (m.id_local = {2}) ";
                    }                       
                    sSql = sSql + " ) as TOTAL from tipos_registro t order by t.DESCRICAO";
                    query = db.ExecuteQuery<v_total_tipos_registro>(sSql, DateTime.Parse(sDataIni + " 00:00:00"), DateTime.Parse(sDataFim + " 23:59:59"), idLocal);
                }
                else if (sDataIni != "")
                {
                    sSql = sSql + "and (m.data_mediacao >= {0})";

                    if (!bTodosLocais)
                    {
                        sSql = sSql + "and (m.id_local = {1}) ";
                    }
                    sSql = sSql + " ) as TOTAL from tipos_registro t order by t.DESCRICAO";

                    query = db.ExecuteQuery<v_total_tipos_registro>(sSql, DateTime.Parse(sDataIni + " 00:00:00"), idLocal);
                }
                else if (sDataFim != "")
                {
                    sSql = sSql + "and (m.data_mediacao <= {0})";

                    if (!bTodosLocais)
                    {
                        sSql = sSql + "and (m.id_local = {1}) ";
                    }
                    sSql = sSql + " ) as TOTAL from tipos_registro t order by t.DESCRICAO";

                    query = db.ExecuteQuery<v_total_tipos_registro>(sSql, DateTime.Parse(sDataFim + " 23:59:59"),idLocal);
                }
                else
                {
                    if (!bTodosLocais)
                    {
                        sSql = sSql + "and (m.id_local = {0}) ";
                    }
                    sSql = sSql + " ) as TOTAL from tipos_registro t order by t.DESCRICAO";
                    
                    query = db.ExecuteQuery<v_total_tipos_registro>(sSql,idLocal);
                }                
                return query.ToList();
            }
        }

        public List<tipo_registro> ListarPorDescricao(string s)
        {
            using (dbDataContext db = getDataContext())
            {
                String sSql = "select * from tipos_registro t where t.descricao like '%" + s + "%' ";
                var query = db.ExecuteQuery<tipo_registro>(sSql);
                return query.ToList();
            }
        }
    }
}