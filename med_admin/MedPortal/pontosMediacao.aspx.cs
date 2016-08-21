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
    public partial class pontosMediacao : System.Web.UI.Page
    {
        public List<v_nucleo> listaNucleos = new List<v_nucleo>();
        public int i;

        protected void Page_Load(object sender, EventArgs e)
        {
            i = 0;
            Listar();
        }

        protected void Listar()
        {
            Local_Model model = new Local_Model();
            listaNucleos = model.ListarPorNome("", "",true);
        }
    }
}