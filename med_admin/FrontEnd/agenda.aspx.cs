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
    public partial class agenda : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //PessoaModel p = new PessoaModel();
                //// atribui uma lista de dentistas para o DropDown
                //ddDentistas.DataSource = p.ListarDentistas();
                //ddDentistas.DataValueField = "id";
                //ddDentistas.DataTextField = "nome";
                //ddDentistas.DataBind();
                //ddDentistas.SelectedIndex = 0;

                // pega a data de hoje
                txtData.Value = DateTime.Now.ToShortDateString();
            }

            // verifica qual foi o botão que fez o PostBack e realiza as alterações
            string parameter = Request["__EVENTARGUMENT"];
            if (parameter == "anterior")
            {
                if (txtData.Value != "")
                    txtData.Value = DateTime.Parse(txtData.Value).AddDays(-1).ToShortDateString();
            }
            else if (parameter == "posterior")
            {
                if (txtData.Value != "")
                    txtData.Value = DateTime.Parse(txtData.Value).AddDays(1).ToShortDateString();
            }
            // exibe a data em formato longo, ou seja, por escrito
            if (txtData.Value != "")
                txtTexto.Text = DateTime.Parse(txtData.Value).ToLongDateString();
            Agendamento_Model agenda = new Agendamento_Model();
            // carrega a agenda do dentista na data selecionada
            gvAgenda.DataSource = agenda.ListarDia(DateTime.Parse(txtData.Value));
                //dModel.Agenda(Int32.Parse(ddDentistas.SelectedValue), DateTime.Parse(txtData.Value));
            gvAgenda.DataBind();
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agendamento.aspx");
        }

        protected void btnCarregaAgenda_Click(object sender, EventArgs e)
        {

        }

        protected void gvAgenda_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            Int32 id = (Int32)gvAgenda.DataKeys[linha].Value;
            String tipo = gvAgenda.DataKeys[linha][1].ToString();
            
        }
    }
}