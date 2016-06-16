using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class solicitacoes : System.Web.UI.Page
    {        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // carrega os dados na lista de solicitações
                PreencherGrid();
                PreencherCentros();
                OcultaDescSoli();                
            }                      
        }        

        protected void PreencherCentros()
        {
            // preenche o combo que será utilizado para transferir a solicitação
            Local_Model model = new Local_Model();

            ddLocal.DataSource = model.Listar();
            ddLocal.DataValueField = "id";
            ddLocal.DataTextField = "descricao";
            ddLocal.DataBind();
            ddLocal.SelectedIndex = 0;
        }

        protected void PreencherGrid()
        {
            Solicitacao_Model model = new Solicitacao_Model();

            if (ddTipoBusca.Text == "Nome")
            {
                gdvLista.DataSource = model.ListarPorTexto("Nome", txtBusca.Value);
            }
            else if (ddTipoBusca.Text == "Data")
            {
                DateTime data = new DateTime();
                if (DateTime.TryParse(txtData.Value, out data))
                {
                    gdvLista.DataSource = model.ListarPorData(data);
                }
                else
                {
                    Master.Alerta("Data inválida.");
                }
            }
            else if (ddTipoBusca.Text == "Cidade")
            {
                gdvLista.DataSource = model.ListarPorTexto("Cidade", txtBusca.Value);
            }
            else
            {
                gdvLista.DataSource = model.ListarPorTexto("Local", txtBusca.Value);
            }
            gdvLista.DataBind();

            if (gdvLista.Rows.Count > 0)
            {
                gdvLista.UseAccessibleHeader = true;
                gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gdvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Visualizar")
            {
                OcultaDescSoli();
                // recupera a linha clicada no gridview
                int linha = Convert.ToInt32(e.CommandArgument);
                // recupera o id na linha clicada
                Int32 id = (Int32)gdvLista.DataKeys[linha].Value;
                //função que abre o registro em modo de edição
                Solicitacao_Model model = new Solicitacao_Model();

                solicitacao s = new solicitacao();

                s = model.Obter(id);                

                txtId.Value = id.ToString();
                txtNome.Value = s.solicitante_nome;
                txtEmail.Value = s.solicitante_email;
                txtEndereco.Value = s.solicitante_endereco;
                txtTelefone.Value = s.solicitante_telefone;
                txtDescricaoCaso.Value = s.descricao_caso;
                txtDadosOutraParte.Value = s.detalhes_partes;
                txtPeriodo.Value = s.solicitante_periodo_atendimento;
                txtDia.Value = s.solicitante_dia_atendimento;
                                
                pnlDados.Enabled = !(model.CarregaAgendamentos(s).Count > 0);                
                if (!pnlDados.Enabled)
                {
                    InsereDescSoli("Solicitação já agendada.");
                }
            }
        }

        protected void gdvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvLista.PageIndex = e.NewPageIndex;
            PreencherGrid();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            PreencherGrid();
        }

        protected void btnConfirmaTransferencia_Click(object sender, EventArgs e)
        {
            if (ValidaSolicitacao())
            {
                // confirma a transferência da solicitação para um local específico
                Solicitacao_Model model = new Solicitacao_Model();

                int id_local, id_solicitacao;

                id_local = int.Parse(ddLocal.SelectedValue);
                id_solicitacao = int.Parse(txtId.Value);

                // transfere a solicitação para o local/núcleo definido
                if (model.TransferirSolicitacao(id_solicitacao, id_local))
                {
                    Master.Sucesso("Solicitação transferida.");
                    PreencherGrid();
                }
                else
                {
                    Master.Alerta("Erro ao transferir Erro:" + model.message);
                }
            }
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            if (ValidaSolicitacao())
            {
                Solicitacao_Model model = new Solicitacao_Model();

                solicitacao s = new solicitacao();

                int id_solicitacao;

                id_solicitacao = int.Parse(txtId.Value);

                s = model.Obter(id_solicitacao);

                if (model.Excluir(s))
                {
                    LimparCampos();
                    Master.Sucesso("Solicitação excluída.");
                    PreencherGrid();
                }
                else
                {
                    Master.Alerta("Erro ao excluir a solicitação. Erro:" + model.message);
                }
            }
        }

        protected void LimparCampos()
        {
            txtId.Value = "";
            txtNome.Value = "";
            txtEmail.Value = "";
            txtEndereco.Value = "";
            txtTelefone.Value = "";
            txtDescricaoCaso.Value = "";
            txtDadosOutraParte.Value = "";
            txtPeriodo.Value = "";
            txtDia.Value = "";
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            if (ValidaAgendamento())
            {
                Agendamento_Model model = new Agendamento_Model();

                agendamento a = new agendamento();

                DateTime dDataInicial,dDataFinal;

                dDataInicial = DateTime.Parse(txtData.Value + " " + txtHoraInicial.Value + ":00");
                dDataFinal = DateTime.Parse(txtData.Value + " " + txtHoraFinal.Value + ":00");
                
                a.descricao = txtDescricaoAgendamento.Value;
                a.id_solicitacao = int.Parse(txtId.Value);
                a.data_inicial = dDataInicial;
                a.data_final = dDataFinal;
                if (model.VerificarDisponibilidade(a))
                {
                    if (model.Inserir(a))
                    {
                        Master.Sucesso("Horário agendado com sucesso.");
                        LimpaCamposAgendamento();
                        InsereDescSoli("Solicitação já agendada.");
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
                    if( model.message == "")
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

        protected void InsereDescSoli(String msg)
        {
            lblDescAcaoSoli.Text = msg;
            pnlAcaoSoli.Style.Remove("display");
        }

        public void OcultaDescSoli()
        {
            pnlAcaoSoli.Style.Add("display", "none");
            lblDescAcaoSoli.Text = "";
        }


        public bool ValidaAgendamento()
        {
            // se a solicitação não foi carregada, não entra no IF e retorna false
            if (ValidaSolicitacao())
            {
                if (txtData.Value == "")
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
                if ( TimeSpan.Parse(txtHoraInicial.Value) > TimeSpan.Parse(txtHoraFinal.Value) )
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
            else
            {
                return false;
            }            
        }

        public bool ValidaSolicitacao()
        {
            if (txtId.Value == "")
            {
                Master.Alerta("Solicitação não selecionada.");
                return false;
            }
            return true;
        }        

        protected void LimpaCamposAgendamento()
        {
            txtData.Value = "";
            txtHoraInicial.Value = "";
            txtHoraFinal.Value = "";
            txtDescricaoAgendamento.Value = "";
        }
            
    }
}