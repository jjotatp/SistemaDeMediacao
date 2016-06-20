<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FrontEnd.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Solicite sua Mediação</h1>
                        <p>Em poucos Passos você consegue resolver o problema que te encomoda...</p>
                        <p>Preencha nosso formulário de contato para começar a resolver o seu problema</p>
                        <p><a class="btn btn-danger btn-lg" href="solicitacao.aspx" role="button">Solicitação</a></p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <br />

    <div class="container">
        <!-- div body -->

        <section id="menus-especiais">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-sm-4 wow fadeIn data-wow-duration="6s" data-wow-delay="0.5s"">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-info-sign"></span> O que é Mediação?</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: center;"> Conheça um pouca mais sobre Mediação</p>
                                <ul class="pager">
                                    <li><a href="sobreMediacao.aspx">Saiba Mais</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 wow fadeIn data-wow-duration="6s" data-wow-delay="0.7s"">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-bullhorn"></span> Exemplificação de Mediação</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: center;"> Listamos alguns casos que resolvemos aqui</p>
                                <ul class="pager">
                                    <li><a href="exCasos.aspx">Saiba Mais</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 wow fadeIn data-wow-duration="6s" data-wow-delay="0.9s"">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span> Pontos de Mediação</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: center;"> Conheça o que tem mais próximo de você...</p>
                                <ul class="pager">
                                    <li><a href="pontosMediacao.aspx">Saiba Mais</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section id="noticias">
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
                    <div class="col-md-8">
                        <div class="thumbnail">
                            <img class="imagem-grande img-center col-md-12" src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                            <div class="col-sm-12 col-md-12">
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
                    <div class="col-md-4">
                        <% }
                            else if ((i == 2) || (i == 3))
                            { %>
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <img class="imagem-media col-md-12" src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                                <div class="col-md-12">
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
                    
                    <% if (i == 3)
                        { %>
                        </div>
                    <div class="col-sm-12">
                        <h1 class="titulo-artigo"><span class="glyphicon glyphicon-list-alt"></span>Noticias <small>Fique ligado!</small></h1>
                        <hr />
                    </div>
                    <% }
                        }
                        else if ( i <= 30 )
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
</asp:Content>
