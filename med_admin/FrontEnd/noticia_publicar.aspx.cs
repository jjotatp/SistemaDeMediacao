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
                        
        }

        protected void btnCarregarImagem_Click(object sender, EventArgs e)
        {
            if (uplImagemCarregada.PostedFile != null && uplImagemCarregada.PostedFile.FileName != "")
            {
                // passa a imagem para a variável uploadedImage
                //byte[] imageSize = new byte[uplImagemCarregada.PostedFile.ContentLength];
                //HttpPostedFile uploadedImage = uplImagemCarregada.PostedFile;
                //uploadedImage.InputStream.Read(imageSize, 0, (int)uplImagemCarregada.PostedFile.ContentLength);                

                // se não existe, cria a pasta IMAGES no servidor
                String caminho = Server.MapPath(@"~\Images\");
                String nome = uplImagemCarregada.FileName;
                
                // verifica se o nome do arquivo é maior que 50 caracteres
                if (nome.Length > 50)
                {
                    Master.Alerta("Nome de arquivo muito grande para carregar.");
                    return;
                }

                if ( ! Directory.Exists(caminho))
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
                imgImagemCarregada.ImageUrl = caminho+nome;                
            }
        }        

        protected void btnSalvarNoticia_Click(object sender, EventArgs e)
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
}