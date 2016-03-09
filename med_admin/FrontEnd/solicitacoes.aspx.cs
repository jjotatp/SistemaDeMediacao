﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;

namespace FrontEnd
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
            }                      
        }        

        protected void PreencherCentros()
        {
            // preenche o combo que será utilizado para transferir a solicitação
            Local_Model model = new Local_Model();

            ddLocal.DataSource = model.Listar();
            ddLocal.DataValueField = "id";
            ddLocal.DataTextField = "nome";
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
                gdvLista.DataSource = model.ListarPorData(DateTime.Parse(txtBusca.Value));
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
                txtDescricaoProblema.Value = s.descricao_problema;
                txtDescricaoCaso.Value = s.descricao_caso;
                txtDadosOutraParte.Value = s.detalhes_partes;
                txtPeriodo.Value = model.RetornaPeriodo(s.solicitante_periodo_atendimento);                               
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
            // confirma a transferência da solicitação para um local específico
            Solicitacao_Model model = new Solicitacao_Model();

            int id_local,id_solicitacao;

            id_local = int.Parse(ddLocal.SelectedValue);
            id_solicitacao = int.Parse(txtId.Value);

            // transfere a solicitação para o local/núcleo definido
            if ( model.TransferirSolicitacao(id_solicitacao, id_local))
            {
                Master.Sucesso("Solicitação transferida.");
                PreencherGrid();              
            }
            else
            {
                Master.Alerta("Erro ao transferir Erro:" + model.message);
            } 
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
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
                Master.Alerta("Erro ao excluir a solicitação. Erro:"+model.message);
            }
        }

        protected void LimparCampos()
        {
            txtId.Value = "";
            txtNome.Value = "";
            txtEmail.Value = "";
            txtEndereco.Value = "";
            txtTelefone.Value = "";
            txtDescricaoProblema.Value = "";
            txtDescricaoCaso.Value = "";
            txtDadosOutraParte.Value = "";
            txtPeriodo.Value = "";
        }
    }
}