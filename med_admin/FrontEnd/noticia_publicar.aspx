<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="noticia_publicar.aspx.cs" Inherits="FrontEnd.noticia_publicar" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">            
        <div class="container">
            <div class="row">
                <div class="col-md-5">                                         
                    <asp:ScriptManager ID ="scriptManager" runat="server" />
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
                            <%--<div class="summernote" id="edtConteudoPagina" runat="server">  --%>                              
                            </div>
                        </div>
                    </div>
                </div>
                <center>
                    <div class="clearfix">
                        <asp:Button CssClass="btn btn-success btn-rounded" runat="server" ID="btnSalvarNoticia" OnClick="btnSalvarNoticia_Click" Text="Publicar Notícia"
                            OnClientClick="javascript:return confirm('Você confirma a publicação dessa notícia?');"/>
                        <%--<button type="button" class="btn btn-success btn-rounded">Enviar</button>--%>
                    </div>                              
                </center>
        
</asp:Content>
