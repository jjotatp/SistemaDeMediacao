<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="depoimento_editar.aspx.cs" Inherits="FrontEnd.depoimento_editar" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
<asp:ScriptManager ID ="scriptManager" runat="server" />        
    <div class="col-md-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Editar/Validar Depoimentos
                </h4>
            </div>
            <div class="panel-body">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <div class="card-box">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="txtDescricao">
                                    Descrição
                                </label>
                                <div class="col-sm-6">
                                    <textarea runat="server" class="form-control" id="txtDescricao" style="height: 100px;" maxlength="100" />
                                </div>
                            </div>  
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="txtRodape">
                                    Nome Rodapé
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox runat="server" ID="txtRodape" CssClass="form-control" MaxLength="30"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="txtRodape">
                                    Idade
                                </label>
                                <div class="col-sm-9">
                                    <input type="number" runat="server" ID="txtIdade" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>    
                <div class="col-md-12">
                    <div class="col-md-offset-5">
                        <asp:Button CssClass="btn btn-success" runat="server" ID="btnSalvar" Text="Salvar Edição e Validar" OnClick="btnSalvar_Click"
                            OnClientClick="javascript:return confirm('Você confirma a publicação desse depoimento?');"/>
                        <asp:Button CssClass="btn btn-danger" runat="server" ID="btnRecusar" Text="Recusar Depoimento e Arquivar" OnClick="btnRecusar_Click"
                            OnClientClick="javascript:return confirm('Você confirma o arquivamento desse depoimento?');"/>
                        <a class="btn btn-default" runat="server" ID="btnVoltar" href="depoimentos.aspx">Voltar</a>                
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
