using System;
using BackEnd.Controllers;
using BackEnd.Models;
using System.IO;
using System.Collections.Generic;
using System.IO;
using System.Net;
using BackEnd;

namespace MedAdmin
{
    public partial class caso_mediacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.GetNivelPermissao() < Mediador_Model.PERM_ADMIN)
            {
                Response.Redirect("index.aspx");
            }

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
            if (uplImagemCarregada.PostedFile != null && uplImagemCarregada.PostedFile.FileName != "")
            {
                Configuracao_Model model = new Configuracao_Model();

                // cria as variáveis que serão passadas por referência
                String fileName = Path.GetFileName(uplImagemCarregada.FileName);
                bool enviado = false;

                // chama a função passando as variáveis de referência. O retorno é a mensagem de sucesso ou erro
                String msg = model.EnviarArquivoServidor(ref fileName, uplImagemCarregada.FileBytes, ref enviado);

                // verifica se foi enviado e exibe a mensagem e a imagem na tela
                if (enviado)
                {
                    Master.Sucesso(msg);
                    imgImagemCarregada.ImageUrl = fileName;
                }
                else
                    Master.Alerta(msg);
            }
        }
    }
}