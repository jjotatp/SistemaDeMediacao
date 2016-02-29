using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class cad_local : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // carrega cidades
            Cidade_Model c = new Cidade_Model();
            ddCidade.DataSource = c.Listar();
            ddCidade.DataValueField = "id";
            ddCidade.DataTextField = "nome";
            ddCidade.DataBind();
            ddCidade.SelectedIndex = 0;

            // declara ID e verifica se existe ID no txtID ou no endereço
            int id = 0;

            if ( (txtID.Value != "") && !IsPostBack)
            {
                // recupera o id
                id = int.Parse(txtID.Value);
            }

            if ((Request.QueryString["ID"] != null && !IsPostBack))
            {
                //recupera o id
                id = int.Parse(Request.QueryString["ID"]);
                txtID.Value = id.ToString();
            }

            // se houver ID informado, então carrega o registro do ID informado
            if ( id != 0)
            {
                try {
                    // declara o objeto model
                    Local_Model model = new Local_Model();
                    //recupera o produto do id informado
                    local local = model.Obter(id);

                    //preencher caixas de texto com valores de produto
                    txtID.Value = local.id.ToString();
                    txtNome.Text = local.nome;
                    txtDescricao.Value = local.descricao;
                    txtNumero.Value = local.numero;
                    txtLogradouro.Value = local.logradouro;
                    txtBairro.Value = local.bairro;
                    txtDataInicioAtividade.Value = local.data_inicio_atividade.ToString();
                    txtCEP.Text = local.CEP;
                    cbbAtivo.Checked = local.ativo;
                    ddCidade.SelectedValue = local.id_cidade.ToString();
                }
                catch (Exception)
                {
                    Master.Alerta("Registro não encontrado.");
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {           
            //se a função valida retornar True, então permite cadastrar ou alterar o registro
            if ( Valida() ) {
                local local = new local();
                local.nome = txtNome.Text;
                local.descricao = txtDescricao.InnerText;
                local.id_cidade = Int32.Parse(ddCidade.SelectedValue);
                local.bairro = txtBairro.Value;
                local.logradouro = txtLogradouro.Value;
                local.numero = txtNumero.Value;
                local.CEP = txtCEP.Text;
                local.data_inicio_atividade = DateTime.Parse(txtDataInicioAtividade.Value);
                local.ativo = cbbAtivo.Checked;

                Local_Model model = new Local_Model();

                // se tiver ID no campo oculto preenche o parâmetro
                if (txtID.Value != "")
                    local.id = int.Parse(txtID.Value);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(local))
                    Master.Sucesso("Registro salvo com sucesso.");

                else
                    Master.Alerta("Erro ao salvar o registro");
            }            
        }

        protected void LimparCampos()
        {
            txtID.Value = "";
            txtNome.Text = "";
            txtDescricao.Value = "";
            txtNumero.Value = "";
            txtLogradouro.Value = "";
            txtBairro.Value = "";
            txtDataInicioAtividade.Value = "";
            txtCEP.Text = "";
            cbbAtivo.Checked = true;
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
    }
}