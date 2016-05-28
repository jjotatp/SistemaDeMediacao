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

namespace FrontEnd
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

                txtNumero.Text = med.numero.ToString();
                txtData.Text = med.data_mediacao.ToShortDateString();
                txtHora.Text = med.data_mediacao.ToShortTimeString();
                txtTemaConflito.Text = med.tema_conflito;
                txtTipoRegistro.Text = med.tipo_registro.descricao;
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

                return true;
            }catch (Exception e)
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

                arquivo = model.GerarTermoDoc(id, caminho);

                if (arquivo != "")
                {
                    // se o arquivo foi gerado e salvo na pasta do servidor, faz a solicitação de download para o cliente
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
    }
}