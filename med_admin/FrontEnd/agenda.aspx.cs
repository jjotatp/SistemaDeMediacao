using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Controllers;
using BackEnd.Models;
using System.Web.Services;

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
                clData.SelectedDate = DateTime.Today;                
                txtData.Text = DateTime.Now.ToShortDateString();
            }            

            CarregarAgenda();
        }

        protected void CarregarAgenda()
        {
            // se a data não foi informada, pega a data de hoje
            if (txtData.Text == "")            
                txtData.Text = DateTime.Now.ToShortDateString();
            // passa a data para o título da lista, exemplo: "Domingo, 19 de fevereiro de 2016"
            txtTexto.Text = DateTime.Parse(txtData.Text).ToLongDateString();
            // passa a data carregada para o campo do formulário agendar, para quando o usuário for agendar um horário,
            // a data de hoje já esteja preenchida
            txtDataAgendar.Value = DateTime.Parse(txtData.Text).ToString("yyyy-MM-dd");
            // passa a data carregada para o calendário, para garantir que ele fique sincronizado com o txtData
            clData.SelectedDate = DateTime.Parse(txtData.Text);

            Agendamento_Model agenda = new Agendamento_Model();
            // carrega a agenda naquele dia
            gvAgenda.DataSource = agenda.ListarDia(DateTime.Parse(txtData.Text));
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
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            if (txtData.Text != "")
                txtData.Text = DateTime.Parse(txtData.Text).AddDays(-1).ToShortDateString();            
            CarregarAgenda();
        }

        protected void btnPosterior_Click(object sender, EventArgs e)
        {
            if (txtData.Text != "")
                txtData.Text = DateTime.Parse(txtData.Text).AddDays(1).ToShortDateString();            
            CarregarAgenda();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtData.Text = clData.SelectedDate.ToShortDateString();
            CarregarAgenda();
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            if (ValidaAgendamento())
            {
                Agendamento_Model model = new Agendamento_Model();

                agendamento a = new agendamento();

                DateTime dDataInicial, dDataFinal;

                dDataInicial = DateTime.Parse(txtData.Text + " " + txtHoraInicial.Value + ":00");
                dDataFinal = DateTime.Parse(txtData.Text + " " + txtHoraFinal.Value + ":00");

                a.descricao = txtDescricaoAgendamento.Value;                
                a.data_inicial = dDataInicial;
                a.data_final = dDataFinal;
                if (model.VerificarDisponibilidade(a))
                {
                    if (model.Inserir(a))
                    {
                        Master.Sucesso("Horário agendado com sucesso.");
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
            if (txtData.Text == "")
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
    }
}