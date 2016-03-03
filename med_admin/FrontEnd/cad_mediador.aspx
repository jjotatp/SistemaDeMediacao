<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="cad_mediador.aspx.cs" Inherits="FrontEnd.cad_mediador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">  
<%@ MasterType VirtualPath="~/med_admin.master"  %>  
    <div class="container">
        <h3>Cadastro - Mediador</h3>
        <p>Faça o cadastro de Mediadores</p>
        <div class="panel-body">                            
            <fieldset>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">
                        ID
                    </label>
                    <div class="col-md-1">
                        <asp:Label runat="server" class="alert-info form-control" ID="txtID" ></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Nome</label>
                    <div class="col-md-6">
                        <input name="nome" class="form-control input-md" id="txtNome" type="text" placeholder="Nome" runat="server">
                    </div>
                </div>
                                    
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Patente</label>
                    <div class="col-md-6">
                        <input name="patente" class="form-control input-md" id="txtPatente" type="text" placeholder="Patente" runat="server">
                    </div>
                </div>
                                    
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Usuário</label>
                    <div class="col-md-6">                        
                        <input runat="server" class="form-control input-md" id="txtUsuario" type="text" placeholder="Nome de usuário">
                    </div>
                </div>
                                    
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Senha</label>
                    <div class="col-md-6">
                        <input class="form-control input-md" id="txtSenha" type="password" placeholder="Digite sua senha" runat="server">
                    </div>
                </div>
                      
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Confirmar Senha</label>
                    <div class="col-md-6">
                        <input class="form-control input-md" id="txtConfirmarSenha" type="password" runat="server" placeholder="Digite novamente sua senha">
                    </div>
                </div>              
                                        
                <div class="form-group">
                    <label class="col-md-4 control-label" for="sel1">Local</label>
                    <div class="col-md-6">
                        <asp:DropDownList runat="server" ID="ddLocal" CssClass="form-control"
                                placeholder="Selecione...">
                        </asp:DropDownList>
                    </div>
                </div>
                                    
                                    
                <div class="col-md-offset-3">
                    <asp:Button runat="server" id="btnSalvar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                    OnClick="btnSalvar_Click" Text="Salvar" />
                    <asp:Button runat="server" id="btnListar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                    OnClick="btnListar_Click" Text="Listar" />
                    <asp:Button runat="server" id="btnLimpar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                    OnClick="btnLimpar_Click" Text="Limpar" />
                </div>
            </fieldset>                  
        </div>
    </div>        
</asp:Content>
