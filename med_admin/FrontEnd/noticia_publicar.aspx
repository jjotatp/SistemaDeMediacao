<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="noticia_publicar.aspx.cs" Inherits="FrontEnd.noticia_publicar" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">    
    <asp:ScriptManager ID ="scriptManager" runat="server" />        
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-7">
                    <div class="card-box">
                        <h4 class="m-t-0 header-title"><b>Conteúdo da Notícia</b></h4>
                            <div class="input-group">
                                <span class="input-group-addon">Título</span>
                                <asp:TextBox runat="server" ID="txtTituloNoticia" CssClass="form-control" required="required" MaxLength="50"></asp:TextBox>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">                                                                       
                                <ContentTemplate>                                                
                                    <textarea runat="server" class="form-control" id="edtNoticia" style="height: 200px;" maxlength="500" required="required"/>
                                </ContentTemplate>
                                <Triggers> 
                                    <asp:PostBackTrigger ControlID="btnSalvarNoticia" /> 
                                </Triggers>
                            </asp:UpdatePanel>                                                    
                        </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="">
                            Prioridade da Notícia
                        </label>
                        <div class="col-sm-9">
                            <asp:DropDownList runat="server" ID="ddPrioridade" CssClass="form-control">
                                <asp:ListItem Text="3 - Listagem Padrão" Value="3" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="2 - Painel Lateral" Value="2" ></asp:ListItem>
                                <asp:ListItem Text="1 - Painel Superior" Value="1" ></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    </div>
                <div class="col-md-5">                                         
                    <asp:UpdatePanel ID="updtPanel" runat="server" UpdateMode="Conditional">                                                                       
                        <ContentTemplate>                                
                            <asp:Image ID="imgImagemCarregada" runat="server" CssClass="col-md-8" />               
                            <asp:FileUpload ID="uplImagemCarregada" runat="server" /><br />
                            <asp:Button ID="btnCarregarImagem" runat="server" Text="Carregar" OnClick="btnCarregarImagem_Click" CssClass="btn btn-default" ToolTip="Carregar a imagem selecionada" /><br />                                
                        </ContentTemplate>
                        <Triggers> 
                            <asp:PostBackTrigger ControlID="btnCarregarImagem" /> 
                        </Triggers>
                    </asp:UpdatePanel>                                
                </div>                              
                </div>
                </div>
                <center>
                    <div class="clearfix">
                        <asp:Button CssClass="btn btn-success" runat="server" ID="btnSalvarNoticia" OnClick="btnSalvarNoticia_Click" Text="Publicar Notícia"
                            OnClientClick="javascript:return confirm('Você confirma a publicação dessa notícia?');"/>
                        <a class="btn btn-default" runat="server" ID="btnVoltar" href="noticias.aspx">Voltar</a>
                        
                    </div>                              
                </center>
        
</asp:Content>
