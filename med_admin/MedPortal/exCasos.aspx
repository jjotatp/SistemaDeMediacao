<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="exCasos.aspx.cs" Inherits="FrontEnd.exCasos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Exemplificação de Mediação</h1>
                        <p>Conheça alguns casos de Mediação. Existem inumeros tipos de caso, listamos alguns deles
                        para você ter uma ideia do quanto a mediação pode te ajudar.
                        </p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <div class="container">
        <div class="col-lg-12">
            <h2 class="page-header"><span class="glyphicon glyphicon-certificate"></span> Principais Casos</h2>
        </div>
        <% foreach (BackEnd.Controllers.casos_mediacao cm in casos)
            {
                i++;
                if (i <= 3)
                { %>
                    <div class="col-lg-4 col-sm-6 text-center">
                        <img class="img-circle img-responsive img-center" src="<%: cm.imagem_caminho + cm.imagem_nome %>" alt="<%: cm.imagem_nome %>">
                        <h3><%: cm.titulo %></h3>
                        <p><%: cm.descricao %></p>
                    </div>
              <% }
                      if (i == 4)
                      {%>
                </div>

                <div class="void"> &nbsp; </div>

                <div class="container">
                            <div class="col-lg-12">
                        <h2 class="page-header"><span class=" glyphicon glyphicon-menu-down"></span> Alguns Outros Casos</h2>
                    </div>
                    <div class="col-md-12 wow fadeInUp data-wow-duration='2s'">
                        <div class="list-group ">
                    <% }
                      if (i > 3)
                      { %>
                            <button type="button" class="list-group-item"><%: cm.titulo %></button>
                        <% }
            }%>
            </div>
        </div>
    </div>

    <div class="void"> &nbsp; </div>
    
</asp:Content>
