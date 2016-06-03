using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Controllers;
using BackEnd.Models;
using System.Web.Services;

namespace MedAdmin
{
    public partial class agenda : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // pega a data de hoje
                clData.SelectedDate = DateTime.Today;                
            }            

            CarregarAgenda();
        }

        protected void CarregarAgenda()
        {
            // passa a data para o título, exemplo: "Domingo, 19 de fevereiro de 2016"
            txtTexto.Text = clData.SelectedDate.ToLongDateString();

            Agendamento_Model agenda = new Agendamento_Model();
            // carrega a agenda naquele dia
            gvAgenda.DataSource = agenda.ListarDia(clData.SelectedDate);
            gvAgenda.DataBind();
            if (gvAgenda.Rows.Count > 0)
            {
                gvAgenda.UseAccessibleHeader = true;
                gvAgenda.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }      

        protected void gvAgenda_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            Int32 id = (Int32)gvAgenda.DataKeys[linha].Value;           

            if (e.CommandName == "Apagar")
            {
                agendamento a = new agendamento();
                Agendamento_Model model = new Agendamento_Model();
                // busca o agendamento selecionado
                a = model.Obter(id);

                if ( model.Excluir(a))
                {
                    Master.Sucesso("Agendamento excluído com sucesso");
                    CarregarAgenda();
                }
                else
                {
                    Master.Alerta("Erro ao excluír o agendamento. Erro:" + model.message);
                }
            }
            else if(e.CommandName == "Mediacao")
            {
                // deve abrir o cadastro de pessoa com o parametro AGEND
                // para quando abrir o cadastro ele salvar na sessão               
                Response.Redirect("cad_pessoa.aspx?AGEND="+id.ToString());
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {            
            CarregarAgenda();
        }

        protected void LimparAgendamento()
        {
            txtDataAgendar.Value = "";
            txtHoraInicial.Value = "";
            txtHoraFinal.Value = "";
            txtDescricaoAgendamento.Value = "";
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            if (ValidaAgendamento())
            {
                Agendamento_Model model = new Agendamento_Model();

                agendamento a = new agendamento();

                DateTime dDataInicial, dDataFinal;

                dDataInicial = DateTime.Parse(txtDataAgendar.Value + " " + txtHoraInicial.Value + ":00");
                dDataFinal = DateTime.Parse(txtDataAgendar.Value + " " + txtHoraFinal.Value + ":00");                

                a.descricao = txtDescricaoAgendamento.Value;                
                a.data_inicial = dDataInicial;
                a.data_final = dDataFinal;
                if (model.VerificarDisponibilidade(a))
                {
                    if (model.Inserir(a))
                    {
                        Master.Sucesso("Horário agendado com sucesso.");
                        LimparAgendamento();
                        CarregarAgenda();
                    }
                    else
                    {
                        Master.Alerta("Erro ao agendar horário. Erro: " + model.message);
                    }
                }
                else
                {
                    // se model.message estiver vazio, então ele retornou false pois o horário está vago,
                    // se nao, houve erro na consulta
                    if (model.message == "")
                    {
                        Master.Alerta("O horário escolhido já está agendado, selecione outro horário.");
                    }
                    else
                    {
                        Master.Alerta("Erro ao agendar horário. Erro: " + model.message);
                    }
                }
            }
        }

        public bool ValidaAgendamento()
        {
            if (txtDataAgendar.Value == "")
            {
                Master.Alerta("Data inválida ou não informada.");
                return false;
            }
            if (txtHoraInicial.Value == "")
            {
                Master.Alerta("Hora inicial inválida ou não informada.");
                return false;
            }
            if (txtHoraFinal.Value == "")
            {
                Master.Alerta("Hora final ou não informada.");
                return false;
            }
            // se a data incial for maior que a data final, gera erro
            if (TimeSpan.Parse(txtHoraInicial.Value) > TimeSpan.Parse(txtHoraFinal.Value))
            {
                Master.Alerta("Hora inicial maior que a hora final.");
                return false;
            }
            if (txtDescricaoAgendamento.Value == "")
            {
                Master.Alerta("Descrição do agendamento inválida ou não informada.");
                return false;
            }
            return true;         
        }

        public bool VerificarFinalizado(int i)
        {
            return (i == 1);
        }

        protected void gvAgenda_RowDataBound(object sender, GridViewRowEventArgs e)
        {            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (!VerificarFinalizado(int.Parse(Convert.ToString(DataBinder.Eval(e.Row.DataItem,"status")))) )
                {
                    LinkButton lbtn = (LinkButton)e.Row.FindControl("btnVisualizar");
                    lbtn.Visible = false;
                }
                else
                {
                    LinkButton lbtn1 = (LinkButton)e.Row.FindControl("btnMediacao");
                    lbtn1.Visible = false;
                    LinkButton lbtn2 = (LinkButton)e.Row.FindControl("btnExcluir");
                    lbtn2.Visible = false;
                }
            }
        }
    }
}