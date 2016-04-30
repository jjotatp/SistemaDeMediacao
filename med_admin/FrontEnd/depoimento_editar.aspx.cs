using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
{
    public partial class depoimento_editar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                // se foi informado ID então carrega os dados
                CarregarDados(int.Parse(Request.QueryString["ID"].ToString()));
            }
            else
            {
                // se não, redireciona para a lista
                Response.Redirect("depoimentos.aspx");
            }
        }

        protected void CarregarDados(int id)
        {
            Depoimento_Model model = new Depoimento_Model();
            depoimento d = new depoimento();
            try
            {
                d = model.Obter(id);

                txtDescricao.Value = d.descricao;
                txtIdade.Value = d.idade.ToString();
                txtRodape.Text = d.nome;
            }
            catch { }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Depoimento_Model model = new Depoimento_Model();
            depoimento d = new depoimento();
            mediador med = new mediador();
            // salva o depoimento e volta a tela de depoimentos
            try
            {
                d.descricao = txtDescricao.Value;
                d.idade = int.Parse(txtIdade.Value);
                d.nome = txtRodape.Text;

                med = Master.GetLogado();

                d.id_mediador = med.id;
                d.data = DateTime.Now;
                d.status = 1; // STATUS 1 = APROVADO E PUBLICADO

                model.Alterar(d);
            }
            catch ( Exception Erro )
            {
                Master.Alerta(Erro.Message);
            }
        }

        protected void btnRecusar_Click(object sender, EventArgs e)
        {
            Depoimento_Model model = new Depoimento_Model();
            depoimento d = new depoimento();
            mediador med = new mediador();
            // recusa e arquiva o depoimento e volta a tela de depoimentos
            try
            {
                d = model.Obter(int.Parse(Request.QueryString["ID"].ToString()));

                med = Master.GetLogado();

                d.id_mediador = med.id;
                d.data = DateTime.Now;
                d.status = 2; // STATUS 2 = RECUSADO E ARQUIVADO

                model.Alterar(d);
            }
            catch (Exception Erro)
            {
                Master.Alerta(Erro.Message);
            }
        }
    }
}