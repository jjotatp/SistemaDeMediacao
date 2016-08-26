using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;
using System.IO;
using System.Globalization;

namespace MedAdmin
{
    public partial class detail_mediacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                //recupera o id
                CarregarDados(int.Parse(Request.QueryString["ID"].ToString()));
            }
            else
            {
                Voltar();
            }
        }

        protected void btnGerar_Click(object sender, EventArgs e)
        {
            Gerar();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Voltar();
        }

        protected bool CarregarDados(int id)
        {
            try
            {
                Mediacao_Model model = new Mediacao_Model();
                mediacao med = new mediacao();

                med = model.Obter(id);

                // verifica se tem permissão de visualizar o local da mediação
                if ( ! Master.VerificarAlcance(med.local.numero_opm) )
                    Response.Redirect("historico_mediacoes.aspx");

                txtNumero.Text = med.numero.ToString();
                txtData.Text = med.data_mediacao.ToShortDateString();
                txtHora.Text = med.data_mediacao.ToShortTimeString();
                txtTemaConflito.Text = med.tema_conflito;
                txtTipoRegistro.Text = med.tipo_registro.descricao;
                txtStatus.Text = model.getStatus(med.status);
                lstPartes.Items.Clear();
                foreach (mediacao_parte mp in med.mediacao_partes)
                {
                    lstPartes.Items.Add(mp.pessoa.nome);
                }
                txtObjetoMediacao.Text = med.objeto;
                if (med.resolucao == 'A')
                    txtResolucao.Text = "Acordo entre as partes";
                else
                    txtResolucao.Text = "Desacordo entre as partes";
                txtMediador.Text = med.mediador.nome;

                // somente permite abrir uma nova mediação a partir daquela se status = pendente
                btnNovaMediacao.Visible = (med.status == Mediacao_Model.STATUS_PENDENTE);                

                PreencherAcompanhamentos();

                return true;
            }
            catch (Exception e)
            {
                Master.Alerta(e.Message);
                return false;
            }
        }

        protected void Gerar()
        {
            try
            {
                Mediacao_Model model = new Mediacao_Model();
                int id = int.Parse(Request.QueryString["ID"].ToString());
                string arquivo = "";
                String caminho = Server.MapPath(@"Documents\");

                //string caminho = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
                if (!Directory.Exists(caminho))
                {
                    Directory.CreateDirectory(caminho);
                }

                arquivo = model.GerarTermo(id, caminho);

                if (arquivo != "")
                {
                    // se o arquivo foi gerado faz a solicitação de download para o cliente
                    var file = new FileInfo(arquivo);

                    Response.Clear();
                    Response.AddHeader("Content-Disposition", "attachment; filename="
                                                              + HttpUtility.UrlEncode(file.Name));
                    Response.AddHeader("Content-Length", file.Length.ToString(CultureInfo.InvariantCulture));
                    Response.ContentType = "application/octet-stream";
                    Response.WriteFile(file.FullName);
                    Response.Flush();
                    Response.End();

                    //Master.Sucesso("Arquivo gerado e salvo em: " + arquivo);
                }
                else
                {
                    Master.Alerta("Erro: " + model.message);
                }
            }
            catch (Exception Exc)
            {
                Master.Alerta("Erro: " + Exc.Message);
            }
        }

        protected void Voltar()
        {
            Response.Redirect("historico_mediacoes.aspx");
        }

        protected void btnNovaMediacao_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["ID"].ToString());
            if (AdicionarPessoasMediacaoSessao(id))
                Response.Redirect("cad_mediacao.aspx");
            else
                Master.Alerta("Não foi possível abrir uma nova mediação a partir desta.");
        }

        protected bool AdicionarPessoasMediacaoSessao(int idMediacao)
        {
            // busca as pessoas daquela sessao e insere na lista
            try
            {                
                List<pessoa> lista = new List<pessoa>();                

                Mediacao_Model modelMed = new Mediacao_Model();

                lista = modelMed.ListarPartes(idMediacao);

                if (lista.Count > 0)
                {
                    // limpa sessão
                    Session.Remove("mediacao_partes");
                    // atribui a lista para a sessão novamente
                    Session["mediacao_partes"] = lista;
                    return true;
                }
                else
                    return false;
            }
            catch (Exception e)
            {
                Master.Alerta(e.Message);
                return false;
            }
        }

        protected void gdvAcompanhamentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Arquivar")
            {
                // recupera a linha clicada no gridview
                int linha = Convert.ToInt32(e.CommandArgument);
                // recupera o id na linha clicada
                Int32 id = (Int32)gdvAcompanhamentos.DataKeys[linha].Value;

                Mediacao_Model model = new Mediacao_Model();
                if (!model.ArquivarAcompanhamento(id))
                    Master.Alerta(model.message);
                else
                    PreencherAcompanhamentos();
            }
        }

        protected void PreencherAcompanhamentos()
        {
            Mediacao_Model model = new Mediacao_Model();
            int id = int.Parse(Request.QueryString["ID"].ToString());

            // verifica se a mediação tem acompanhamentos
            if (model.VerificarAcompanhamentos(id))
            {
                gdvAcompanhamentos.Visible = true;
                lblTituloAcomp.Visible = true;

                gdvAcompanhamentos.DataSource = model.ListarAcompanhamentos(id);
                gdvAcompanhamentos.DataBind();

                if (gdvAcompanhamentos.Rows.Count > 0)
                {
                    gdvAcompanhamentos.UseAccessibleHeader = true;
                    gdvAcompanhamentos.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            else
            {
                gdvAcompanhamentos.Visible = false;
                lblTituloAcomp.Visible = false;
            }                
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {            
            Mediacao_Model model = new Mediacao_Model();
            int id = int.Parse(Request.QueryString["ID"].ToString());
            acompanhamento a = new acompanhamento();

            a.id_mediacao = id;
            a.id_mediador = Master.GetLogado().id;
            a.verificacao = txtVerificacao.Value;
            a.data = DateTime.Now;

            if (model.InserirAcompanhamento(a))
            {
                PreencherAcompanhamentos();

                // limpa o texto do acompanhamento para quando for inserir um novo acompanhamento
                txtVerificacao.Value = "";
            }
            else
                Master.Alerta(model.message);
        }        
    }
}