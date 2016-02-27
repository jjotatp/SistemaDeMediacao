<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="cad_mediador.aspx.cs" Inherits="FrontEnd.cad_mediador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="wrapper">
            <div class="container">
                <h3>Cadastro - Mediador</h3>
                <p>Faça o cadastro de Mediadores</p>
                <div class="panel-body">
                            <form class="form-horizontal">
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nome">Nome</label>
                                        <div class="col-md-6">
                                            <input name="nome" class="form-control input-md" id="nome" type="text" placeholder="Nome">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nome">Patente</label>
                                        <div class="col-md-6">
                                            <input name="patente" class="form-control input-md" id="patente" type="text" placeholder="Patente">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nome">Usuário</label>
                                        <div class="col-md-6">
                                            <input name="usuario" class="form-control input-md" id="usuario" type="text" placeholder="Usuário">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nome">Senha</label>
                                        <div class="col-md-6">
                                            <input name="senha" class="form-control input-md" id="senha" type="password" placeholder="Senha">
                                        </div>
                                    </div>
                                    
                                        
                                    <div class="form-group">
                                      <label class="col-md-4 control-label" for="sel1">Local</label>
                                        <div class="col-md-6">
                                      <select class="form-control" id="sel1">
                                        <option>Local 1</option>
                                        <option>Local 2</option>
                                        <option>Local 3</option>
                                        <option>Local 4</option>
                                      </select>
                                        </div>
                                    </div>
                                    
                                    
                                        <div class="col-md-offset-3">
                                    <button class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5" type="button">Cadastras</button>
                                    <button class="btn btn-warning btn-rounded w-md waves-effect waves-light m-b-5" type="button">Listar</button>
                                    </div>
                                </fieldset>
                    </form>
                </div>
            </div>
        </div>
</asp:Content>
