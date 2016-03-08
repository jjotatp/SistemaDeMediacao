using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd
{
    public partial class med_admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OcultaAlerta();
            OcultaSucesso();
            // Alerta é mensagem vermelha
            // Sucesso é mensagem verde
        }

        public void EditaCadastro(GridViewCommandEventArgs e, int id, String telaCadastro)
        {            
            // deve verificar se o botão EDITAR foi clicado
            if (e.CommandName == "Editar")
            {
                String url = telaCadastro + ".aspx?ID=" + id.ToString();
                Response.Redirect(url);
            }
        }

        public void Alerta(String msg)
        {
            lblTextoAlerta.Text = msg;
            pnlAlerta.Style.Remove("display");            
        }
        
        public void OcultaAlerta()
        {
            pnlAlerta.Style.Add("display", "none");
            lblTextoAlerta.Text = "";
        }

        public void Sucesso(String msg)
        {
            lblTextoSucesso.Text = msg;
            pnlSucesso.Style.Remove("display");
        }

        public void OcultaSucesso()
        {
            pnlSucesso.Style.Add("display", "none");
            lblTextoSucesso.Text = "";
        }

    }
}