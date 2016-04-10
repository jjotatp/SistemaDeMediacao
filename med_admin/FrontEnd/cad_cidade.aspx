<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true"
CodeBehind="cad_cidade.aspx.cs" Inherits="FrontEnd.cad_cidade" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
    <asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">                         
    <div class="col-sm-10 col-sm-offset-1">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Cadastro de Cidade
                </h4>
            </div>                                                   
            <div class="panel-body">
                <fieldset>                        
                    <!-- Text input-->
                    <asp:Label runat="server" ID="txtID" hidden="hidden"></asp:Label>  
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
                    <div class="col-md-offset-4">
                        <asp:Button runat="server" id="btnSalvar" class="btn btn-success"
                        OnClick="btnSalvar_Click" Text="Salvar" />
                        <asp:Button runat="server" id="btnListar" class="btn btn-info"
                        OnClick="btnListar_Click" Text="Listar" />
                        <asp:Button runat="server" id="btnLimpar" class="btn btn-warning"
                        OnClick="btnLimpar_Click" Text="Limpar" />
                    </div>
                </fieldset>
            </div>
        </div>    
    </div>          
    </asp:Content>