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
    public partial class cad_tipo_registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // MAXIMO DE CARACTERES 
                txtDescricao.MaxLength = 50;

                // declara ID e verifica se existe ID no txtID ou no endereço
                int id = 0;

                if (txtID.Text != "Novo")
                {
                    // recupera o id
                    try
                    {
                        id = int.Parse(txtID.Text);
                    }
                    catch (Exception)
                    {
                        Master.Alerta("Erro ao carregar o cadastro.");
                    }
                }

                if (Request.QueryString["ID"] != null)
                {
                    //recupera o id
                    id = int.Parse(Request.QueryString["ID"]);
                    txtID.Text = id.ToString();
                }

                // se houver ID informado, então carrega o registro do ID informado
                if (id != 0)
                {
                    try
                    {
                        // declara o objeto model
                        TipoRegistro_Model model = new TipoRegistro_Model();
                        //recupera o produto do id informado
                        tipo_registro tr = model.Obter(id);

                        //preencher caixas de texto com valores
                        txtDescricao.Value = tr.descricao;                        
                    }
                    catch (Exception)
                    {
                        Master.Alerta("Registro não encontrado.");
                    }
                }
                else
                {
                    txtID.Text = "Novo";
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {                        
            if (txtDescricao.Value != "")
            {
                tipo_registro tr = new tipo_registro();
                tr.descricao = txtDescricao.Value;

                TipoRegistro_Model model = new TipoRegistro_Model();

                // se tiver ID preenche o parâmetro
                if (txtID.Text != "Novo")
                    tr.id = int.Parse(txtID.Text);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(tr))
                {
                    Master.Sucesso("Registro salvo com sucesso.");
                    txtID.Text = tr.id.ToString();
                }
                else
                    Master.Alerta("Erro ao salvar o registro");
            }
            else
            {
                Master.Alerta("Campo descrição é obrigatório.");
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_tipo_registro.aspx");
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("lista_tipo_registro.aspx");
        }
    }
}