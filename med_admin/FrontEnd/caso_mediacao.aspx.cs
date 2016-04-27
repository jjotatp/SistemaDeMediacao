using System;
using BackEnd.Controllers;
using BackEnd.Models;
using System.IO;
using System.Collections.Generic;

namespace FrontEnd
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
                String caminho = @"..\Images\";
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
                    Master.Alerta("Erro ao registrar: " + model.message);
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
            return true;
        }

        protected void LimparCampos()
        {
            txtTitulo.Text = "";
            txtDescricao.Value = "";
            ddPrioridade.SelectedValue = "3";
            imgImagemCarregada.ImageUrl = "";
        }
    }
}