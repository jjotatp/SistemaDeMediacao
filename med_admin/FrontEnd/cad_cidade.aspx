<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true"
CodeBehind="cad_cidade.aspx.cs" Inherits="FrontEnd.cad_cidade" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
    <asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">                
        <div class="container">
            <h3>
                Cadastro - Cidade
            </h3>
            <p>
                Faça o cadastro de Mediadores
            </p>                                      
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
                        <label class="col-md-4 control-label" for="nome">
                            Nome
                        </label>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtNome" CssClass="form-control input-md" runat="server"
                            placeholder="Nome da Cidade">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">
                            Estado
                        </label>
                        <div class="col-md-6">
                            <asp:DropDownList CssClass="btn btn-default dropdown-toggle" ID="ddEstado" runat="server" ToolTip="Selecione o estado">                                                                
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