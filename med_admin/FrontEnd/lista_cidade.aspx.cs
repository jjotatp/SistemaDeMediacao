using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class lista_cidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                // LIMITE MAXIMO DE CARACTERES DO NOME DA CIDADE
                txtNomeCidade.MaxLength = 100;

                PreencherGrid();
            }
        }

        protected void PreencherGrid()
        {
            Cidade_Model model = new Cidade_Model();

            // asp:repeater
            gdvCidades.DataSource = model.Listar();
            gdvCidades.DataBind();

            if (gdvCidades.Rows.Count > 0) { 
                gdvCidades.UseAccessibleHeader = true;
                gdvCidades.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btnBuscarCidade_Click(object sender, EventArgs e)
        {
            Cidade_Model model = new Cidade_Model();

            gdvCidades.DataSource = model.ListarPorNome(txtNomeCidade.Text);
            gdvCidades.DataBind();
        }

        protected void gdvCidades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                // recupera a linha clicada no gridview
                int linha = Convert.ToInt32(e.CommandArgument);
                // recupera o id na linha clicada
                Int32 id = (Int32)gdvCidades.DataKeys[linha].Value;
                //função que abre o registro em modo de edição
                Master.EditaCadastro(e, id, "cad_cidade");
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_cidade.aspx");
        }

        protected void gdvCidades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvCidades.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }
    }
}