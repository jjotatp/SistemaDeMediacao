﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BackEnd.Controllers;
using System.Data.Linq;

namespace BackEnd.Models
{
    public class Local_Model 
    {
        public String message;       

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
                    db.alteraLocal(a.id, a.nome, a.descricao, a.id_cidade, a.bairro, a.logradouro,
                                    a.numero, a.CEP, a.data_inicio_atividade, a.telefone, a.ativo, a.numero_opm);
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

        public local Obter(int id)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<local> tb = db.GetTable<local>();
                return tb.First(p => p.id == id);
            }
        }

        
        public List<local> Listar(String alcance)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<local> tb = getTable();
                String sSql = "select * from locais where (ativo = 1) ";

                // ALCANCE/NUMERO_OPM
                alcance = alcance + "%";
                sSql = sSql + " and ( numero_opm like {0} )";

                var query = db.ExecuteQuery<local>(sSql,alcance);
                return query.ToList();
            }
        }

        public List<local> Listar(int idCidade)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<local> tb = getTable();
                String sSql = "select * from locais where (ativo = 1) ";

                // cidade
                sSql = sSql + " and ( id_cidade = {0} )";

                var query = db.ExecuteQuery<local>(sSql, idCidade);
                return query.ToList();
            }
        }

        public List<v_nucleo> ListarPorNome(String Nome, String alcance, Boolean SomenteAtivos)
        {
            message = "";
            try
            {
                using (dbDataContext db = getDataContext())
                {
                    Nome = "%" + Nome + "%";
                    
                    string sSql = " select * from v_nucleos where ( Descricao like {0} )";
                    if (SomenteAtivos)
                    {
                         sSql = sSql + " and ( ativo = 1 )";
                    }

                    alcance = alcance + "%";
                    sSql = sSql + " and ( numero_opm like {1} )";
                    var query = db.ExecuteQuery<v_nucleo>(sSql, Nome, alcance);
                    return query.ToList();
                }
            }
            catch (Exception e)
            {
                message = e.Message;
                return null;
            }

        }

        public List<v_locais_endereco> ListarComEnderecoNaDesc(int idCidade = 0)
        {
            try
            {
                String sql = "select le.* from v_locais_endereco le join locais l on (le.ID = l.id) where ( l.ativo = 1 )";
                if (idCidade > 0)
                {
                    sql = sql + " and ( l.id_cidade = {0} )";
                }
                dbDataContext db = getDataContext();
                var query = db.ExecuteQuery<v_locais_endereco>(sql);

                return query.ToList();
            }
            catch (Exception e)
            {
                message = e.Message;
                return null;
            }
        }
    }
}