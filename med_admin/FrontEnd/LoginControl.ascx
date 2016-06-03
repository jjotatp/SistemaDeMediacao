<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs"
Inherits="MedAdmin.LoginControl" %>
    <link href="Content/plugins/jquery-circliful/css/jquery.circliful.css"
    rel="stylesheet" type="text/css" />
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" type="text/css"
    />
    <link href="Content/css/core.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/components.css" rel="stylesheet" type="text/css"
    />
    <link href="Content/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <link href="Content/css/responsive.css" rel="stylesheet" type="text/css"
    />
    <asp:Panel id="pnlLogado" runat="server" HorizontalAlign="Right">
        <div class="topbar-main">            
            <div class="container">
                <!-- Logo container-->
                <div class="logo">
                    <a href="index.aspx" class="logo"><i class="ion-gear-b"></i> <span>Med Admin | Núcleo de mediação: <asp:Label id="lblNucleoLogado" runat="server" /> </span> </a>
                </div>
                <!-- End Logo container-->
                <div class="menu-extras">
                    <ul class="nav navbar-nav navbar-right pull-right"> 
                        <li>
                            <span><asp:Label id="lblNomeUsuario" runat="server" CssClass="text-white"/></span>
                            &nbsp;
                            <asp:Button id="btnSairLogado" runat="server" CssClass="btn btn-default"
                            Text="Sair" OnClick="btnSairLogado_Click" UseSubmitBehavior="False" />                                                       
                        </li>                                                  
                    </ul>                    
                </div>
            </div>            
        </div>
        <!-- End topbar -->
    </asp:Panel>
    <asp:Panel id="pnlNaoLogado" runat="server" CssClass="wrapper-page">
        <div class="text-center">
            <span class="logo logo-lg">
                Med Admin
            </span>
        </div>        
            <div class="form-group">
                <div class="col-xs-12">
                    <input class="form-control" type="text" required="" placeholder="Nome de Usuário"
                    runat="server" id="txtUsuario">
                    <i class="md md-account-circle form-control-feedback l-h-34">
                    </i>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <input class="form-control" type="password" required="" placeholder="Senha"
                    runat="server" id="txtSenha">
                    <i class="md md-vpn-key form-control-feedback l-h-34">
                    </i>
                </div>
            </div>
            <div class="form-group text-right m-t-20">
                <div class="col-xs-12">
                    <asp:Button ID="btnEntrar" runat="server" CssClass="btn btn-success waves-effect waves-light btn-block"
                    Text="Entrar" UseSubmitBehavior="true" OnClick="btnEntrar_Click" />
                </div>
            </div>
        <div class="alert alert-danger alert-dismissible fade in" role="alert"
        id="pnlAlertaLogin" style="display:none" runat="server">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">
                    ×
                </span>
            </button>
            <strong>
                <asp:Label ID="lblTextoAlertaLogin" runat="server" Text="" Font-Size="10"
                Visible="true" />
            </strong>
        </div>        
    </asp:Panel>

    <script src="Content/js/jquery.min.js"></script>

    <script type="text/javascript">
            jQuery(document).ready(function($) {
        setTimeout(function() {
            jQuery("#pnlAlertaLogin").alert("close");
        }, 5000);
    });
    </script>