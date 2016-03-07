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

            gdvLista.DataSource = model.ListarPorTexto("Nome","");
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Solicitacao_Model model = new Solicitacao_Model();

            if (ddTipoBusca.Text == "Nome")
            {
                gdvLista.DataSource = model.ListarPorTexto("Nome", txtBusca.Value);                
            }
            else if (ddTipoBusca.Text == "Data")
            {
                gdvLista.DataSource = model.ListarPorData(DateTime.Parse(txtBusca.Value));                
            }
            else if(ddTipoBusca.Text == "Cidade")
            {
                gdvLista.DataSource = model.ListarPorTexto("Cidade",txtBusca.Value);                
            }
            else
            {
                gdvLista.DataSource = model.ListarPorTexto("Local",txtBusca.Value);
            }
            gdvLista.DataBind();

        }
    }
}