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
    public partial class cad_pessoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtCPF_TextChanged(object sender, EventArgs e)
        {
            lblAlertaCPF.Text = "";
            // ESTE CÓDIGO É EXECUTADO QUANDO A SELEÇÃO SAI DO CAMPO CPF
            // DEVE VERIFICAR SE EXISTE PESSOA COM ESSE CPF CADASTRADA, SE SIM, TRAZ OS DADOS
            Pessoa_Model model = new Pessoa_Model();

            if (model.ValidaCPF(txtCPF.Text))
            {
                lblAlertaCPF.Text = "CPF válido e não cadastrado";
            }
            else
            {
                pessoa p = new pessoa();
                p = model.Obter(txtCPF.Text);

                // carrega os dados buscados                

                Master.Sucesso("Dados carregados com sucesso");
            }
        }
    }
}