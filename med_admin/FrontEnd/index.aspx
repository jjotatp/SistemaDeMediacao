<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FrontEnd.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="wrapper">
            <div class="container">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-color panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Olá, seja bem vindo ao Gerenciador do Portal de Mediação</h3>
                        </div>
                        <div class="panel-body">
                            <p>Nele será possível reslizar todo o gerenciamento do sistema</p>
                            <p>Você poderá;</p>
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
                            <div>
                                <img class="img-responsive" alt="user" src="image/mais.png">
                                <div class="wid-u-info">
                                    <a href="#"><h4 class="m-t-0 m-b-5">Nova Mediação</h4></a>
                                    <p class="text-muted m-b-5 font-13">Abra uma nova mediação</p>
                                    <a href="cad_mediacao.aspx"> <span class="label label-warning">Abrir</span></a>
                                </div>
                            </div>
                        </div>
                        </div>
                        
                        <div class="col-md-4">
                        <div class="card-box widget-user">
                            <div>
                                <img class="img-responsive" alt="user" src="image/historico.png">
                                <div class="wid-u-info">
                                    <a href="#"><h4 class="m-t-0 m-b-5">Histórico</h4></a>
                                    <p class="text-muted m-b-5 font-13">Histórido de Agendamento</p>
                                    <a href="#"> <span class="label label-dark">Histórico</span></a>
                                </div>
                            </div>
                        </div>
                        </div>
                        
                        <div class="col-md-4">  
                        <div class="card-box widget-user">
                            <div>
                                <img class="img-responsive" alt="user" src="image/calendario.png">
                                <div class="wid-u-info">
                                    <a href="#"><h4 class="m-t-0 m-b-5">Agenda Inesperada</h4></a>
                                    <p class="text-muted m-b-5 font-13">Faça um agendamento</p>
                                    <a role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><span class="label label-default">Agendar</span></a>
                                    
                                    <br>
                                    <div class="collapse" id="collapseExample">
                                      
                                        <div class="form-group">
                                                <label class="col-lg-4 control-label">Dia e Hora:</label>
                                                <div class="col-lg-8">
                                                    <input type="text" class="form-control input-daterange-timepicker" name="daterange" value="01/01/2015 1:30 PM - 01/01/2015 2:00 PM"/>
                                                </div>
                                        </div>
                                        <br><br><br>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="descricao">Descrição</label>
                                            <div class="col-md-8">
                                            <textarea name="descricao" class="form-control" id="descricao">Descrição do caso...</textarea>
                                            </div>
                                        </div>
                                        <br><br><br>                                       
                                        <button class="btn btn-success btn-rounded center">Realizar Agendamento</button>                                      
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
