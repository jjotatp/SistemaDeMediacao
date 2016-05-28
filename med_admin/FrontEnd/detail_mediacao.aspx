<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="detail_mediacao.aspx.cs" Inherits="FrontEnd.detail_mediacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<div class="col-sm-8 col-sm-offset-2">    
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">Detalhes da Mediação
            </h4>
        </div>
        <div class="panel-body">
            <asp:Panel CssClass="" ID="pnlDados" runat="server" Enabled="false">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="">
                        Número da Mediação
                    </label>
                    <div class="col-sm-4">
                        <asp:TextBox cssClass="form-control" id="txtNumero" runat="server"></asp:TextBox>
                    </div>
                    <label class="col-sm-1 control-label" for="">
                        Data
                    </label>
                    <div class="col-sm-2">
                        <asp:TextBox cssclass="form-control" id="txtData" runat="server"></asp:TextBox>
                    </div>
                    <label class="col-sm-1 control-label" for="">
                        Hora
                    </label>
                    <div class="col-sm-2">
                        <asp:TextBox cssclass="form-control" id="txtHora" runat="server"></asp:TextBox>
                    </div>
                </div>                                                
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="">
                        Tema do Conflito
                    </label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" id="txtTemaConflito" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="sel1">
                        Tipo de Registro
                    </label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" id="txtTipoRegistro" runat="server"></asp:TextBox>
                    </div>
                </div>      
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="sel1">
                        Partes Envolvidas
                    </label>
                    <div class="col-sm-10">
                        <asp:ListBox ID="lstPartes" runat="server" CssClass="form-control">
                        </asp:ListBox>
                    </div>
                </div>                                                     
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="">
                        Objeto da Mediação
                    </label>
                    <div class="col-sm-10">
                        <asp:TextBox TextMode="MultiLine" Rows="5" CssClass="form-control" id="txtObjetoMediacao" runat="server" required="required"></asp:TextBox>                                                                
                    </div>
                </div> 
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="sel1">
                        Resolução da Mediação
                    </label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" id="txtResolucao" runat="server"></asp:TextBox>    
                    </div>
                </div>  
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="sel1">
                        Mediador
                    </label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" id="txtMediador" runat="server"></asp:TextBox>    
                    </div>
                </div>  
            </asp:Panel>
        </div>
    </div>
    <div class="form-group">
            <div class="container text-right">
                <asp:Button runat="server" id="btnGerar" class="btn btn-success"
                OnClick="btnGerar_Click" Text="Baixar Arquivo" />
                <asp:Button runat="server" id="btnVoltar" class="btn btn-default"
                OnClick="btnVoltar_Click" Text="Voltar" />
            </div>
        </div>
</div>
</asp:Content>
