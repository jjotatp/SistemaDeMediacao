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
    public partial class noticias : System.Web.UI.Page
    {
        public List<noticia> listaNoticias = new List<noticia>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDataInicioAtividade.Value = DateTime.Today.ToString("yyyy-MM-dd");
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