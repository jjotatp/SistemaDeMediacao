<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="config_site.aspx.cs" Inherits="FrontEnd.config_site" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
<style type="text/css">
    .edit-oquee {
            height: 300px;
            background-image: url(../img/oquee.jpg);
        }
        
        .edit-casos{
            height: 300px;
            background-image: url(../img/casos.jpg);
        }
        
        .edit-depo{
            height: 300px;
            background-image: url(../img/depo.jpg);
        }
        
        .edit-noticias{
            height: 300px;
            background-image: url(../img/noticias.jpg);
        }
    </style>

        <!-- =======================
             ===== START PAGE ======
             ======================= -->
        <div class="">
            <div class="col-md-12">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Configurações do Site
                        </h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-6">
                            <div class="edit-oquee panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Editar / O que é Mediação
                                    </h4>
                                </div>
                                <div class="panel-body">
                                    Exibir a foto salva no banco sobre o que é mediação
                                </div>
                            </div>
                            <button type="button" class="btn btn-success">Editar</button>
                        </div>

                        <div class="col-md-6">
                            <div class="edit-casos panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Editar / Casos de Mediação
                                    </h4>
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                            <a href="casos_mediacao_lista.aspx" runat="server" id="btnListarCasosMed" type="button" class="btn btn-success">Listar</a>
                        </div>
                        
                        <div class="col-md-6">
                            <br />
                            <div class="edit-depo panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Aprovar Depoimentos
                                    </h4>
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                            <button type="button" class="btn btn-info">Listar</button>
                        </div>
                        
                        <div class="col-md-6">
                            <br />
                            <div class="edit-noticias panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Editar / Notícias
                                    </h4>
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                            <button type="button" class="btn btn-success">Editar</button>
                            <button type="button" class="btn btn-info">Listar</button>
                        </div>
                </div>
            </div>
        </div>
</asp:Content>
