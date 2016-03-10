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
            // função para cadastrar cidade
            try
            {
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

                db.alteraAgendamento(a.id, a.id_solicitacao, a.descricao, a.data);
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

        public bool Excluir(agendamento a)
        {
            try
            {
                String sql = "delete from agendamentos where id = {0}";
                dbDataContext db = getDataContext();
                db.ExecuteCommand(sql, a.id);

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public bool VerificarDisponibilidade(agendamento a)
        {// verifica se a próxima hora a partir do horário do agendamento está livre. Retorna TRUE se o horário estiver livre
            // retorna FALSE se o horário estiver já ocupado
            // e retorna FALSE + MESSAGE se houver erro na busca
            try
            {
                String sql = "select * from agendamentos where data between {0} and {1}";
                dbDataContext db = getDataContext();
                DateTime DataMaxima = a.data.AddHours(1);
                var qry = db.ExecuteQuery<agendamento>(sql, a.data,DataMaxima);

                message = "";
                if (qry.Count() < 1)
                    return true;
                else
                    return false;                
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }
    }
}