<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="depoimentos_portal.aspx.cs" Inherits="FrontEnd.depoimentos" %>
<%@ MasterType VirtualPath="med_portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration='3s'">
                        <h1>Depoimentos</h1>
                        <p>Teve seu caso resolvido através de uma mediação de conflito? Deixe seu depoimento abaixo!</p>
                        <div class="col-md-4 col-md-offset-3">
                            <input class="form-control" id="txtNome" runat="server" placeholder="Nome" required="required"/>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" type="number" id="txtIdade" runat="server" placeholder="idade" required="required"/>
                            <br />
                        </div>
                        
                        <div class="col-md-6 col-md-offset-3">
                            <textarea class="form-control" rows="2" runat="server" id="txtDepoimento" required="required" maxlength="200" placeholder="Descreva seu caso"></textarea>
                            <br /><p><asp:Button CssClass="btn btn-danger btn-lg" runat="server" id="btnEnviar" OnClick="btnEnviar_Click" Text="Enviar"/></p>
                        </div>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

     <div class="container">
        <div class="col-lg-12">
            <h2 class="page-header"><span class="glyphicon glyphicon-certificate"></span> Depoimentos dos Casos</h2>
        </div>

         <% foreach (BackEnd.Controllers.depoimento d in listaDep)
             { %>
            <div class="col-lg-4 col-sm-6 text-center">
                <p><%: d.descricao %></p>
                <h3><%: d.nome + ", " + d.idade.ToString() %></h3>
                <div class="void"> &nbsp; </div>
            </div>
         <% } %>

        <br />
                   
        <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1 class="titulo">Deseja solicitar uma Mediação?</h1>
                <p><a href="solicitacao.aspx" class="btn btn-danger" role="button">Solicitação</a> </p>
                <br>
            </div>
        </div>

</asp:Content>
