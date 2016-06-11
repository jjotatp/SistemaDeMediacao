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
    public partial class textoNoticias : System.Web.UI.Page
    {
        public noticia ntc = new noticia();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                //recupera o id
                CarregarDados(int.Parse(Request.QueryString["ID"].ToString()));
            }
            else
            {
                Voltar();
            }
        }

        protected bool CarregarDados(int id)
        {
            try
            {
                Noticia_Model model = new Noticia_Model();

                ntc = model.Obter(id);

                return true;
            }
            catch (Exception e)
            {
                Master.Alerta(e.Message);
                return false;
            }
        }

        protected void Voltar()
        {
            Response.Redirect("noticias_portal.aspx");
        }
    }
}