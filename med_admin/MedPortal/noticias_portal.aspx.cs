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
    public partial class noticias : System.Web.UI.Page
    {
        public List<noticia> listaNoticias = new List<noticia>();
        public int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            i = 0;
            Listar();
        }

        protected void Listar()
        {
            Noticia_Model model = new Noticia_Model();
            listaNoticias = model.ListarSite();
        }
    }
}