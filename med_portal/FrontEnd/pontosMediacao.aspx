<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="pontosMediacao.aspx.cs" Inherits="FrontEnd.pontosMediacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Pontos de Mediação</h1>
                        <p>Conheça os locais que você pode fazer a sua Mediação...</p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <br />

    <div class="container">

        <div class="col-md-8 col-md-offset-2">
            <div class="row">
              <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                  <img src="https://farm1.staticflickr.com/187/390803227_b368fb0a30_o.jpg" alt="...">
                </div>
              </div>
                <div class="caption">
                    <h3>Batalhão Exemplo #1</h3>
                    <p>Telefone: (xx) 1111-1111</p>
                    <p>Telefone: (xx) 1111-1111</p>
                    <p>Endereço: Rua Silva Santos, 222 - Bairo XPTO</p>
                  </div>
            </div>

            <div class="row">
              <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                  <img src="https://farm1.staticflickr.com/187/390803227_b368fb0a30_o.jpg" alt="...">
                </div>
              </div>
                <div class="caption">
                    <h3>Batalhão Exemplo #2</h3>
                    <p>Telefone: (xx) 1111-1111</p>
                    <p>Telefone: (xx) 1111-1111</p>
                    <p>Endereço: Rua Silva Santos, 222 - Bairo XPTO</p>
                  </div>
            </div>

            <div class="row">
              <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                  <img src="https://farm1.staticflickr.com/187/390803227_b368fb0a30_o.jpg" alt="...">
                </div>
              </div>
                <div class="caption">
                    <h3>Batalhão Exemplo #3</h3>
                    <p>Telefone: (xx) 1111-1111</p>
                    <p>Telefone: (xx) 1111-1111</p>
                    <p>Endereço: Rua Silva Santos, 222 - Bairo XPTO</p>
                  </div>
            </div>

        </div>

        <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1 class="titulo">Deseja abrir uma Mediação?</h1>
                <p><a href="solicitacao.aspx" class="btn btn-danger" role="button">Solicitação</a> </p>
                <br>
            </div>
    </div>
</asp:Content>
