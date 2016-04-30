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
    public partial class depoimentos : System.Web.UI.Page
    {
        public List<depoimento> listaDepoimentos = new List<depoimento>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
            }

            Listar();
        }

        protected void Listar()
        {
            Depoimento_Model model = new Depoimento_Model();

            listaDepoimentos = model.Listar();
        }
    }
}