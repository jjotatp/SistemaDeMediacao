using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class noticia_publicar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // CARREGAR NOTÍCIA PEGANDO O ID NO GET
                if (Request.QueryString["ID"] != null)
                {
                    btnSalvarNoticia.Text = "Salvar Notícia";

                    int id = int.Parse(Request.QueryString["ID"]);
                    Noticia_Model m = new Noticia_Model();
                    noticia nt = new noticia();

                    nt = m.Obter(id);

                    txtTituloNoticia.Text = nt.titulo_postagem;
                    edtNoticia.Value = nt.corpo_noticia;

                    // continuar aqui, carregar a imagem que é trazida do banco

                    String url = nt.imagem_caminho + nt.imagem_nome;

                    imgImagemCarregada.ImageUrl = url;
                }
                else
                {
                    btnSalvarNoticia.Text = "Publicar Notícia";
                }
            }
        }

        protected void btnCarregarImagem_Click(object sender, EventArgs e)
        {
            Carregar();
        }        

        protected void btnSalvarNoticia_Click(object sender, EventArgs e)
        {
            if (Validar())
            {
                // pega apenas o nome do arquivo para poder remontar o caminho para o servidor
                String caminho = @"..\Images\";
                String nome = Path.GetFileName(imgImagemCarregada.ImageUrl);

                // declara objeto noticia
                noticia n = new noticia();
                // declara objeto noticia_model
                Noticia_Model model = new Noticia_Model();
                // pega o mediador logado
                mediador med = Session["med"] as mediador;

                n.titulo_postagem = txtTituloNoticia.Text;
                n.corpo_noticia = edtNoticia.Value;
                n.data_postagem = DateTime.Now;
                n.id_local = med.id_local;
                n.id_mediador = med.id;
                n.imagem_caminho = caminho;
                n.imagem_nome = nome;

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

        protected void Carregar()
        {
            try
            {
                if (uplImagemCarregada.PostedFile != null && uplImagemCarregada.PostedFile.FileName != "")
                {
                    // se não existe, cria a pasta IMAGES no servidor
                    String caminho = Server.MapPath(@"~\Images\");
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

                    String arquivo = caminho + nome;

                    // salva a imagem carregada apenas se ela não está salva
                    if (!File.Exists(arquivo))
                    {
                        uplImagemCarregada.SaveAs(arquivo);
                    }
                    // ajusta o nome para o imageurl aceitar
                    caminho = @"..\Images\";
                    arquivo = caminho + nome;
                    // carrega a imagem no componente Image
                    imgImagemCarregada.ImageUrl = caminho + nome;
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

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("noticias.aspx");
        }
    }
}