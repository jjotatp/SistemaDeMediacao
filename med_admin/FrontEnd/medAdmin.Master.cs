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
    public partial class medAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OcultaAlerta();
            OcultaSucesso();
            // Alerta é mensagem vermelha
            // Sucesso é mensagem verde
            submenuResultados.Visible = (GetNivelPermissao() >= Mediador_Model.PERM_AVANCADO);  // Avançado
            submenuCadastros.Visible = (GetNivelPermissao() >= Mediador_Model.PERM_ADMIN);      // Admin
            submenuConfiguracoes.Visible = (GetNivelPermissao() >= Mediador_Model.PERM_ADMIN);  // Admin
        }

        public void EditaCadastro(GridViewCommandEventArgs e, int id, String telaCadastro)
        {            
            // deve verificar se o botão EDITAR foi clicado
            if (e.CommandName == "Editar")
            {
                String url = telaCadastro + ".aspx?ID=" + id.ToString();
                Response.Redirect(url);
            }
        }

        public void Alerta(String msg)
        {
            lblTextoAlerta.Text = msg;
            pnlAlerta.Style.Remove("display");            
        }
        
        public void OcultaAlerta()
        {
            pnlAlerta.Style.Add("display", "none");
            lblTextoAlerta.Text = "";
        }

        public void Sucesso(String msg)
        {
            lblTextoSucesso.Text = msg;
            pnlSucesso.Style.Remove("display");
        }

        public void OcultaSucesso()
        {
            pnlSucesso.Style.Add("display", "none");
            lblTextoSucesso.Text = "";
        }

        public int GetNivelPermissao()
        {
            // função que pega o mediador logado e verifica seu nível de permissão
            try
            {
                int nivel = 1;
                mediador mediador = Session["med"] as mediador;

                if (mediador != null)
                {
                    nivel = mediador.nivel_permissao;
                }
                return nivel;
            }
            catch
            {
                return 1;
            }
        }

        public string GetAlcancePermissao()
        {
            // função que retorna o alcance das suas alterações do mediador logado        
            try
            {
                string sAlcance = "000000000";
                mediador mediador = Session["med"] as mediador;

                if (mediador != null)
                {
                    int iAlcance = Int32.Parse(mediador.alcance);
                
                    // repetição para remover 0 à DIREITA >
                    while ((iAlcance % 10) == 0)
                    {
                        iAlcance = iAlcance / 10;
                    }

                    sAlcance = iAlcance.ToString();
                }

                return sAlcance;
            }
            catch
            {
                return null;
            }
        }

        public mediador GetLogado()
        {
            // função que pega o mediador logado e retorna
            mediador med = new mediador();
            try
            {
                med = Session["med"] as mediador;
            }
            catch (Exception e)
            {
                Alerta(e.Message);
            }
            return med;
        }

        public bool VerificarAlcance(String alcanceLocal)
        {
            try
            {
                int alcanceLogado = Int32.Parse(GetAlcancePermissao());
                
                // SE alcance do local INICIA com o alcance do usuário logado, então retorna TRUE,
                // ou seja,  ele tem permissão de acesso
                return (alcanceLocal.StartsWith(alcanceLogado.ToString()) );               
            }
            catch ( Exception e )
            {
                Alerta("Erro ao verificar alcance: " + e.Message);
                return false;
            }            
        }
    }
}