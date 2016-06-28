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
        public List<depoimento> listaDep = new List<depoimento>();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtNome.MaxLength = 30;
            Listar();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Salvar();
        }

        protected void Salvar()
        {
            Depoimento_Model model = new Depoimento_Model();
            depoimento dp = new depoimento();

            dp.nome = txtNome.Value;
            dp.idade = int.Parse(txtIdade.Value);
            dp.descricao = txtDepoimento.Value;
            dp.data = DateTime.Now;
            dp.status = 1;
    
            if (model.Inserir(dp))
            {
                Limpar();
                Master.Sucesso("Depoimento registrado com sucesso! Aguarde a aprovação para que ele seja exibido na listagem principal.");
            }
        }

        protected void Limpar()
        {
            txtDepoimento.Value = "";
            txtIdade.Value = "";
            txtNome.Value = "";
        }

        protected void Listar()
        {
            Depoimento_Model model = new Depoimento_Model();
            listaDep = model.Listar(2);
        }
    }
}