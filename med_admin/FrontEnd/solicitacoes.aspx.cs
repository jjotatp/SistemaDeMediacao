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
    public partial class solicitacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // carrega os dados na lista de solicitações
                PreencherGrid();
            }
        }

        protected void PreencherGrid()
        {
            Solicitacao_Model model = new Solicitacao_Model();

            gdvLista.DataSource = model.Listar();
            gdvLista.DataBind();

            gdvLista.UseAccessibleHeader = true;
            gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void gdvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }
    }
}