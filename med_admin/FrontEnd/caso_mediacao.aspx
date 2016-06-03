<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="caso_mediacao.aspx.cs" Inherits="MedAdmin.caso_mediacao" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">    
<asp:ScriptManager ID ="scriptManager" runat="server" />        
    <div class="col-md-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Editar/Adicionar casos de mediação
                </h4>
            </div>
            <div class="panel-body">
                <div class="col-sm-12 col-md-7">
                    <div class="card-box">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="ddTipoRegistro">
                                    Tipo de Registro
                                </label>
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddTipoRegistro" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0" Text="Selecione um tipo"></asp:ListItem>
                                    </asp:DropDownList>     
                                </div>
                                <div class="col-sm-3">
                                    <asp:button CssClass="btn btn-info" runat="server" id="btnChecarTipoReg" text="Verificar e Carregar" OnClick="btnChecarTipoReg_OnClick"/>
                                </div>
                            </div>  
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="sel1">
                                    Título
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox runat="server" ID="txtTitulo" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">                                                                       
                                <ContentTemplate>   --%>  
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="sel1">
                                    Descrição
                                </label>
                                <div class="col-sm-9">
                                    <textarea runat="server" class="form-control" id="txtDescricao" style="height: 100px;" maxlength="100" />
                                </div>
                            </div>                                           
                                
                                <%--</ContentTemplate>
                                <Triggers> 
                                    <asp:PostBackTrigger ControlID="btnSalvar" /> 
                                </Triggers>
                            </asp:UpdatePanel>--%>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Prioridade de exibição
                                </label>
                                <div class="col-sm-9">
                                    <asp:DropDownList runat="server" ID="ddPrioridade" CssClass="form-control">
                                        <asp:ListItem Text="3 - Listagem Padrão" Value="3" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="2 - Painel Secundário" Value="2" ></asp:ListItem>
                                        <asp:ListItem Text="1 - Painel Superior" Value="1" ></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="col-md-5">                                         
                    <asp:UpdatePanel ID="updtPanel" runat="server" UpdateMode="Conditional">                                                                       
                        <ContentTemplate>                                
                            <asp:Image ID="imgImagemCarregada" runat="server" CssClass="col-md-8" />               
                            <asp:FileUpload ID="uplImagemCarregada" runat="server" /><br />
                            <asp:Button ID="btnCarregar" runat="server" Text="Carregar" CssClass="btn btn-default" ToolTip="Carregar a imagem selecionada" /><br />                                
                        </ContentTemplate>
                        <Triggers> 
                            <asp:PostBackTrigger ControlID="btnCarregar" /> 
                        </Triggers>
                    </asp:UpdatePanel>                                
                </div>    
                <div class="col-md-12">
                    <div class="col-md-offset-5">
                        <asp:Button CssClass="btn btn-success" runat="server" ID="btnSalvar" Text="Salvar" OnClick="btnSalvar_Click"
                            OnClientClick="javascript:return confirm('Você confirma a publicação desse caso de mediação?');"/>
                        <a class="btn btn-default" runat="server" ID="btnVoltar" href="casos_mediacao_lista.aspx">Voltar</a>                
                    </div>
                </div>
            </div>
        </div>
    </div>
        
</asp:Content>

