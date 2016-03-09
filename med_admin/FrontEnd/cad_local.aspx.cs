using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class cad_local : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // tamanho dos campos de acordo com o banco de dados
                txtNome.MaxLength = 100;
                txtDescricao.MaxLength = 50;
                txtBairro.MaxLength = 50;
                txtLogradouro.MaxLength = 100;
                txtNumero.MaxLength = 10;
                txtCEP.MaxLength = 9;
                txtDataInicioAtividade.MaxLength = 10;
                txtTelefone.MaxLength = 20;
            
                // carrega cidades
                Cidade_Model c = new Cidade_Model();
                ddCidade.DataSource = c.Listar();
                ddCidade.DataValueField = "id";
                ddCidade.DataTextField = "nome";
                ddCidade.DataBind();
                ddCidade.SelectedIndex = 0;

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
                        Local_Model model = new Local_Model();
                        //recupera o produto do id informado
                        local local = model.Obter(id);

                        //preencher caixas de texto com valores de produto
                        txtID.Text = local.id.ToString();
                        txtNome.Text = local.nome;
                        txtDescricao.Value = local.descricao;
                        txtNumero.Value = local.numero;
                        txtLogradouro.Value = local.logradouro;
                        txtBairro.Value = local.bairro;
                        txtDataInicioAtividade.Text = DateTime.Parse(local.data_inicio_atividade.ToString()).ToShortDateString(); ;
                        txtCEP.Text = local.CEP;
                        txtTelefone.Text = local.telefone;
                        cbbAtivo.Checked = local.ativo;
                        ddCidade.SelectedValue = local.id_cidade.ToString();                        
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
            //se a função valida retornar True, então permite cadastrar ou alterar o registro
            if ( Valida() ) {
                local local = new local();
                local.nome = txtNome.Text;
                local.descricao = txtDescricao.Value;
                local.id_cidade = Int32.Parse(ddCidade.SelectedValue);
                local.bairro = txtBairro.Value;
                local.logradouro = txtLogradouro.Value;
                local.numero = txtNumero.Value;
                local.CEP = txtCEP.Text;
                local.telefone = txtTelefone.Text;
                if (txtDataInicioAtividade.Text != "")
                {
                    local.data_inicio_atividade = DateTime.Parse(txtDataInicioAtividade.Text);
                }                
                local.ativo = cbbAtivo.Checked;

                Local_Model model = new Local_Model();

                // se tiver ID preenche o parâmetro
                if (txtID.Text != "Novo")
                    local.id = int.Parse(txtID.Text);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(local))
                {
                    txtID.Text = local.id.ToString();
                    Master.Sucesso("Registro salvo com sucesso.");
                }else
                    Master.Alerta("Erro ao salvar o registro");
            }            
        }

        protected bool Valida()
        {
            if ( txtNome.Text == "" )
            {
                Master.Alerta("Nome inválido ou não informado");
                return false;
            }
            if (txtLogradouro.Value == "")
            {
                Master.Alerta("Logradouro inválido ou não informado");
                return false;
            }
            if (txtNumero.Value == "")
            {
                Master.Alerta("Número inválido ou não informado");
                return false;
            }
            if (txtCEP.Text == "")
            {
                Master.Alerta("CEP inválido ou não informado");
                return false;
            }
            
            return true;
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_local.aspx");
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("lista_local.aspx");
        }
    }
}