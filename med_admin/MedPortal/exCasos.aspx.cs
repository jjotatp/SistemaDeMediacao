using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Models;
using BackEnd.Controllers;

namespace FrontEnd
{
    public partial class exCasos : System.Web.UI.Page
    {
        public List<casos_mediacao> casos = new List<casos_mediacao>();
        public int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            i = 0;
            Listar();
        }

        protected void Listar()
        {
            CasosMediacao_Model model = new CasosMediacao_Model();
            casos = model.ListarSite();
        }
    }
}