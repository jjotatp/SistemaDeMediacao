using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using BackEnd.Controllers;
using System.IO;
using System.Net;


namespace BackEnd.Models
{
    public class Configuracao_Model
    {
        public dbDataContext getDataContext() { dbDataContext db = new dbDataContext(); return db; }

        public Table<configuracao> getTable()
        {
            dbDataContext db = getDataContext();
            Table<configuracao> tb = db.GetTable<configuracao>();
            return tb;
        }

        public bool Inserir(configuracao c)
        {
            // função para cadastrar cidade
            try
            {
                Table<configuracao> tb = getTable();
                dbDataContext db = getDataContext();

                if (c.id == 0)
                {
                    tb.InsertOnSubmit(c);
                    tb.Context.SubmitChanges();
                    return true;
                }
                else
                {
                    return false;
                }

                
            }
            catch
            {
                return false;
            }
        }

        public configuracao Obter(String nome_conf)
        {
            configuracao c = new configuracao();

            using (dbDataContext db = getDataContext())
            {
                Table<configuracao> tb = db.GetTable<configuracao>();
                c = tb.First(p => p.nome_conf == nome_conf);
            }

            return c;
        }

        public String EnviarArquivoServidor(ref String fileName, byte[] fileBytes, ref bool enviado)
        {
            String msg = "";
            enviado = false;
            try
            {                
                configuracao c = new configuracao();

                c = Obter("medPortal");

                // URL do servidor ftp para postagem
                string ftp = c.caminho_postagem;                

                // lê o nome do arquivo e converte para byte array removendo os acentos
                fileName = Util.removerAcentos(fileName);

                try
                {
                    // cria a requisição ftp
                    FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftp + fileName);
                    request.Method = WebRequestMethods.Ftp.UploadFile;

                    // insere as credenciais do ftp (usuário e senha)
                    request.Credentials = new NetworkCredential(c.usuario_ftp, c.senha_ftp);
                    request.ContentLength = fileBytes.Length;
                    request.UsePassive = true;
                    request.UseBinary = true;
                    request.ServicePoint.ConnectionLimit = fileBytes.Length;
                    request.EnableSsl = false;

                    using (Stream requestStream = request.GetRequestStream())
                    {
                        requestStream.Write(fileBytes, 0, fileBytes.Length);
                        requestStream.Close();
                    }

                    FtpWebResponse response = (FtpWebResponse)request.GetResponse();

                    response.Close();

                    // exibe na tela
                    // Exibe CAMINHO_IMAGENS + nome_arquivo pois o campo CAMINHO_POSTAGEM é utilizado apenas para postar no servidor.
                    fileName = c.caminho_images + fileName;

                    msg = "A imagem " + fileName + " foi carregada.<br />";

                    enviado = true;
                }
                catch (WebException ex)
                {
                    throw new Exception((ex.Response as FtpWebResponse).StatusDescription);
                }
                
            }
            catch (Exception error)
            {
                enviado = false;
                msg = "Erro ao enviar: " + error.Message;
            }
            return msg;
        }

    }
}
