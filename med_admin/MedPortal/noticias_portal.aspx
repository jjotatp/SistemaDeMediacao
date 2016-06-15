<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="noticias_portal.aspx.cs" Inherits="FrontEnd.noticias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration='3s'">
                        <h1>Notícias</h1>
                        <p>Todas as noticias sobre mediação...</p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <section id="artigos">
        <div class="container">
            <div class="col-md-12">
                <div class="page-header">
                    <h1 class="titulo-artigo"><span class="glyphicon glyphicon-exclamation-sign"></span>Principais Notícias <small>Alguns textos sobre Mediação</small></h1>
                </div>
                <div class="col-md-12">
                    <!-- modo simples -->
                    <% foreach (BackEnd.Controllers.noticia n in listaNoticias)
                        {
                            i++;
                            if (i == 1)
                            { %>
                    <div class="col-sm-12 col-md-12">
                        <div class="thumbnail">
                            <img class="imagem-grande col-md-4" src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                            <div class="col-sm-8 col-md-8">
                                <div class="caption">
                                    <h3><%: n.titulo_postagem %></h3>
                                    <p>
                                        <a href="textoNoticias.aspx?ID=<%: n.id %>" class="btn btn-link" role="button">
                                            <samp class="glyphicon glyphicon-chevron-right"></samp>
                                            Leia Mais</a>
                                        <small><% if (n.data_edicao != null)
                                                   { %><%: n.data_edicao.ToString() %><% }
                                                    else { %><%: n.data_postagem.ToString() %><% } %></small>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <h1 class="titulo-artigo"><span class="glyphicon glyphicon-list-alt"></span>Noticias <small>Fique ligado!</small></h1>
                        <hr />
                    </div>
                    <% }
                        else
                        { %>
                    <div class="col-sm-12 col-md-6">
                        <div class="thumbnail">
                            <img class="imagem-pequena col-md-4" src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                            <div class="col-sm-8 col-md-8">
                                <h3><%: n.titulo_postagem %></h3>
                                <%--<p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>--%>
                                <p>
                                    <a href="textoNoticias.aspx?ID=<%: n.id %>" class="btn btn-link" role="button">
                                        <samp class="glyphicon glyphicon-chevron-right"></samp>
                                        Leia Mais</a>
                                    <small><% if (n.data_edicao != null)
                                               { %><%: n.data_edicao.ToString() %><% }
                                                    else { %><%: n.data_postagem.ToString() %><% } %></small>
                                </p>
                            </div>
                            <div class="col-sm-12">
                                <hr />
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <% if (listaNoticias.Count < 1)
                    { %>
                <h4>Nenhuma Notícia encontrada</h4>
                <% } %>
                <!-- modo site -->
                <br />
                <br />
            </div>
        </div>

    </section>
    <style>
        .imagem-grande {
            width: 260px;
            height: 260px;
            align-content: center;
        }

        .imagem-pequena {
            background-size: cover;
            width: 130px;
            height: 130px;
            align-content: center;
        }
    </style>
</asp:Content>
