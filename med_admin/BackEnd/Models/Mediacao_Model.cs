using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;
using System.Data.Linq;
using System.Data.Common;
using Novacode;
using System.IO;

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

            // função que carrega a mediação e todos os dados vinculados a ela
            // na forma de seus objetos completos

            DataLoadOptions options = new DataLoadOptions();
            options.LoadWith<mediacao>(m => m.mediacao_partes);
            options.LoadWith<mediacao>(m => m.local);
            options.LoadWith<mediacao_parte>(mp => mp.pessoa);
            options.LoadWith<mediacao>(m => m.mediador);
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
                        a.id_tipo_registro, a.objeto, a.id_local, a.documento_link, a.status, a.resolucao, a.id_cidade);
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

        public string GerarTermo(int id_mediacao, string caminho)
        {
            try
            {
                mediacao md = new mediacao();

                md = Obter(id_mediacao);
                // nome = numero + ano
                String nome = md.numero.ToString() + "_" + md.data_mediacao.Year.ToString();
                // nome completo = caminho + nome.docx
                // ex: Desktop\002_2016.docx
                String nomeArquivo = caminho + @"\" + nome + ".docx";
                // gera o documento da mediação

                // Se o arquivo já existe, não salva novamente
                //if (File.Exists(nomeArquivo))
                //{
                //    return nomeArquivo;
                //}

                string modelo = AppDomain.CurrentDomain.BaseDirectory + "modelo_med.docx";
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
                    // informa o tema do conflito
                    document.ReplaceText("[tema_conflito]", md.tema_conflito, false);
                    // rodapé
                    document.ReplaceText("[cidade]", md.local.cidade.nome, false);
                    document.ReplaceText("[data_escrita]", md.data_mediacao.ToLongDateString(), false);

                    string partes = "", nome_partes = "", assinaturas = "";

                    int i = 0;

                    Paragraph p = null;

                    foreach (mediacao_parte mp in md.mediacao_partes)
                    {
                        p = document.InsertParagraph();

                        i++;
                        p.Append("PARTE " + i.ToString() + ": ").Bold().Append(mp.pessoa.nome.ToString() + ", ");
                        p.Append("RG: ").Bold().Append(mp.pessoa.rg + ", ");
                        p.Append("CPF: ").Bold().Append(mp.pessoa.cpf + ", ");
                        p.Append(mp.pessoa.status_civil + ", ");
                        p.Append(mp.pessoa.profissao + ", ");
                        p.Append("NASCIDO EM ").Bold().Append(DateTime.Parse(mp.pessoa.nascimento_data.ToString()).ToShortDateString() + ", ");
                        p.Append("NA CIDADE DE ").Bold().Append(mp.pessoa.cidade1.nome + " - " + mp.pessoa.cidade1.estado + ", ");
                        p.Append("DO SEXO ").Bold().Append(GetSexo(mp.pessoa.sexo.ToString()) + ", ");
                        p.Append("FILHO DE ").Bold().Append(mp.pessoa.nome_pai);
                        p.Append(" E ").Bold().Append(mp.pessoa.nome_mae + ", ");
                        p.Append("RESIDENTE NA ").Bold().Append(mp.pessoa.endereco_logradouro + " nº " +
                                                                    mp.pessoa.endereco_numero + ", " +
                                                                    mp.pessoa.endereco_bairro + ", " +
                                                                    mp.pessoa.cidade.nome + " - " + mp.pessoa.cidade.estado + ", ");
                        if ((mp.pessoa.telefone != null)&&(mp.pessoa.telefone != "")) 
                            p.Append("TELEFONE ").Bold().Append(mp.pessoa.telefone + ", ");
                        p.Append("aceitou a participar da sessão de mediação de conflito onde declarou que: ").Bold().Alignment = Alignment.both;
                        p.AppendLine(mp.descricao_caso);
                        p.AppendLine();
                        p.AppendLine();
                        //p.AppendLine("ASSINATURA (PARTE " + i.ToString() + ")");
                        //p.AppendLine();
                        //p.AppendLine();
                        p = null;

                        document.InsertParagraph("ASSINATURA (PARTE " + i.ToString() + ")").AppendLine().Alignment = Alignment.right;

                        if (i > 1)
                            partes = partes + ", " + mp.pessoa.nome;
                        else
                            partes = mp.pessoa.nome;
                        if (i > 1)
                            nome_partes = nome_partes + ", e ";
                        if (mp.pessoa.sexo == 'M')
                            nome_partes = nome_partes + "Sr. " + mp.pessoa.nome;
                        else
                            nome_partes = nome_partes + "Sra. " + mp.pessoa.nome;

                        assinaturas = assinaturas + "__________________________________" + Environment.NewLine + 
                            "RG:" + Environment.NewLine + Environment.NewLine;
                    }

                    // adiciona o nome das partes no arquivo
                    document.ReplaceText("[partes]", partes, false);

                    Paragraph p2 = document.InsertParagraph();

                    // =========== DECLARAÇÃO FINAL MEDIAÇÃO =============
                    p2.InsertPageBreakBeforeSelf();
                    p2.Append("Pelo presente Termo de \"MEDIAÇÃO\", as partes, " + nome_partes +
                    " presentes no núcleo de Mediação Comunitária do " + md.local.nome + "/" + md.local.descricao +
                    ", situado na " + md.local.logradouro + ", nº " + md.local.numero + ", " +
                    "Bairro " + md.local.bairro + ", na cidade de " + md.local.cidade.nome + " - " + md.local.cidade.estado +
                    " resolvem aceitar a adoção do " +
                    "procedimento de mediação para a resolução de conflito relatado neste instrumento de registro " +
                    "policial, obrigando - se a manter sigilo, assim como o mediador, de toda e qualquer informação, " +
                    "documentos, papéis em geral, enfim, de tudo que lhes seja apresentado ou chegue ao seu conhecimento " +
                    "em razão do procedimento de mediação aqui homologado. O descumprimento da obrigação de sigilo por " +
                    "qualquer das partes ou pelo mediador implicará em responsabilidade civil e criminal.").Alignment = Alignment.both;
                    // objeto da mediação
                    p2.AppendLine();

                    Paragraph objeto = document.InsertParagraph();
                    objeto.AppendLine("O objeto da mediação é o seguinte:").AppendLine(md.objeto).AppendLine().Alignment = Alignment.left;
                    // assinaturas
                    objeto.AppendLine(assinaturas).AppendLine();

                    Paragraph p3 = document.InsertParagraph();                    
                    
                    p3.AppendLine(md.mediador.nome).Bold();
                    p3.AppendLine(md.mediador.patente + " - Mediador").Alignment = Alignment.right;

                    // salva o documento                    

                    document.SaveAs(nomeArquivo);
                }

                return nomeArquivo;
            }
            catch (Exception e)
            {
                message = e.Message;
                return "";
            }
        }

        public string GetSexo(string sigla)
        {
            if (sigla == "M")
                return "Masculino";
            else if (sigla == "F")
                return "Feminino";
            else
                return "N/A";
        }

        public List<mediacao> Listar(String alcance)
        {
            using (dbDataContext db = getDataContext())
            {
                Table<mediacao> tb = getTable();
                // EXIBE MEDIACOES DE ACORDO COM O ALCANCE DO MEDIADOR LOGADO

                // NÃO CODIFICADO AINDA
                var query = db.ExecuteQuery<mediacao>("");
                return query.ToList();
            }
        }

        public List<v_historico_mediacao> Historico(String alcance)
        {
            IEnumerable<v_historico_mediacao> query = null;
            try
            {
                using (dbDataContext db = getDataContext())
                {
                    // EXIBE MEDIACOES DE ACORDO COM O ALCANCE DO MEDIADOR LOGADO               
                    String sql = "select m.* " +
                                 " from v_historico_mediacoes m " +
                                 " join locais l on (l.id = m.id_local) " +
                                 " where l.numero_opm like '{0}%'";
                    query = db.ExecuteQuery<v_historico_mediacao>(sql, alcance);
                    // var query = from p in db.v_historico_mediacaos orderby p.DataMediacao descending select p;
                    return query.ToList();
                }
            }
            catch (Exception error)
            {
                message = error.Message;
                return query.ToList();
            }
        }

        public int GerarProximoNumero(int id_local)
        {
            // busca o próximo número de acordo com o último inserido
            // classifica por ano e por núcleo
            int num = 0;
            try
            {
                using (dbDataContext db = getDataContext())
                {
                    var query = from n in db.mediacaos where (n.data_mediacao.Year == DateTime.Today.Year) && ( n.id_local == id_local )
                                orderby n.numero descending select n;
                    if (query.Count() > 0)
                        num = query.First().numero + 1;
                    else
                        num = 1;
                }
            }
            catch(Exception e)
            {
                message = e.Message;
            }
            return num;
        }
    }
}