using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class noticia_publicar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // CARREGAR NOTÍCIA PEGANDO O ID NO GET
                CarregarNoticia();
            }
        }

        protected void CarregarNoticia()
        {
            if (Request.QueryString["ID"] != null)
            {
                int id = int.Parse(Request.QueryString["ID"]);

                Noticia_Model m = new Noticia_Model();
                noticia nt = new noticia();

                nt = m.Obter(id);

                txtTituloNoticia.Text = nt.titulo_postagem;
                edtNoticia.Value = nt.corpo_noticia;
                ddPrioridade.SelectedValue = nt.prioridade.ToString();

                String url = nt.imagem_caminho + nt.imagem_nome;

                imgImagemCarregada.ImageUrl = url;

                btnSalvarNoticia.Text = "Salvar Notícia";
            }
            else
            {
                btnSalvarNoticia.Text = "Publicar Notícia";
            }
        }

        protected void btnCarregarImagem_Click(object sender, EventArgs e)
        {
            Carregar();
        }        

        protected void btnSalvarNoticia_Click(object sender, EventArgs e)
        {
            // Validar se esta editando ou postando nova
            //    se estiver editando, alterar somente titulo, texto e imagem, mantendo a data
            try
            {
                if (Validar())
                {
                    // pega apenas o nome do arquivo para poder remontar o caminho para o servidor
                    String caminho = @"Images\";
                    String nome = Path.GetFileName(imgImagemCarregada.ImageUrl);

                    // declara objeto noticia
                    noticia n = new noticia();
                    // declara objeto noticia_model
                    Noticia_Model model = new Noticia_Model();
                    // pega o mediador logado
                    mediador med = Session["med"] as mediador;

                    n.titulo_postagem = txtTituloNoticia.Text;
                    n.corpo_noticia = edtNoticia.Value;
                    n.imagem_caminho = caminho;
                    n.imagem_nome = nome;
                    n.prioridade = int.Parse(ddPrioridade.SelectedValue);

                    if (Request.QueryString["ID"] != null)
                    {
                        // se tem ID, altera
                        int id = int.Parse(Request.QueryString["ID"]);

                        n.id = id;
                        n.data_edicao = DateTime.Now;
                        n.id_local_edicao = med.id_local;
                        n.id_mediador_edicao = med.id;

                        if (model.Alterar(n))
                        {
                            Master.Sucesso("Notícia alterada!");
                            Response.Redirect("noticias.aspx");
                        }
                        else
                        {
                            Master.Alerta("Erro: " + model.message);
                        }
                    }
                    else
                    {
                        // se não tem ID, insere
                        n.data_postagem = DateTime.Now;
                        n.id_local = med.id_local;
                        n.id_mediador = med.id;

                        if (model.Inserir(n))
                        {
                            Master.Sucesso("Notícia postada!");
                            Response.Redirect("noticias.aspx");
                        }
                        else
                        {
                            Master.Alerta("Erro: " + model.message);
                        }
                    }
                }
            }
            catch (Exception Exc)
            {
                Master.Alerta("Erro: " + Exc.Message);
            }
        }

        protected void Carregar()
        {
            try
            {
                if (uplImagemCarregada.PostedFile != null && uplImagemCarregada.PostedFile.FileName != "")
                {
                    configuracao c = new configuracao();
                    Configuracao_Model mc = new Configuracao_Model();

                    c = mc.Obter("medPortal");
                    // se não existe, cria a pasta IMAGES no servidor
                    String caminho = Server.MapPath(@"Images\");
                    String caminho2 = c.caminho_images; //@"C:\\programas\T C C\med_admin\MedPortal\Images\";
                    String nome = uplImagemCarregada.FileName;

                    // verifica se o nome do arquivo é maior que 50 caracteres
                    if (nome.Length > 50)
                    {
                        Master.Alerta("Nome de arquivo muito grande para carregar.");
                        return;
                    }

                    if (!Directory.Exists(caminho))
                    {
                        Directory.CreateDirectory(caminho);
                    }
                    if (!Directory.Exists(caminho2))
                    {
                        Directory.CreateDirectory(caminho2);
                    }

                    String arquivo = caminho + nome;
                    String arquivo2 = caminho2 + nome;

                    // salva a imagem carregada apenas se ela não está salva
                    if (!File.Exists(arquivo))
                    {
                        uplImagemCarregada.SaveAs(arquivo);
                        uplImagemCarregada.SaveAs(arquivo2);
                    }
                    caminho = @"Images\";
                    arquivo = caminho + nome;
                    imgImagemCarregada.ImageUrl = arquivo;
                }
            }
            catch (Exception error)
            {
                Master.Alerta(error.Message);
            }
        }

        protected bool Validar()
        {
            // verifica se foi selecionada imagem no FILEUPLOAD mas não foi carregada para o IMGURL
            if ( (uplImagemCarregada.PostedFile != null && uplImagemCarregada.PostedFile.FileName != "")
                && ( imgImagemCarregada.ImageUrl == "" ) )
            {
                Master.Alerta("Após selecionar a imagem, é necessário carregá-la.");
                return false;
            }
            return true;
        }
    }
}