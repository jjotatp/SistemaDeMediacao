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
    public partial class cad_mediacao : System.Web.UI.Page
    {
        public List<pessoa> lista = new List<pessoa>();

        // ======================================================== PAGE LOAD =====================================================
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lista = Session["mediacao_partes"] as List<pessoa>;
                // se a lista da sessão estiver vazia, então redireciona para cadastro de pessoas
                if (lista == null)
                {
                    Response.Redirect("cad_pessoa.aspx");
                }

                GerarCampos();

                TipoRegistro_Model model = new TipoRegistro_Model();
                ddTipoRegistro.DataSource = model.Listar();
                ddTipoRegistro.DataValueField = "id";
                ddTipoRegistro.DataTextField = "descricao";
                ddTipoRegistro.DataBind();
                ddTipoRegistro.SelectedIndex = 0;

                txtTemaConflito.MaxLength = 50;
                txtNumero.MaxLength = 20;                
            }
        }

        private List<string> TextBoxIdCollection
        {
            get
            {
                var collection = ViewState["TextBoxIdCollection"] as List<string>;
                return collection ?? new List<string>();
            }
            set { ViewState["TextBoxIdCollection"] = value; }
        }

        protected bool GerarCampos()
        {
            try
            {
                var collection = new List<string>();

                TextBox txt = null;
                Label lbl = null;
                int i = 0;
                foreach (pessoa p in lista)
                {
                    i++;
                    // para cada pessoa na lista, gera um Textarea para ela preencher com seu depoimento
                    lbl = new Label();
                    lbl.ID = "lbl" + i.ToString();
                    lbl.Text = p.nome;
                    lbl.Font.Bold = true;

                    // gera o campo com o cpf no ID, facilitando a identificação de quem que é o depoimento
                    txt = new TextBox();
                    txt.ID = p.cpf;
                    txt.CssClass = "form-control";
                    txt.TextMode = TextBoxMode.MultiLine;
                    txt.Rows = 3;

                    pnlDepoimentos.Controls.Add(lbl);
                    pnlDepoimentos.Controls.Add(txt);

                    collection.Add("p_" + txt.ID);
                }
                TextBoxIdCollection = collection;

                return true;
            } 
            catch
            {
                return false;
            }
        }

        protected void PegarCampos() // DEVE SER MODIFICADA
        {
            // PEGA OS COMPONENTES QUE FORAM ADICIONADOS            
            foreach (Control ctr in pnlDepoimentos.Controls)
            {
                if (ctr is TextBox)
                {
                    ((TextBox)ctr).Text = "DEU CERTO GIOVANA! ID: " + ctr.ID;
                }
            }
        }

        protected void btnGerarTermo_Click(object sender, EventArgs e)
        {
            // função que irá salvar os dados da mediação no banco e gerar o termo de mediação
            Mediacao_Model model = new Mediacao_Model();

            mediacao m = new mediacao();

            // pega o mediador logado
            mediador med = Session["med"] as mediador;

            m.numero = txtNumero.Value;
            m.tema_conflito = txtTemaConflito.Value;
            m.id_tipo_registro = Int32.Parse(ddTipoRegistro.SelectedValue);
            m.data_mediacao = DateTime.Parse(txtData.Value + " " + txtHora.Value + ":00");
            m.id_mediador = med.id;
            m.id_local = med.id_local;
            m.objeto = txtObjetoMediacao.Text;
            m.resolucao = Char.Parse(ddResolucao.SelectedValue);
            m.status = 1;
            
            if (model.Inserir(m))
            {
                // após inserir a mediação, é necessário inserir as partes
                //CONTINUAR DAQUI
            }
        }
    }
}