using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class cad_local : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.GetNivelPermissao() < Mediador_Model.PERM_ADMIN)
            {
                Response.Redirect("index.aspx");
            }

            if (!IsPostBack)
            {
                // tamanho dos campos de acordo com o banco de dados
                txtNome.MaxLength = 100;
                txtDescricao.MaxLength = 50;
                txtBairro.MaxLength = 50;
                txtLogradouro.MaxLength = 100;
                txtNumero.MaxLength = 10;
                txtCEP.MaxLength = 9;
                txtOPM.MaxLength = 9;
                //txtDataInicioAtividade.MaxLength = 10;
                txtTelefone.MaxLength = 20;
            
                // carrega cidades
                Cidade_Model c = new Cidade_Model();
                ddCidade.DataSource = c.Listar();
                ddCidade.DataValueField = "id";
                ddCidade.DataTextField = "nome";
                ddCidade.DataBind();
                ddCidade.SelectedIndex = 0;

                cbbAtivo.Checked = true;

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

                        // verifica se tem permissão de editar o local acessado
                        if ( ! Master.VerificarAlcance(local.numero_opm) )
                          Response.Redirect("index.aspx");

                        //preencher caixas de texto com valores de produto
                        txtID.Text = local.id.ToString();
                        txtOPM.Text = local.numero_opm;
                        txtNome.Text = local.nome;
                        txtDescricao.Value = local.descricao;
                        txtNumero.Value = local.numero;
                        txtLogradouro.Value = local.logradouro;
                        txtBairro.Value = local.bairro;
                        txtDataInicioAtividade.Value = DateTime.Parse(local.data_inicio_atividade.ToString()).ToString("yyyy-MM-dd");                        
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
                local.numero_opm = txtOPM.Text;
                local.nome = txtNome.Text;
                local.descricao = txtDescricao.Value;
                local.CEP = txtCEP.Text;
                local.logradouro = txtLogradouro.Value;
                local.numero = txtNumero.Value;
                local.bairro = txtBairro.Value;
                local.id_cidade = Int32.Parse(ddCidade.SelectedValue);                                                
                local.telefone = txtTelefone.Text;
                if (txtDataInicioAtividade.Value != "")
                {
                    local.data_inicio_atividade = DateTime.Parse(txtDataInicioAtividade.Value);
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
                    Master.Alerta("Erro ao salvar o registro: "+model.message);
            }            
        }

        protected bool Valida()
        {
            if ( txtNome.Text == "" )
            {
                Master.Alerta("Nome inválido ou não informado");
                return false;
            }
            if (txtCEP.Text == "")
            {
                Master.Alerta("CEP inválido ou não informado");
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