using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd
{
    public partial class caso_mediacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddTipoRegistro_SelectedIndexChanged(object sender, EventArgs e)
        {
            // ao modificar o item selecionado, busca os dados na tabela Casos_mediacao e retorna na tela
        }
    }
}