﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class noticias : System.Web.UI.Page
    {
        public List<noticia> listaNoticias = new List<noticia>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.GetNivelPermissao() < Mediador_Model.PERM_ADMIN)
            {
                Response.Redirect("index.aspx");
            }

            Listar();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Listar();

            // inserir o foreach dentro de um update panel e carregar aqui
            updtPanel.Update();
        }

        protected void Listar()
        {
            Noticia_Model model = new Noticia_Model();

            if (txtDataInicioAtividade.Value != "")
            {
                listaNoticias = model.Listar(DateTime.Parse(txtDataInicioAtividade.Value), txtTitulo.Text);
            }
            else
            {
                listaNoticias = model.Listar(txtTitulo.Text);
            }
        }
    }
}