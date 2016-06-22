using System;
using BackEnd.Controllers;
using BackEnd.Models;
using System.IO;
using System.Collections.Generic;
using System.IO;
using System.Net;

namespace MedAdmin
{
    public partial class caso_mediacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TipoRegistro_Model c = new TipoRegistro_Model();

                List<tipo_registro> listaTipos = c.Listar();
                ddTipoRegistro.DataSource = listaTipos;
                ddTipoRegistro.DataValueField = "id";
                ddTipoRegistro.DataTextField = "descricao";
                ddTipoRegistro.DataBind();                

                if (Request.QueryString["ID"] != null)
                {
                    int id;
                    //recupera o id
                    id = int.Parse(Request.QueryString["ID"]);

                    // se não carregar os dados, redireciona para caso_mediacao vazio
                    if ( ! CarregarDados(id) )
                    {
                        Response.Redirect("caso_mediacao.aspx");
                    }
                }
            }
        }

        protected void btnChecarTipoReg_OnClick(object sender, EventArgs e)
        {
            if (ddTipoRegistro.SelectedIndex >= 0)
            {
                CasosMediacao_Model model = new CasosMediacao_Model();
                casos_mediacao c = new casos_mediacao();

                try
                {
                    // tenta buscar, se encontrar, roda a linha de baixo e redireciona a página para carregar e ficar o ID na url
                    c = model.Obter(int.Parse(ddTipoRegistro.SelectedValue));
                    Response.Redirect("caso_mediacao.aspx?ID="+c.id_tipo_registro.ToString());
                }
                catch
                {
                    // se não encontrar na função Obter, entra no catch e exibe a mensagem
                    LimparCampos();
                    Master.Sucesso("Nenhum registro encontrado para o tipo selecionado.");
                }
            }
        }

        protected bool CarregarDados(int id)
        {
            CasosMediacao_Model model = new CasosMediacao_Model();
            casos_mediacao c = new casos_mediacao();
            
            try
            {
                ddTipoRegistro.SelectedValue = id.ToString();

                c = model.Obter(id);

                txtTitulo.Text = c.titulo;
                txtDescricao.Value = c.descricao;
                ddPrioridade.SelectedValue = c.prioridade.ToString();
                imgImagemCarregada.ImageUrl = c.imagem_caminho + c.imagem_nome;

                Master.Sucesso("Dados carregados na tela.");

                return true;
            }
            catch
            {
                LimparCampos();
                Master.Sucesso("Nenhum registro encontrado para o tipo selecionado.");

                return false;
            }   
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            CasosMediacao_Model model = new CasosMediacao_Model();
            casos_mediacao cm = new casos_mediacao();

            if (Validar())
            {
                // pega nome da imagem e caminho
                configuracao c = new configuracao();
                Configuracao_Model mc = new Configuracao_Model();

                c = mc.Obter("medPortal");

                String caminho = c.caminho_images;
                String nome = Path.GetFileName(imgImagemCarregada.ImageUrl);
                // pega mediador logado
                mediador med = Master.GetLogado();

                cm.id_tipo_registro = int.Parse(ddTipoRegistro.SelectedValue);
                cm.titulo = txtTitulo.Text;
                cm.descricao = txtDescricao.Value;
                cm.prioridade = int.Parse(ddPrioridade.SelectedValue);
                cm.imagem_caminho = caminho;
                cm.imagem_nome = nome;
                cm.id_mediador = med.id;
                cm.data = DateTime.Now;

                if ( model.Inserir(cm))
                {
                    Master.Sucesso("Caso registrado com sucesso.");
                }
                else
                {
                    if ( model.Alterar(cm))
                    {
                        Master.Sucesso("Caso atualizado com sucesso.");
                    }
                    else
                    {
                        Master.Alerta("Erro ao registrar: " + model.message);
                    }   
                }
            }
        }

        protected bool Validar()
        {
            if (txtTitulo.Text == "")
            {
                Master.Alerta("Título não informado.");
                return false;
            }
            if (txtDescricao.Value == "")
            {
                Master.Alerta("Descrição não informada.");
                return false;
            }
            // verifica se foi selecionada imagem no FILEUPLOAD mas não foi carregada para o IMGURL
            if ((uplImagemCarregada.PostedFile != null && uplImagemCarregada.PostedFile.FileName != "")
                && (imgImagemCarregada.ImageUrl == ""))
            {
                Master.Alerta("Após selecionar a imagem, é necessário carregá-la.");
                return false;
            }
            return true;
        }

        protected void LimparCampos()
        {
            txtTitulo.Text = "";
            txtDescricao.Value = "";
            ddPrioridade.SelectedValue = "3";
            imgImagemCarregada.ImageUrl = "";
        }

        protected void btnCarregar_Click(object sender, EventArgs e)
        {
            Carregar();
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

                    //FTP Server URL.
                    string ftp = c.caminho_images;

                    //FTP Folder name. Leave blank if you want to upload to root folder.

                    byte[] fileBytes = null;

                    //Read the FileName and convert it to Byte array.
                    string fileName = Path.GetFileName(uplImagemCarregada.FileName);

                    fileBytes = uplImagemCarregada.FileBytes;

                    try
                    {
                        //Create FTP Request.
                        FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftp + fileName);
                        request.Method = WebRequestMethods.Ftp.UploadFile;

                        //Enter FTP Server credentials.
                        request.Credentials = new NetworkCredential(c.usuario_ftp, c.senha_ftp);
                        request.ContentLength = fileBytes.Length;
                        request.UsePassive = true;
                        request.UseBinary = true;
                        request.ServicePoint.ConnectionLimit = fileBytes.Length;
                        request.EnableSsl = false;

                        using (Stream requestStream = request.GetRequestStream())
                        {
                            requestStream.Write(fileBytes, 0, fileBytes.Length);
                            requestStream.Close();
                        }

                        FtpWebResponse response = (FtpWebResponse)request.GetResponse();

                        Master.Sucesso(fileName + " uploaded.<br />");
                        // exibe na tela
                        imgImagemCarregada.ImageUrl = ftp + fileName;
                        response.Close();
                    }
                    catch (WebException ex)
                    {
                        throw new Exception((ex.Response as FtpWebResponse).StatusDescription);
                    }
                }
            }
            catch (Exception error)
            {
                Master.Alerta(error.Message);
            }
        }
    }
}