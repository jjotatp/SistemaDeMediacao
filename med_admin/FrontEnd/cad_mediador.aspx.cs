using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Controllers;
using BackEnd.Models;
using System.Security.Cryptography;

namespace MedAdmin
{
    public partial class cad_mediador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.GetNivelPermissao() < Mediador_Model.PERM_ADMIN)
            {
                Response.Redirect("index.aspx");
            }

            if (!IsPostBack)
            {
                // tamanho dos campos de acordo com o banco de dados
                txtNome.MaxLength = 100;
                txtPatente.MaxLength = 50;
                txtUsuario.MaxLength = 50;
                txtSenha.MaxLength = 50;
                txtConfirmarSenha.MaxLength = 50;                

                // carrega cidades
                Local_Model l = new Local_Model();
                ddLocal.DataSource = l.Listar();
                ddLocal.DataValueField = "id";
                ddLocal.DataTextField = "descricao";
                ddLocal.DataBind();
                ddLocal.SelectedIndex = 0;

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
                        Mediador_Model model = new Mediador_Model();
                        //recupera o id informado
                        mediador med = model.Obter(id);

                        //preencher caixas de texto com valores
                        txtID.Text = med.id.ToString();
                        txtNome.Value = med.nome;
                        txtPatente.Value = med.patente;
                        ddLocal.SelectedValue = med.id_local.ToString();
                        ddNivelPermissao.SelectedValue = med.nivel_permissao.ToString();
                        txtUsuario.Value = med.usuario;
                        txtSenha.Value = "";
                        txtConfirmarSenha.Value = "";
                        
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

        protected bool Valida()
        {
            if (txtNome.Value == "")
            {
                Master.Alerta("Nome inválido ou não informado");
                return false;
            }
            mediador m = new mediador();
            Mediador_Model model = new Mediador_Model();
           
            if (txtUsuario.Value == "")
            {
                Master.Alerta("Usuário inválido ou não informado");
                return false;
            }
            // APENAS VERIFICA SE EXISTE SE NÃO FOR EDIÇÃO            
            if (txtID.Text == "Novo")
            {
                // BUSCAR O MEDIADOR E VERIFICAR SE EXISTE COM ESSE NOME DE USUARIO, SE EXISTER FALA QUE USUÁRIO JA É UTILIZADO            
                m = model.ObterUsuario(txtUsuario.Value);
                if (m.id != 0)
                {
                    Master.Alerta("Usuário já cadastrado, escolha um nome de usuário diferente.");
                    return false;
                }
                if (txtSenha.Value == "")
                {
                    Master.Alerta("Senha inválida ou não informada");
                    return false;
                }                                
            }
            if (txtConfirmarSenha.Value != txtSenha.Value)
            {
                Master.Alerta("As senhas não conferem");
                return false;
            }

            return true;
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_mediador.aspx");
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("lista_mediador.aspx");
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            //se a função valida retornar True, então permite cadastrar ou alterar o registro
            if (Valida())
            {
                mediador med = new mediador();                

                med.nome = txtNome.Value;
                med.patente = txtPatente.Value;
                med.id_local = Int32.Parse(ddLocal.SelectedValue);
                med.nivel_permissao = Int32.Parse(ddNivelPermissao.SelectedValue);
                med.usuario = txtUsuario.Value;
                med.senha = txtSenha.Value;

                Mediador_Model model = new Mediador_Model();

                // se tiver ID preenche o parâmetro
                if (txtID.Text != "Novo")
                    med.id = int.Parse(txtID.Text);

                if (txtID.Text != "Novo")
                {
                    if (txtSenha.Value == "")
                    {   // SE for uma alteração E a senha não for digitada,
                        // ENTÃO busca a senha que está no cadastro, para mantê-la no registro
                        med.senha = model.Obter(med.id).senha;
                    }
                }                                    

                // faz a inserção ou atualização do cadastro
                if (model.InserirAtualizar(med))
                {
                    // busca o id no banco pois a procedure cadMediador não retorna o id do registro
                    txtID.Text = model.ObterUsuario(med.usuario).id.ToString();
                    Master.Sucesso("Registro salvo com sucesso.");
                }
                else
                    Master.Alerta("Erro ao salvar o registro. Erro: "+model.message);
            }
        }
    }
}