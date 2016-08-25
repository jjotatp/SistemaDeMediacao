<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="detail_mediacao.aspx.cs" Inherits="MedAdmin.detail_mediacao" %>
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
                        Status da Mediação
                    </label>
                    <div class="col-sm-10">
                        <asp:TextBox CssClass="form-control" id="txtStatus" runat="server"></asp:TextBox>
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
            <br />
            <asp:Panel CssClass="" ID="pnlAcompanhamentos" runat="server" Enabled="true">
                <h2>Acompanhamentos</h2>
                <asp:GridView ID="gdvAcompanhamentos" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                    AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gdvAcompanhamentos_RowCommand">
                    <Columns>

                        <asp:TemplateField HeaderText="Data do Acompanhamento">
                            <ItemTemplate>
                                <%#Eval("data") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Verificação">
                            <ItemTemplate>
                                <%#Eval("verificacao") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:ButtonField CommandName="Arquivar" HeaderStyle-Width="40" Text="Arquivar" runat="server">
                            <ControlStyle CssClass="btn btn-xs btn-danger"/>                         
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </asp:ButtonField>
                
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
    </div>
    <div class="form-group">
        <div class="container text-right">
            <a role="button" data-toggle="modal" data-target="#modalAcompanhamento" aria-expanded="false">
            <span class="btn btn-success">Novo Acompanhamento</span>
            </a>
            <asp:Button runat="server" id="btnNovaMediacao" class="btn btn-success"
            OnClick="btnNovaMediacao_Click" Text="Registrar Nova Mediação" />
            <asp:Button runat="server" id="btnGerar" class="btn btn-info"
            OnClick="btnGerar_Click" Text="Baixar Arquivo" />
            <asp:Button runat="server" id="btnVoltar" class="btn btn-default"
            OnClick="btnVoltar_Click" Text="Voltar" />
        </div>
    </div>
</div>

<!--  ============= MODAL ACOMPANHAMENTO ============  -->
<div id="modalAcompanhamento" class="modal fade" role="dialog">                    
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">                            
            <h3 class="modal-title">Registrar o acompanhamento</h3>
        </div>
            <div class="modal-body">       
                <div class="form-group">
                    <label class="col-md-3 control-label" for="verificacao">
                        Detalhes do caso
                    </label>
                    <div class="col-md-12">                                        
                        <textarea id="txtVerificacao" class="form-control input-md" runat="server" placeholder="" maxlength="1000" required="required"></textarea>
                    </div>
                </div>                                
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar"
                    CssClass="btn btn-success" OnClick="btnConfirmar_Click"></asp:Button>   
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>               
<!-- ==============  FIM MODAL ACOMPANHAMENTO ================= --> 
</asp:Content>
