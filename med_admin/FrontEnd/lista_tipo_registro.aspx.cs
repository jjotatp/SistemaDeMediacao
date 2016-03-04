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
    public partial class lista_tipo_registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // LIMITE MAXIMO DE CARACTERES DO TIPO REGISTRO
                txtDescricao.MaxLength = 50;
                PreencherGrid();
            }
        }

        protected void PreencherGrid()
        {
            TipoRegistro_Model model = new TipoRegistro_Model();

            // asp:repeater
            gdvLista.DataSource = model.Listar();
            gdvLista.DataBind();

            gdvLista.UseAccessibleHeader = true;
            gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            TipoRegistro_Model model = new TipoRegistro_Model();

            gdvLista.DataSource = model.ListarPorDescricao(txtDescricao.Text);
            gdvLista.DataBind();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_tipo_registro.aspx");
        }

        protected void gdvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id na linha clicada
            Int32 id = (Int32)gdvLista.DataKeys[linha].Value;
            //função que abre o registro em modo de edição
            Master.EditaCadastro(e, id, "cad_tipo_registro");
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }
    }
}