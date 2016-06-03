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

            if (ddStatus.SelectedValue == "0")
            {
                listaDepoimentos = model.Listar();
            }
            else
            {
                listaDepoimentos = model.Listar(int.Parse(ddStatus.SelectedValue));
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Listar();
        }
    }
}