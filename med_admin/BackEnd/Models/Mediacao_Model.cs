using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;
using System.Data.Linq;
using System.Data.Common;

using Novacode;

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
                        
                        if (m.id_agendamento != null)
                        {
                            context.atualizaStatus(m.id_agendamento);
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

        public mediacao Obter(int id)
        {
            dbDataContext db = new dbDataContext();

            DataLoadOptions options = new DataLoadOptions();
            options.LoadWith<mediacao>(m => m.mediacao_partes);
            options.LoadWith<mediacao>(m => m.local);
            options.LoadWith<mediacao_parte>(mp => mp.pessoa);
            db.LoadOptions = options;
            var query = from m in db.mediacaos where m.id == id select m;

            return query.FirstOrDefault();
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

                context.alteraMediacao(a.id, a.id_agendamento, a.numero, a.tema_conflito, a.data_mediacao, a.id_mediador,
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

        public bool GerarTermoDoc(int id_mediacao, string caminho)
        {
            try
            {
                
                //CORRIGIR O ERRO PARA CARREGAR TODOS OS DADOS DA MEDIACAO

                mediacao md = new mediacao();

                md = Obter(id_mediacao);              

                // caminho + numero + ano .docx
                // ex: Desktop\002_2016.docx
                String nomeArquivo = caminho + @"\" + md.numero.ToString() + "_" + md.data_mediacao.Year.ToString() + ".docx";
                // gera o documento da mediação
                
                string modelo = AppDomain.CurrentDomain.BaseDirectory + @"\modelo_med.docx";
                using (DocX document = DocX.Load(modelo))
                {
                    // adiciona o nome do batalhão no arquivo
                    document.ReplaceText("[batalhao]", md.local.nome, false);
                    // adiciona o nome da companhia no arquivo
                    document.ReplaceText("[companhia]", md.local.descricao, false);
                    // adiciona o numero da mediação no arquivo
                    document.ReplaceText("[numero]", md.numero.ToString(), false);
                    // adiciona o ano no arquivo
                    document.ReplaceText("[ano]", md.data_mediacao.Year.ToString(), false);
                    // adiciona o nome das partes no arquivo
                    
                    string partes = "", nome_partes = "", assinaturas = "";

                    int i = 0;

                    Paragraph p = null;

                    foreach (mediacao_parte mp in md.mediacao_partes)
                    {
                        partes = partes + mp.pessoa.nome + Environment.NewLine;

                        i++;
                        p.Append("PARTE " + i.ToString() + ": ").Bold().Append(mp.pessoa.nome + ", ");
                        p.Append("RG: ").Bold().Append(mp.pessoa.rg + ", ");
                        p.Append("CPF: ").Bold().Append(mp.pessoa.cpf + ", ");
                        p.Append(mp.pessoa.status_civil + ", ");
                        p.Append(mp.pessoa.profissao + ", ");
                        p.Append("NASCIDO EM ").Bold().Append(DateTime.Parse(mp.pessoa.nascimento_data.ToString()).ToShortDateString() + ", ");
                        p.Append("NA CIDADE DE ").Bold().Append(mp.pessoa.cidade.nome + " - " + mp.pessoa.cidade.estado + ", ");
                        p.Append("DO SEXO ").Bold().Append(GetSexo(mp.pessoa.sexo.ToString()) + ", ");
                        p.Append("FILHO DE ").Bold().Append(mp.pessoa.nome_pai);
                        p.Append(" E ").Bold().Append(mp.pessoa.nome_mae + ", ");
                        p.Append("RESIDENTE NA ").Bold().Append(mp.pessoa.endereco_logradouro + " nº " +
                                                                    mp.pessoa.endereco_numero + ", " +
                                                                    mp.pessoa.endereco_bairro + ", " +
                                                                    mp.pessoa.cidade1.nome + " - " + mp.pessoa.cidade1.estado + ", ");
                        p.Append("TELEFONE ").Bold().Append(mp.pessoa.telefone + ", ");
                        p.Append("aceitou a participar da sessão de mediação de conflito onde declarou que: ");
                        p.AppendLine(mp.descricao_caso);
                        p.AppendLine();
                        p.AppendLine("ASSINATURA (PARTE " + i.ToString() + ")").Alignment = Alignment.right;
                        p.AppendLine();

                        if (i > 1)
                            nome_partes = nome_partes + ", e ";
                        if (mp.pessoa.sexo == 'M')
                            nome_partes = nome_partes + "Sr. " + mp.pessoa.nome;
                        else
                            nome_partes = nome_partes + "Sra. " + mp.pessoa.nome;

                        assinaturas = assinaturas + "__________________________________" + Environment.NewLine + "RG:" + Environment.NewLine;
                    }
                    // informa as partes
                    document.ReplaceText("[partes]", partes , false);
                    // informa o tema do conflito
                    document.ReplaceText("[tema_conflito]", md.tema_conflito, false);
                    // informa as qualificações
                    document.ReplaceText("[qualificacao]", p.Text, true);
                    // informa os nomes das partes
                    document.ReplaceText("[nome_partes]", nome_partes, false);
                    // informa endereço do local
                    document.ReplaceText("[endereco_local]", md.local.logradouro, false);
                    document.ReplaceText("[numero_local]", md.local.numero, false);
                    document.ReplaceText("[bairro_local]", md.local.bairro, false);
                    document.ReplaceText("[cidade_local]", md.local.cidade.nome + " - " + md.local.cidade.estado, false);
                    document.ReplaceText("[objeto_mediacao]", md.objeto, false);
                    document.ReplaceText("[assinaturas]", assinaturas, false);

                    // salva o documento
                    document.SaveAs(nomeArquivo);
                }

                return true;
            }
            catch (Exception e)
            {
                message = e.Message;
                return false;
            }
        }

        public string GetSexo(string sigla)
        {
            if (sigla == "M")
                return "Masculino";
            else
                return "Feminino"; 
        }

        public List<mediacao> Listar()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<mediacao> tb = getTable();
                return tb.ToList();
            }
        }

        public List<v_historico_mediacao> Historico()
        {
            using (dbDataContext db = getDataContext())
            {
                Table<v_historico_mediacao> tb = db.GetTable<v_historico_mediacao>();
                return tb.ToList();
            }
        }

    }
}