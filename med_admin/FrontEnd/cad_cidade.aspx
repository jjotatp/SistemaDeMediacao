<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="cad_cidade.aspx.cs" Inherits="FrontEnd.cad_cidade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="wrapper">
            <div class="container">
                <h3>Cadastro - Cidade</h3>
                <p>Faça o cadastro de Mediadores</p>
                <div class="panel-body">
                            <form class="form-horizontal">
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nome">Nome</label>
                                        <div class="col-md-6">
                                            <input name="nome" class="form-control input-md" id="nome" type="text" placeholder="Nome da Cidade">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nome">Estado</label>
                                        <div class="col-md-6">
                                            <input name="estado" class="form-control input-md" id="estado" type="text" placeholder="Estado">
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                        <div class="col-md-offset-3">
                                    <button class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5" type="button">Cadastrar</button>
                                    <button class="btn btn-warning btn-rounded w-md waves-effect waves-light m-b-5" type="button">Listar</button>
                                    </div>
                                </fieldset>
                    </form>
                </div   >
            </div>
        </div>
</asp:Content>
