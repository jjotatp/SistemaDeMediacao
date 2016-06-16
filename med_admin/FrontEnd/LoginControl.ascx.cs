using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Controllers;
using BackEnd.Models;

using System.Security.Cryptography;
using System.Text;

namespace MedAdmin
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mediador mediador = Session["med"] as mediador;

            if (mediador != null)
            {
                pnlLogado.Visible = true;
                pnlNaoLogado.Visible = false;
                lblNomeUsuario.Text = mediador.nome;
                lblNucleoLogado.Text = mediador.local.descricao + " - " + mediador.local.cidade.nome;                
            }
            else
            {
                pnlNaoLogado.Visible = true;
                pnlLogado.Visible = false;
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {


            MD5 m = MD5.Create();

            String hash = GetMd5Hash(m, txtSenha.Value);
            
            Mediador_Model model = new Mediador_Model();
            mediador med = model.ObterUsuarioLogin(txtUsuario.Value, hash);

            if (med != null)
            {
                Session["med"] = med;
                Response.Redirect("index.aspx");
            }
            else
            {
                AlertaLogin("Usuário ou senha inválidos!");
            }
        }

        public void AlertaLogin(String msg)
        {
            lblTextoAlertaLogin.Text = msg;
            pnlAlertaLogin.Style.Remove("display");
        }

        protected void btnSairLogado_Click(object sender, EventArgs e)
        {
            mediador med = Session["med"] as mediador;

            if (med != null)
            {
                Session.Remove("med");
                Response.Redirect("index.aspx");
            }
        }




        /// MD5 HASH
        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
    }
}