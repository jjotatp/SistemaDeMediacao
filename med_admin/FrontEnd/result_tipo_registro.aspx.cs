using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class result_tipo_registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.GetNivelPermissao() < Mediador_Model.PERM_AVANCADO)
            {
                Response.Redirect("index.aspx");
            }

            cbTodos.Visible = (Master.GetNivelPermissao() >= Mediador_Model.PERM_ADMIN);      // Admin

            if (!IsPostBack)
            {
                // carrega nucleos de mediacao
                Local_Model l = new Local_Model();
                ddLocal.DataSource = l.Listar(Master.GetAlcancePermissao());
                ddLocal.DataValueField = "id";
                ddLocal.DataTextField = "descricao";
                ddLocal.DataBind();
                ddLocal.SelectedIndex = 0;

                PreencherGrid();
            }
        }

        protected void PreencherGrid()
        {
            TipoRegistro_Model model = new TipoRegistro_Model();
  
            gdvLista.DataSource = model.Totalizar(txtDataIni.Value, txtDataFim.Value, Int32.Parse(ddLocal.SelectedValue), cbTodos.Checked);
  
            gdvLista.DataBind();

            if (gdvLista.Rows.Count > 0)
            {
                gdvLista.UseAccessibleHeader = true;
                gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            PreencherGrid();
        }
    }
}