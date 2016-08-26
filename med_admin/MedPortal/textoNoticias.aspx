<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="textoNoticias.aspx.cs" Inherits="FrontEnd.textoNoticias" %>
<%@ MasterType VirtualPath="med_portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration='3s'">
                        <h1><%: ntc.titulo_postagem %></h1>
                    </div>
                </div>

            </div>
            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <br />

    <section id="apresentacao">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-5">
                        <img class="imagem-vis img-center col-md-12" src="<%: ntc.imagem_caminho + ntc.imagem_nome %>" alt="<%: ntc.imagem_nome %>">
                        <small><% if (ntc.data_edicao != null)
                                        { %><%: ntc.data_edicao.ToString() %><% }
                                else { %><%: ntc.data_postagem.ToString() %><% } %></small>  
                    </div>
                    <div class="col-md-7 texto">
                            <p style="font-size:large"><%: ntc.corpo_noticia %></p>
                    </div>
                </div>
            </div>
<%--            <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1 class="titulo">Deseja abrir uma Mediação?</h1>
                <p><a href="solicitacao.aspx" class="btn btn-danger" role="button">Solicitação</a> </p>
                <br>
            </div>--%>
            <br /><br /><br />
            
        </div>
    </section>

</asp:Content>
