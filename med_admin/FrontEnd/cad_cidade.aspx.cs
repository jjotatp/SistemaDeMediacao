using System;
using BackEnd.Controllers;
using BackEnd.Models;

namespace MedAdmin
{
    public partial class cad_cidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddEstado.Items.Clear();

                ddEstado.Items.Add("AC");
                ddEstado.Items.Add("AC");     
                ddEstado.Items.Add("AL");        
                ddEstado.Items.Add("AP");               
                ddEstado.Items.Add("AM");                    
                ddEstado.Items.Add("BA");                         
                ddEstado.Items.Add("CE");                              
                ddEstado.Items.Add("DF");                                   
                ddEstado.Items.Add("ES");                                        
                ddEstado.Items.Add("GO");                                             
                ddEstado.Items.Add("MA");                                                  
                ddEstado.Items.Add("MT");                                                       
                ddEstado.Items.Add("MS");                                                            
                ddEstado.Items.Add("MG");                                                                 
                ddEstado.Items.Add("PA");                                                                      
                ddEstado.Items.Add("PB");                                                                           
                ddEstado.Items.Add("PR");                                                                                
                ddEstado.Items.Add("PE");                                                                                     
                ddEstado.Items.Add("PI");                                                                                          
                ddEstado.Items.Add("RJ");                                                                                               
                ddEstado.Items.Add("RN");                                                                                                    
                ddEstado.Items.Add("RS");                                                                                                         
                ddEstado.Items.Add("RO");                                                                                                              
                ddEstado.Items.Add("RR");                                                                                                                   
                ddEstado.Items.Add("SC");                                                                                                                        
                ddEstado.Items.Add("SP");                                                                                                                             
                ddEstado.Items.Add("SE");                                                                                                                                  
                ddEstado.Items.Add("TO");

                // MAXIMO DE CARACTERES NOME DA CIDADE
                txtNome.MaxLength = 100;

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
                        Cidade_Model model = new Cidade_Model();
                        //recupera o produto do id informado
                        cidade cidade = model.Obter(id);
                         
                        //preencher caixas de texto com valores de produto
                        txtNome.Text = cidade.nome;
                        ddEstado.SelectedIndex = ddEstado.Items.IndexOf(ddEstado.Items.FindByValue(cidade.estado));
                        //ddEstado.Items.FindByText(cidade.estado);
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
            // cadastrar cidade
            cidade cidade = new cidade();
            cidade.nome = txtNome.Text;
            cidade.estado = ddEstado.Text;

            Cidade_Model model = new Cidade_Model();
            if (txtNome.Text != "")
            {
                // se tiver ID preenche o parâmetro
                if (txtID.Text != "Novo")                
                    cidade.id = int.Parse(txtID.Text);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(cidade))
                {
                    Master.Sucesso("Registro salvo com sucesso.");
                    txtID.Text = cidade.id.ToString();
                }
                else
                    Master.Alerta("Erro ao salvar o registro");
            }
            else
            {
                Master.Alerta("Campo nome é obrigatório.");
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_cidade.aspx");
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("lista_cidade.aspx");
        }
    }
}