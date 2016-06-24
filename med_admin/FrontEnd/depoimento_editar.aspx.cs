using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class depoimento_editar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.GetNivelPermissao() < Mediador_Model.PERM_ADMIN)
            {
                Response.Redirect("index.aspx");
            }

            if (!IsPostBack)
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
        }

        protected void CarregarDados(int id)
        {
            Depoimento_Model model = new Depoimento_Model();
            depoimento d = new BackEnd.Controllers.depoimento();
            try
            {
                d = model.Obter(id);

                txtDescricao.Text = d.descricao.ToString();
                txtIdade.Text = d.idade.ToString();
                txtRodape.Text = d.nome.ToString();
            }
            catch { }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Depoimento_Model model = new Depoimento_Model();
            depoimento d = new depoimento();
            // salva o depoimento e volta a tela de depoimentos
            try
            {
                d.descricao = txtDescricao.Text;
                d.idade = int.Parse(txtIdade.Text);
                d.nome = txtRodape.Text;
                d.data = DateTime.Now;
                d.id = int.Parse(Request.QueryString["ID"].ToString());
                d.status = 2; // STATUS 2 = APROVADO E PUBLICADO

                mediador med = new mediador();
                med = Master.GetLogado();
                d.id_mediador = med.id;
                if (model.Alterar(d))
                {
                    Response.Redirect("depoimentos.aspx");
                }
                else
                {
                    Master.Alerta("Erro ao editar: " + model.message);
                }
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
            med = Master.GetLogado();
            // recusa e arquiva o depoimento e volta a tela de depoimentos
            try
            {
                d = model.Obter(int.Parse(Request.QueryString["ID"].ToString()));
                d.id_mediador = med.id;
                d.data = DateTime.Now;
                d.status = 3; // STATUS 3 = RECUSADO E ARQUIVADO

                if (model.Alterar(d))
                {
                    Response.Redirect("depoimentos.aspx");
                }
                else
                {
                    Master.Alerta("Erro ao arquivar: " + model.message);
                }
            }
            catch (Exception Erro)
            {
                Master.Alerta(Erro.Message);
            }
        }
    }
}