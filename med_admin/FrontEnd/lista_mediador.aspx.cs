﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class lista_mediador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNome.MaxLength = 100;
            }
        }

        protected void PreencherGrid()
        {
            Mediador_Model model = new Mediador_Model();

            // asp:repeater
            gdvLista.DataSource = model.Listar();
            gdvLista.DataBind();

            gdvLista.UseAccessibleHeader = true;
            gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Mediador_Model model = new Mediador_Model();

            gdvLista.DataSource = model.ListarPorNome(txtNome.Text);
            gdvLista.DataBind();
        }

        protected void gdvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id na linha clicada
            Int32 id = (Int32)gdvLista.DataKeys[linha].Value;
            //função que abre o registro em modo de edição
            Master.EditaCadastro(e, id, "cad_mediador");
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_mediador.aspx");
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }
    }
}