<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="config_site.aspx.cs" Inherits="FrontEnd.config_site" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
<style type="text/css">
    .edit-oquee {
    }
        
    .edit-casos{
    }
        
    .edit-depo{
    }
        
    .edit-noticias{
    }
    </style>

        <!-- =======================
             ===== START PAGE ======
             ======================= -->
            <div class="col-md-12">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Configurações do Site
                        </h4>
                    </div>
                    <div class="panel-body">
                        <%--<div class="col-md-6">
                                <div class="edit-oquee panel panel-color panel-primary">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            Editar / O que é Mediação
                                        </h4>
                                    </div>
                                    <div class="panel-body">  
                                    </div>
                                </div>
                                <a href="info_mediacao.aspx" runat="server" id="btnEditarOqueE" type="button" class="btn btn-success">Editar</a>
                            </div>--%>

                        <div class="col-md-12">
                            <div class="edit-casos panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Editar / Casos de Mediação
                                    </h4>
                                </div>
                                <div class="panel-body">
                                    <a href="casos_mediacao_lista.aspx" runat="server" id="btnListarCasosMed" type="button" class="btn btn-success">Listar</a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <br />
                            <div class="edit-depo panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Aprovar Depoimentos
                                    </h4>
                                </div>
                                <div class="panel-body">
                                    <a href="depoimentos.aspx" runat="server" id="btnListarDepoimentos" type="button" class="btn btn-success">Listar</a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <br />
                            <div class="edit-noticias panel panel-color panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Editar / Notícias
                                    </h4>
                                </div>
                                <div class="panel-body">
                                    <a href="noticias.aspx" runat="server" id="btnListarNoticias" type="button" class="btn btn-success">Listar</a>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
</asp:Content>
