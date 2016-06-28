<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="noticias.aspx.cs" Inherits="MedAdmin.noticias" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Notícias
                </h4>
            </div>                                                   
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="col-md-3">
                        <input class="form-control input-md" id="txtDataInicioAtividade" type="date" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTitulo" CssClass="form-control" runat="server"
                        placeholder="Buscar notícia">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button CssClass="btn btn-info" runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click"/>
                    </div>
                    <a href="noticia_publicar.aspx" class="btn btn-success pull-right" role="button">Postar Nova Notícia</a>
                </div>
                <div class="col-sm-12">
                    <br />
                    <asp:ScriptManager ID ="scriptManager" runat="server" />
                    <asp:UpdatePanel ID="updtPanel" runat="server" UpdateMode="Conditional">                                                                       
                        <ContentTemplate>                                
                            <div class="row">
                                <% foreach (BackEnd.Controllers.noticia n in listaNoticias)
                                    { %>
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <a href="noticia_publicar.aspx?ID=<%: n.id %>">
                                            <img src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                                            <div class="caption">
                                                <h3><%: n.titulo_postagem %></h3>
                                                <%--<p><%: n.corpo_noticia %></p>--%>
                                                <%--<p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>--%>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <% } %> 
                                <% if (listaNoticias.Count < 1)
                                   { %> 
                                    <h4>Nenhuma Notícia encontrada</h4>
                                <% } %>
                            </div>                                
                        </ContentTemplate>
                        <%--<Triggers> 
                            <asp:PostBackTrigger ControlID="" /> 
                        </Triggers>--%>
                    </asp:UpdatePanel>   
                </div>
            </div>
        </div>
    </div>
</asp:Content>

