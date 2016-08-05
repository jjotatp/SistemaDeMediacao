using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Agendamento_Model
    {
        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<agendamento> getTable()
        {
            dbDataContext db = getDataContext();
            Table<agendamento> tb = db.GetTable<agendamento>();
            return tb;
        }

        public bool Inserir(agendamento a)
        {
            // função para cadastrar agendamento
            try
            {
                // busca o mediador para ver o local dele
                Mediador_Model mModel = new Mediador_Model();
                mediador med = new mediador();
                med = mModel.Obter(a.id_mediador);

                // então registra o local do mediador logado no agendamento
                a.id_local = med.id_local;

                a.ativo = true;

                Table<agendamento> tb = getTable();
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

        public bool Alterar(agendamento a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<agendamento> tb = getTable();

                db.alteraAgendamento(a.id, a.id_solicitacao, a.descricao, a.data_inicial, a.data_final,a.id_mediador,a.id_local, a.ativo);
                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public agendamento Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<agendamento> tb = db.GetTable<agendamento>();
                return tb.First(p => p.id == id);
            }
        }

        public bool Arquivar(agendamento a)
        {
            try
            {
                a.ativo = false;
                return Alterar(a);
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public bool VerificarDisponibilidade(agendamento a, local nucleo)
        {// verifica se a próxima hora a partir do horário do agendamento está livre. Retorna TRUE se o horário estiver livre
            // retorna FALSE se o horário estiver já ocupado
            // e retorna FALSE + MESSAGE se houver erro na busca
            try
            {
                String sql = "select * from agendamentos where ( id_local = {0} ) and ( ativo = 1 ) and " +
                             "( ( data_inicial between {1} and {2} ) or ( data_final between {1} and {2} ) " +
                             "or ( data_inicial = {3} ) or ( data_final = {4} ) )";
                dbDataContext db = getDataContext();                
                var qry = db.ExecuteQuery<agendamento>(sql, nucleo.id, a.data_inicial.AddMinutes(1),a.data_final.AddMinutes(-1)
                                            ,a.data_inicial,a.data_final);
                message = "";

                return (qry.Count() < 1);                
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public List<agendamento> ListarDia(DateTime Dia, local nucleo)
        {
            List<agendamento> lista = new List<agendamento>();
            try
            {
                dbDataContext db = getDataContext();
                string sSql;
                sSql = " select * from agendamentos " +
                        " where data_inicial between '" + Dia.ToShortDateString() + "' and '" + (Dia.AddDays(1)).ToShortDateString() + "' " +
                        " and ( id_local = {0} ) and ( ativo = 1 )" +
                        " order by data_inicial";
                var query = db.ExecuteQuery<agendamento>(sSql, nucleo.id);
                lista = query.ToList();
                return lista;
            }
            catch (Exception e)
            {
                message = e.Message;
                return lista;
            }
        }
    }
}