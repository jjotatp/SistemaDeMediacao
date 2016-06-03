<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" 
    CodeBehind="depoimento_editar.aspx.cs" Inherits="MedAdmin.depoimento_editar" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">   
    <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Editar/Validar Depoimento
                </h4>
            </div>
            <div class="panel-body">
                <fieldset>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            Descrição
                        </label>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDescricao" MaxLength="200" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>  
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="txtRodape">
                            Nome Rodapé
                        </label>
                        <div class="col-sm-6">
                            <asp:TextBox runat="server" ID="txtRodape" CssClass="form-control" MaxLength="30"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="txtIdade">
                            Idade
                        </label>
                        <div class="col-sm-6">
                            <asp:TextBox TextMode="Number" runat="server" ID="txtIdade" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6 col-md-offset-4">
            <asp:Button CssClass="btn btn-success" runat="server" ID="btnSalvar" Text="Salvar Edição e Validar" OnClick="btnSalvar_Click"
                OnClientClick="javascript:return confirm('Você confirma a publicação desse depoimento?');"/>
            <asp:Button CssClass="btn btn-danger" runat="server" ID="btnRecusar" Text="Recusar Depoimento e Arquivar" OnClick="btnRecusar_Click"
                OnClientClick="javascript:return confirm('Você confirma o arquivamento desse depoimento?');"/>
            <a class="btn btn-default" runat="server" ID="btnVoltar" href="depoimentos.aspx">Voltar</a>                
        </div>
    </div>
</asp:Content>
