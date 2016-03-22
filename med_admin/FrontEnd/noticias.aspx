<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="noticias.aspx.cs" Inherits="FrontEnd.noticias" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="container">
                <div class="container">
                    <a href="noticia_publicar.aspx" class="btn btn-block btn-warning" role="button">Postar Nova Notícia</a>
                    <br>
                </div>
                <section id="artigos">
                    <div class="container">
                        <div class="col-md-12">
                            <div class="row">
                                <% foreach (BackEnd.Controllers.noticia n in listaNoticias)
                                    { %>
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <img src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                                        <div class="caption">
                                            <h3><%: n.titulo_postagem %></h3>
                                            <p><%: n.corpo_noticia %></p>
                                            <p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>                                        </div>
                                    </div>
                                </div>
                                <% } %>
                                
                            </div>
                        </div>
                    </div>
                </section>
            </div>
</asp:Content>
