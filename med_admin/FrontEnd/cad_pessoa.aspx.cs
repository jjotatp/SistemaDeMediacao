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
    public partial class cad_pessoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // CARREGAR NA URL O NUMERO DA PESSOA QUE VAI SER CADASTRADA(APENAS UMA ORDEM) ENTÃO QUANDO
            // FOR UMA MEDIACAO NOVA, O NUMERO VAI SER 1 E A SESSION DEVE SER APAGADA PARA SER CRIADA NOVAMENTE, EVITANDO SESSOES ANTIGAS
    

            if (!IsPostBack)
            {
                // tamanho dos campos de acordo com o banco de dados
                txtCPF.MaxLength = 14;
                txtRG.MaxLength = 12;
                txtNome.MaxLength = 100;
                txtNomePai.MaxLength = 100;
                txtNomeMae.MaxLength = 100;
                txtLogradouro.MaxLength = 100;
                txtNumero.MaxLength = 10;
                txtBairro.MaxLength = 50;
                txtTelefone.MaxLength = 20;

                // carrega os combos da tela
                Cidade_Model c = new Cidade_Model();
                ddCidade.DataSource = c.Listar();
                ddCidade.DataValueField = "id";
                ddCidade.DataTextField = "nome";
                ddCidade.DataBind();
                ddCidade.SelectedIndex = 0;

                ddCidadeNatal.DataSource = c.Listar();
                ddCidadeNatal.DataValueField = "id";
                ddCidadeNatal.DataTextField = "nome";
                ddCidadeNatal.DataBind();
                ddCidadeNatal.SelectedIndex = 0;

                if (Request.QueryString["NEXT"] == null)
                {
                    // se for a primeira pessoa a ser cadastrada, ou seja, 
                    // o parâmetro NEXT não existir ou for 0, remove a sessão
                    Session.Remove("mediacao_partes");
                }
            }
        }

        protected void txtCPF_TextChanged(object sender, EventArgs e)
        {
            lblAlertaCPF.Text = "";
            // ESTE CÓDIGO É EXECUTADO QUANDO A SELEÇÃO SAI DO CAMPO CPF
            // DEVE VERIFICAR SE EXISTE PESSOA COM ESSE CPF CADASTRADA, SE SIM, TRAZ OS DADOS
            Pessoa_Model model = new Pessoa_Model();

            if (model.ValidaCPF(txtCPF.Text))
            {
                lblAlertaCPF.Text = "CPF válido e não cadastrado";
            }
            else
            {
                pessoa p = new pessoa();
                p = model.Obter(txtCPF.Text);

                // carrega os dados buscados 
                               
                txtCPF.Text = p.cpf;
                txtRG.Value = p.rg;
                txtNome.Value = p.nome;
                ddEstadoCivil.SelectedValue = p.status_civil;                                
                txtProfissao.Value = p.profissao;
                txtDataNascimento.Value = DateTime.Parse(p.nascimento_data.ToString()).ToString("yyyy-MM-dd");
                ddCidadeNatal.SelectedValue = p.nascimento_cidade.ToString();
                rdbSexo.SelectedValue = p.sexo.ToString();
                txtNomePai.Value = p.nome_pai;
                txtNomeMae.Value = p.nome_mae;
                txtLogradouro.Value = p.endereco_logradouro;
                txtNumero.Value = p.endereco_numero;
                txtBairro.Value = p.endereco_bairro;
                ddCidade.SelectedValue = p.endereco_cidade.ToString();
                txtTelefone.Value = p.telefone;                

                Master.Sucesso("Dados carregados com sucesso");

                txtRG.Focus();
            }
        }

        protected void btnNovaPessoa_Click(object sender, EventArgs e)
        {
            // função para cadastrar a pessoa e inserir o seu CPF em uma SESSION
            // que será carregada na mediação 
            if (Cadastrar())
            {
                List<pessoa> lista = new List<pessoa>();
                lista = Session["mediacao_partes"] as List<pessoa>;

                
                Response.Redirect("cad_pessoa.aspx?NEXT="+ ( lista.Count + 1 ).ToString() );
            }           
        }

        protected bool AdicionarPessoaSessao(pessoa p)
        {
            try
            {
                // verifica se tem a sessão no navegador e carrega
                List<pessoa> lista = new List<pessoa>();
                lista = Session["mediacao_partes"] as List<pessoa>;

                // verifica se a sessão está vazia, se sim, cria a lista manualmente
                if (lista == null)
                {
                    lista = new List<pessoa>();
                }
                //verifica se a pessoa já está adicionada na lista
                // e se tiver, remove para atualizar
                RemoveDuplicado(p);                
                // adiciona a pessoa na lista
                lista.Add(p);
                // atribui a lista para a sessão novamente
                Session["mediacao_partes"] = lista;

                return true;
            }
            catch (Exception e)
            {
                Master.Alerta(e.Message);
                return false;
            }
        }

        protected bool Cadastrar()
        {
            Pessoa_Model model = new Pessoa_Model();
            pessoa p = new pessoa();

            p.cpf = txtCPF.Text;
            p.rg = txtRG.Value;
            p.nome = txtNome.Value;
            p.status_civil = ddEstadoCivil.SelectedValue;
            p.profissao = txtProfissao.Value;
            p.nascimento_data = DateTime.Parse(txtDataNascimento.Value);
            p.nascimento_cidade = Int32.Parse(ddCidadeNatal.SelectedValue);
            p.sexo = Char.Parse(rdbSexo.SelectedValue);
            p.nome_pai = txtNomePai.Value;
            p.nome_mae = txtNomeMae.Value;
            p.endereco_logradouro = txtLogradouro.Value;
            p.endereco_numero = txtNumero.Value;
            p.endereco_bairro = txtBairro.Value;
            p.endereco_cidade = Int32.Parse(ddCidade.SelectedValue);
            p.telefone = txtTelefone.Value;

            if (model.ValidaCPF(p.cpf))
            {
                if (model.Inserir(p))
                { // se inserir a pessoa, então adiciona na sessão
                    if (AdicionarPessoaSessao(p))
                    { // se adicionar na sessão retorna true
                        return true;
                    }
                }
                else
                {
                    Master.Alerta("Erro ao cadastrar: " + model.message);
                }
            }
            else // Se não valida, é pq a pessoa já está cadastrada, então ATUALIZA os dados
            {
                if (model.Alterar(p))
                { // se alterar a pessoa, então adiciona na sessão
                    if (AdicionarPessoaSessao(p))
                    { // se adicionar na sessão retorna true
                        return true;
                    }
                }
                else
                {
                    Master.Alerta("Erro ao atualizar: " + model.message);
                }
            }            
            return false;
        }

        protected void btnMediacao_Click(object sender, EventArgs e)
        {
            if (Cadastrar())
            { // se cadastrou corretamente, vai para a tela de mediação prosseguir com o cadastro
                Response.Redirect("cad_mediacao.aspx");
            }
        }

        protected bool RemoveDuplicado(pessoa p)
        {
            try
            {
                List<pessoa> lista = new List<pessoa>();
                lista = Session["mediacao_partes"] as List<pessoa>;

                // verifica se a sessão está vazia, se sim, cria a lista manualmente
                if (lista == null)
                {
                    lista = new List<pessoa>();
                }

                foreach (pessoa b in lista)
                {
                    if (b.cpf == p.cpf)
                    {
                        lista.Remove(b);
                        return true;
                    }                        
                }
                return false;
            }
            catch
            {
                return false;
            }

        }
    }
}