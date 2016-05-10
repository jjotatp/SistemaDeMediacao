<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="exCasos.aspx.cs" Inherits="FrontEnd.exCasos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Exemplificação de Mediação</h1>
                        <p>Conheça alguns casos de Mediação. Existem inumeros tipos de caso, listamos algunas deles
                        para você ter uma ideia do quanto Mediação pode te ajudar.
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
            
        <div class="col-lg-4 col-sm-6 text-center">
            <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
            <h3>Som Auto</h3>
            <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
        </div>

         <div class="col-lg-4 col-sm-6 text-center">
            <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
            <h3>Briga de Trânsito</h3>
            <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
        </div>

         <div class="col-lg-4 col-sm-6 text-center">
            <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
            <h3>Agressão</h3>
            <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
        </div>
    </div>
    
    <div class="void"> &nbsp; </div>

    <div class="container">
                <div class="col-lg-12">
            <h2 class="page-header"><span class=" glyphicon glyphicon-menu-down"></span> Alguns Outros Casos</h2>
        </div>
        <div class="col-md-6 wow fadeInUp data-wow-duration="2s"">
            <div class="list-group ">
              <button type="button" class="list-group-item">Cras justo odio</button>
              <button type="button" class="list-group-item">Dapibus ac facilisis in</button>
              <button type="button" class="list-group-item">Morbi leo risus</button>
              <button type="button" class="list-group-item">Porta ac consectetur ac</button>
              <button type="button" class="list-group-item">Vestibulum at eros</button>
            </div>
        </div>
        
        <div class="col-md-6 wow fadeInUp data-wow-duration="2s"">
            <div class="list-group text-center">
              <button type="button" class="list-group-item">Cras justo odio</button>
              <button type="button" class="list-group-item">Dapibus ac facilisis in</button>
              <button type="button" class="list-group-item">Morbi leo risus</button>
              <button type="button" class="list-group-item">Porta ac consectetur ac</button>
              <button type="button" class="list-group-item">Vestibulum at eros</button>
            </div>
        </div>                
    </div>

    <div class="void"> &nbsp; </div>
    
</asp:Content>
