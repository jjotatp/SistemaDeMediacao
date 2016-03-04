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
    public partial class lista_local : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNome.MaxLength = 100;

                PreencherGrid();               
            }
        }

        protected void PreencherGrid()
        {
            Local_Model model = new Local_Model();

            gdvLista.DataSource = model.Listar();
            gdvLista.DataBind();

            gdvLista.UseAccessibleHeader = true;
            gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Local_Model model = new Local_Model();

            gdvLista.DataSource = model.ListarPorNome(txtNome.Text);
            gdvLista.DataBind();
        }

        protected void gdvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                // recupera a linha clicada no gridview
                int linha = Convert.ToInt32(e.CommandArgument);
                // recupera o id na linha clicada
                Int32 id = (Int32)gdvLista.DataKeys[linha].Value;
                //função que abre o registro em modo de edição
                Master.EditaCadastro(e, id, "cad_local");
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_local.aspx");
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }
    }
}