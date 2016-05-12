using System;
using BackEnd.Controllers;
using BackEnd.Models;
using System.Web.UI.WebControls;

namespace FrontEnd
{
    public partial class historico_mediacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                PreencherGrid();
            }
        }

        protected void PreencherGrid()
        {
            Mediacao_Model model = new Mediacao_Model();

            gdvLista.DataSource = model.Historico();
            gdvLista.DataBind();

            if (gdvLista.Rows.Count > 0)
            {
                gdvLista.UseAccessibleHeader = true;
                gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gdvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            Int32 id = (Int32)gdvLista.DataKeys[linha].Value;

            if (e.CommandName == "Detalhes")
            {
                Response.Redirect("detail_mediacao.aspx?ID=" + id.ToString());
            }
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }
    }
}