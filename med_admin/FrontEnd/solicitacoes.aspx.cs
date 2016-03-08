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
    public partial class solicitacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // carrega os dados na lista de solicitações
                PreencherGrid();
            }
            else
            {

            }
           
        }        

        protected void PreencherGrid()
        {
            Solicitacao_Model model = new Solicitacao_Model();

            gdvLista.DataSource = model.ListarPorTexto("Nome","");
            gdvLista.DataBind();

            gdvLista.UseAccessibleHeader = true;
            gdvLista.HeaderRow.TableSection = TableRowSection.TableHeader;
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
            Solicitacao_Model model = new Solicitacao_Model();

            if (ddTipoBusca.Text == "Nome")
            {
                gdvLista.DataSource = model.ListarPorTexto("Nome", txtBusca.Value);                
            }
            else if (ddTipoBusca.Text == "Data")
            {
                gdvLista.DataSource = model.ListarPorData(DateTime.Parse(txtBusca.Value));                
            }
            else if(ddTipoBusca.Text == "Cidade")
            {
                gdvLista.DataSource = model.ListarPorTexto("Cidade",txtBusca.Value);                
            }
            else
            {
                gdvLista.DataSource = model.ListarPorTexto("Local",txtBusca.Value);
            }
            gdvLista.DataBind();

        }
    }
}