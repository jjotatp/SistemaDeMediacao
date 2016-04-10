<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FrontEnd.index" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">        
    <div class="">
            <div class="container">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-color panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Olá, seja bem vindo ao Gerenciador do Portal de Mediação</h3>
                        </div>
                        <div class="panel-body">
                            <p>Nele será possível realizar todo o gerenciamento do sistema</p>
                            <p>Você poderá:</p>
                            <ul>
                                <li>Gerenciar Mediações</li>
                                <li>Listar Mediações</li>
                                <li>Escrever Noticias</li>
                                <li>Gerenciar Solicitações</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="col-md-12">
                    <div class="col-md-4">
                        <div class="card-box widget-user">
                            <a href="cad_mediacao.aspx">
                                <img class="img-responsive" alt="user" src="Content/images/mais.png">
                                <div class="wid-u-info">
                                    <h4 class="m-t-0 m-b-5">Nova Mediação</h4>
                                    <p class="text-muted m-b-5 font-13">Abra uma nova mediação</p>
                                    <span class="label label-warning">Abrir</span>
                                </div>
                            </a>
                        </div>
                        </div>
                        
                        <div class="col-md-4">
                        <div class="card-box widget-user">
                            <div>
                                <a href="lista_mediacoes.aspx">
                                    <img class="img-responsive" alt="user" src="Content/images/historico.png">
                                    <div class="wid-u-info">                                    
                                        <h4 class="m-t-0 m-b-5">Mediações Arquivadas</h4>
                                        <p class="text-muted m-b-5 font-13">Histórico de Mediações</p>
                                        <span class="label label-dark">Histórico</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        </div>
                        
                        <div class="col-md-4">  
                        <div class="card-box widget-user">
                            <div>
                                <a href="agenda.aspx">
                                    <img class="img-responsive" alt="user" src="Content/images/calendario.png">
                                    <div class="wid-u-info">
                                        <h4 class="m-t-0 m-b-5">Agendamentos</h4>
                                        <p class="text-muted m-b-5 font-13">Faça um agendamento</p>
                                    
                                        <span class="label label-default">Agendar</span>                                       
                                    </div>
                                </a>                                                                                                           
                            </div>
                        </div>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>        
</asp:Content>
