using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class cad_cidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ddUF.Items.Clear();
            ddUF.Items.Add("AC");
            ddUF.Items.Add("AL");
            ddUF.Items.Add("AP");
            ddUF.Items.Add("AM");
            ddUF.Items.Add("BA");
            ddUF.Items.Add("CE");
            ddUF.Items.Add("DF");
            ddUF.Items.Add("ES");
            ddUF.Items.Add("GO");
            ddUF.Items.Add("MA");
            ddUF.Items.Add("MT");
            ddUF.Items.Add("MS");
            ddUF.Items.Add("MG");
            ddUF.Items.Add("PA");
            ddUF.Items.Add("PB");
            ddUF.Items.Add("PR");
            ddUF.Items.Add("PE");
            ddUF.Items.Add("PI");
            ddUF.Items.Add("RJ");
            ddUF.Items.Add("RN");
            ddUF.Items.Add("RS");
            ddUF.Items.Add("RO");
            ddUF.Items.Add("RR");
            ddUF.Items.Add("SC");
            ddUF.Items.Add("SP");
            ddUF.Items.Add("SE");
            ddUF.Items.Add("TO");
            ddUF.SelectedIndex = 0;

            if (Request.QueryString["ID"] != null && !IsPostBack)
            {
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara o objeto model
                Cidade_Model model = new Cidade_Model();
                //recupera o produto do id informado
                cidade cidade = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtNome.Text = cidade.nome;
                ddUF.Items.FindByText(cidade.estado);
            }
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            // listar cidades
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            // cadastrar cidade
            cidade cidade = new cidade();
            cidade.nome = txtNome.Text;
            cidade.estado = ddUF.SelectedValue;

            Cidade_Model model = new Cidade_Model();
            if (txtNome.Text != "")
            {
                // se tiver ID preenche o parâmetro
                if (Request.QueryString["ID"] != null)
                    cidade.id = int.Parse(Request.QueryString["ID"]);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(cidade))                                       
                    Master.Sucesso("Registro salvo com sucesso.");
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
    }
}