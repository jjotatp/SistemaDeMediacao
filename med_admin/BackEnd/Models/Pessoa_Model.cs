using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Pessoa_Model
    {
        public String message;

        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<pessoa> getTable()
        {
            dbDataContext db = getDataContext();
            Table<pessoa> tb = db.GetTable<pessoa>();
            return tb;
        }

        public bool Inserir(pessoa a)
        {
            // função para cadastrar cidade
            try
            {
                Table<pessoa> tb = getTable();
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

        public bool Alterar(pessoa a)
        {
            try
            {
                //Table<cidade> tb = getTable();
                dbDataContext db = getDataContext();
                Table<pessoa> tb = getTable();

                db.alteraPessoa(a.cpf, a.rg, a.nome, a.status_civil, a.profissao, a.nascimento_data,
                                a.nascimento_cidade, a.sexo, a.nome_pai, a.nome_mae, a.endereco_logradouro,
                                a.endereco_numero, a.endereco_bairro, a.endereco_cidade, a.telefone);
                tb.Context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public pessoa Obter(String cpf)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<pessoa> tb = db.GetTable<pessoa>();
                return tb.First(p => p.cpf == cpf);
            }
        }

        public bool ValidaCPF(string cpf)
        {
            using (dbDataContext db = getDataContext())
            {

                String sSql = "select P.* from pessoas P where P.cpf = {0} ";
                var query = db.ExecuteQuery<pessoa>(sSql,cpf);
                return (query.Count() < 1);
            }
        }        
    }
}