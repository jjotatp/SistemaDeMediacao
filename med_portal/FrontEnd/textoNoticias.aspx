<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="textoNoticias.aspx.cs" Inherits="FrontEnd.textoNoticias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Título do Artigo/Notícia</h1>
                        <p>Tipo de Artigo</p>
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
                    <div class="col-md-5 arte-principal-artigo"></div>
                    <div class="col-md-5 espaco">
                            <p class="texto">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas rhoncus dignissim tempus. Ut mollis hendrerit nisi ut tincidunt. Nam ornare auctor dictum. Ut efficitur felis et libero rutrum vehicula. Vivamus quis congue elit. Nullam auctor sem vitae mauris molestie, eu sollicitudin est iaculis. Maecenas tincidunt libero pulvinar turpis scelerisque sollicitudin. Nunc sit amet turpis ut sapien consequat consequat consequat sit amet lorem. Maecenas ut tincidunt tortor, non sodales ligula.</p>
                        <p><strong>Nunc sit amet turpis ut sapien consequat consequat consequat sit amet lorem. Maecenas ut tincidunt tortor, non sodales ligula.</strong></p>
                        <p class="texto">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas rhoncus dignissim tempus. Ut mollis hendrerit nisi ut tincidunt. Nam ornare auctor dictum. Ut efficitur felis et libero rutrum vehicula. Vivamus quis congue elit.</p>
                    </div>
                </div>
            </div>
            <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1 class="titulo">Deseja abrir uma Mediação?</h1>
                <p><a href="solicitacao.html" class="btn btn-danger" role="button">Solicitação</a> </p>
                <br>
            </div>
            
        </div>
    </section>
</asp:Content>
