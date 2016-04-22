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
    public partial class casos_mediacao_lista : System.Web.UI.Page
    {
        public List<casos_mediacao> listaCasos = new List<casos_mediacao>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }

            Listar();
        }

        protected void Listar()
        {
            CasosMediacao_Model model = new CasosMediacao_Model();

            listaCasos = model.ListarPrioridade();
        }
    }
}