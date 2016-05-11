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

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            GerarCampos();
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            
            lista = Session["mediacao_partes"] as List<pessoa>;
            // se a lista da sessão estiver vazia, então redireciona para cadastro de pessoas
            if (lista == null)
            {
                Response.Redirect("cad_pessoa.aspx");
            }
            
            //RecarregarCampos();            
        }

        // ======================================================== PAGE LOAD =====================================================
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                TipoRegistro_Model model = new TipoRegistro_Model();
                ddTipoRegistro.DataSource = model.Listar();
                ddTipoRegistro.DataValueField = "id";
                ddTipoRegistro.DataTextField = "descricao";
                ddTipoRegistro.DataBind();
                ddTipoRegistro.SelectedIndex = 0;

                txtTemaConflito.MaxLength = 50;
                txtNumero.MaxLength = 20;

                txtData.Value = DateTime.Parse(DateTime.Now.ToString()).ToString("yyyy-MM-dd");
                txtHora.Value = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
            }
            else
            {
                
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

        protected bool RecarregarCampos()
        {
            try
            {
                foreach (string textboxId in TextBoxIdCollection)
                {
                    var textbox = new TextBox { ID = textboxId };
                    textbox.CssClass = "form-control";
                    textbox.TextMode = TextBoxMode.MultiLine;
                    textbox.Rows = 3;
                    textbox.Attributes.Add("name", textboxId.Remove(0, 2));
                    TextBoxPlaceHolder.Controls.Add(textbox);
                }
                return true;
            }
            catch
            {
                return false;
            }
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
                    txt.Attributes.Add("name", p.cpf);
                    txt.Rows = 3;                                        
                    
                    TextBoxPlaceHolder.Controls.Add(lbl);
                    TextBoxPlaceHolder.Controls.Add(txt);

                    collection.Add("p_" + txt.ID);
                }
                TextBoxIdCollection = collection;

                return true;
            } 
            catch (Exception e)
            {
                Master.Alerta(e.Message);
                return false;
            }
        }

        protected void PegarCampos() // DEVE SER MODIFICADA
        {
            // ********************
            //    NÃO É UTILIZADA
            // ********************        

            // PEGA OS COMPONENTES QUE FORAM ADICIONADOS            
            foreach (Control ctr in TextBoxPlaceHolder.Controls)
            {
                if (ctr is TextBox)
                {
                    ((TextBox)ctr).Text = "DEU CERTO GIOVANA! ID: " + ctr.ID;
                }
            }
        }

        protected bool FinalizarMediacao()
        {            
            if (ValidarDepoimentos())
            {
                // função que irá salvar os dados da mediação no banco e gerar o termo de mediação                   
                Mediacao_Model model = new Mediacao_Model();

                mediacao m = new mediacao();

                // pega o mediador logado
                mediador med = Session["med"] as mediador;

                int id_agendamento = 0;
                if (Session["med_agendamento"] != null)
                    id_agendamento = Int32.Parse(Session["med_agendamento"].ToString());

                m.numero = txtNumero.Value;
                m.tema_conflito = txtTemaConflito.Value;
                m.id_tipo_registro = Int32.Parse(ddTipoRegistro.SelectedValue);
                m.data_mediacao = DateTime.Parse(txtData.Value + " " + txtHora.Value + ":00");
                m.id_mediador = med.id;
                m.id_local = med.id_local;
                m.objeto = txtObjetoMediacao.Text;
                m.resolucao = Char.Parse(ddResolucao.SelectedValue);
                m.status = 1;
                if ( id_agendamento != 0 )
                {
                    m.id_agendamento = id_agendamento;
                }

                mediacao_parte mp = null;

                // após inserir a mediação, é necessário inserir as partes
                
                List<mediacao_parte> mpLista = new List<mediacao_parte>();                
                foreach (Control ctr in TextBoxPlaceHolder.Controls)
                {                
                    if (ctr is TextBox)
                    {                       
                        // percorre a lista de pessoas verificando de qual pessoa é aquele depoimento                        
                        foreach (pessoa p in lista)
                        {
                            if (ctr.ID.Contains(p.cpf))
                            {
                                mp = new mediacao_parte();
                                // depoimento da pessoa                        
                                mp.descricao_caso = ((TextBox)ctr).Text;                                
                                // quando encontrar a pessoa do depoimento então passa o CPF para o Identificador
                                mp.pessoa_id = p.cpf;
                                mpLista.Add(mp);                                
                            }
                        }
                    }                
                }

                if (model.InserirMediacaoTotal(m, mpLista))
                {
                    Session.Remove("med_agendamento");
                    Response.Redirect("historico_mediacoes.aspx?ID=" + m.id.ToString());
                    return true;                    
                }
                else
                {
                    Master.Alerta("Erro: " + model.message);
                    return false;
                }
            }
            else
            {                
                return false;
            }
        }

        protected bool ValidarDepoimentos()
        {
            // função que verifica se os depoimentos foram digitados
            //  se algum não foi digitado, exibe mensagem
            foreach (Control ctr in TextBoxPlaceHolder.Controls)
            {
                if (ctr is TextBox)
                {
                    if (((TextBox)ctr).Text == "")
                    {
                        Master.Alerta("O depoimento de uma das partes está vazio");
                        ctr.Focus();
                        return false;
                    }                    
                }
            }
            return true;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            FinalizarMediacao();
        }
    }
}