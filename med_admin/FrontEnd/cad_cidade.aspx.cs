using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class cad_cidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // MAXIMO DE CARACTERES NOME DA CIDADE
                txtNome.MaxLength = 100;

                // declara ID e verifica se existe ID no txtID ou no endereço
                int id = 0;

                if (txtID.Text != "Novo")
                {
                    // recupera o id
                    try
                    {
                        id = int.Parse(txtID.Text);
                    }
                    catch (Exception)
                    {
                        Master.Alerta("Erro ao carregar o cadastro.");
                    }
                }

                if (Request.QueryString["ID"] != null)
                {
                    //recupera o id
                    id = int.Parse(Request.QueryString["ID"]);
                    txtID.Text = id.ToString();
                }

                // se houver ID informado, então carrega o registro do ID informado
                if (id != 0)
                {
                    try
                    {
                        // declara o objeto model
                        Cidade_Model model = new Cidade_Model();
                        //recupera o produto do id informado
                        cidade cidade = model.Obter(id);

                        //preencher caixas de texto com valores de produto
                        txtNome.Text = cidade.nome;
                        ddUF.Items.FindByText(cidade.estado);
                    }
                    catch (Exception)
                    {
                        Master.Alerta("Registro não encontrado.");
                    }
                }
                else
                {
                    txtID.Text = "Novo";
                }
            }
        }        

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            // cadastrar cidade
            cidade cidade = new cidade();
            cidade.nome = txtNome.Text;
            cidade.estado = ddUF.Text;

            Cidade_Model model = new Cidade_Model();
            if (txtNome.Text != "")
            {
                // se tiver ID preenche o parâmetro
                if (txtID.Text != "Novo")                
                    cidade.id = int.Parse(txtID.Text);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(cidade))
                {
                    Master.Sucesso("Registro salvo com sucesso.");
                    txtID.Text = cidade.id.ToString();
                }
                else
                    Master.Alerta("Erro ao salvar o registro");
            }
            else
            {
                Master.Alerta("Campo nome é obrigatório.");
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_cidade.aspx");
        }

        protected void LimpaCampos()
        {
            txtNome.Text = "";
            ddUF.SelectedIndex = 0;
        }

        protected void btnListar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("lista_cidade.aspx");
        }
    }
}