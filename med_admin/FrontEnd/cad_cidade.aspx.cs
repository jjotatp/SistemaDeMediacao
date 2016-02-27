using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class cad_cidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            cidade.estado = ddUF.Text;

            CidadeModel model = new CidadeModel();
            if (txtNome.Text != "")
            {
                // se tiver ID preenche o parâmetro
                if (Request.QueryString["ID"] != null)
                    cidade.id = int.Parse(Request.QueryString["ID"]);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(cidade))
                    Response.Redirect("cad_cidade.aspx");
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_cidade.aspx");
        }
    }
}