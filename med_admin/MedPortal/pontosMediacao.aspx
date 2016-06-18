<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="pontosMediacao.aspx.cs" Inherits="FrontEnd.pontosMediacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Contato</h1>
                        <p>Entre em contato com os locais que você pode fazer a sua Mediação...</p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <br />

    <div class="container">

        <div class="col-md-10 col-md-offset-1">

            <% foreach (BackEnd.Controllers.v_nucleo l in listaNucleos) { %>
                <div class="col-sm-6 col-md-6">
                    <div class="caption">
                        <h3><%: l.Descricao %></h3>
                        <p>Telefone: <%: l.Telefone %></p>
                        <p>Endereço: <%: l.Logradouro %> <%: l.Numero %>, <%: l.Bairro %>. <%: l.Cidade %></p>
                        <br />
                        <hr />
                    </div>
                </div>
            <% } %>
        </div>

        <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1 class="titulo">Deseja solicitar uma Mediação?</h1>
                <p><a href="solicitacao.aspx" class="btn btn-danger" role="button">Solicitação</a> </p>
                <br>
            </div>
    </div>
</asp:Content>
