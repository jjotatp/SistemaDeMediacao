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
    public partial class solicitacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Local_Model l = new Local_Model();
                ddLocal.DataSource = l.ListarComEnderecoNaDesc();
                ddLocal.DataValueField = "ID";
                ddLocal.DataTextField = "DESCRICAO";
                ddLocal.DataBind();
                ddLocal.SelectedIndex = 0;

                // ATRIBUIR O MAXLENGTH PARA OS CAMPOS
                txtDescCaso.MaxLength = 250;
                txtNome.MaxLength = 100;
                txtTelefone.MaxLength = 20;
                txtEndereco.MaxLength = 100;
                txtEmail.MaxLength = 50;
                txtDadosPartes.MaxLength = 200;
            }
        }

        protected void btnFinalizarSolicitacao_Click(object sender, EventArgs e)
        {
            Finalizar();
        }

        protected void Finalizar()
        {
            try
            {
                Solicitacao_Model model = new Solicitacao_Model();
                BackEnd.Controllers.solicitacao sl = new BackEnd.Controllers.solicitacao();

                sl.data = DateTime.Now;

                // passo 1
                sl.solicitante_nome = txtNome.Value;
                sl.solicitante_endereco = txtEndereco.Value;
                sl.solicitante_telefone = txtTelefone.Value;
                sl.solicitante_email = txtEmail.Value;

                // passo 2
                sl.descricao_caso = txtDescCaso.Text;
                sl.detalhes_partes = txtDadosPartes.Text;

                // passo 3
                String sPeriodo = "";
                String sDia = "";
                foreach ( ListItem item in cbgPeriodo.Items )
                {
                    if ( item.Selected )
                    {
                        sPeriodo = sPeriodo + item.Text + "; ";
                    }
                }
                foreach (ListItem item in cbgDia.Items)
                {
                    if (item.Selected)
                    {
                        sDia = sDia + item.Text + "; ";
                    }
                }

                sl.solicitante_periodo_atendimento = sPeriodo;
                sl.solicitante_dia_atendimento = sDia;
                sl.id_local = int.Parse(ddLocal.SelectedValue);

                //PEGAR O ID SELECIONADO NO DDLOCAL E BUSCAR A CIDADE PARA ATRIBUIR NO CAMPO SL.CIDADE_ABERTURA
                local l = new local();
                Local_Model lmodel = new Local_Model();
                l = lmodel.Obter(int.Parse(ddLocal.SelectedValue));

                // ATRIBUI O ID DA CIDADE VINCULADA AO LOCAL
                sl.id_cidade_abertura = l.id_cidade;

                // insere a solicitação
                if ( ! model.Inserir(sl) )
                {
                    Master.Alerta(model.message);
                }
                else
                {
                    Response.Redirect("solicitacao_concluido.aspx");
                }

            } catch ( Exception E )
            {
                Master.Alerta(E.Message);
            }
        }
    }
}