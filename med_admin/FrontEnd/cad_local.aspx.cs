using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class cad_local : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            // cadastrar cidade
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

            // se tiver ID preenche o parâmetro
            if (Request.QueryString["ID"] != null)
                local.id = int.Parse(Request.QueryString["ID"]);

            // faz a inserção ou atualização do cadastro da cidade
            if (model.InserirAtualizar(local))
                Response.Redirect("cad_local.aspx");

            
        }
    }
}