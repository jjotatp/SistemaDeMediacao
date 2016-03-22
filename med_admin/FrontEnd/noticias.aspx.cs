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

        protected void Page_Load(object sender, EventArgs e)
        {
            Noticia_Model model = new Noticia_Model();

            listaNoticias = model.Listar();        
            
        }
    }
}