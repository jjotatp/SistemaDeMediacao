<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="casos_mediacao_lista.aspx.cs" Inherits="FrontEnd.casos_mediacao_lista" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-md-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Casos de Mediação - Casos em exibição no site
                </h4>
            </div>
            <div class="panel-body">
                <a href="caso_mediacao.aspx" type="button" class="btn btn-success" runat="server">Editar/Adicionar caso de mediação</a>
                <br />
                <asp:ScriptManager ID ="scriptManager" runat="server" />
                <asp:UpdatePanel ID="updtPanel" runat="server" UpdateMode="Conditional">                                                                       
                    <ContentTemplate>                                
                        <div class="row">
                            <% foreach (BackEnd.Controllers.casos_mediacao n in listaCasos)
                                { %>
                            <div class="col-sm-6 col-md-3">
                                <div class="thumbnail">
                                    <a href="caso_med.aspx?ID=<%: n.id_tipo_registro %>">
                                        <img src="<%: n.imagem_caminho + n.imagem_nome %>" alt="<%: n.imagem_nome %>">
                                        <div class="caption">
                                            <h3><%: n.titulo %></h3>
                                            <p><%: n.descricao %></p>
                                            <%--<p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>--%>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <% } %> 
                            <% if (listaCasos.Count < 1)
                                { %> 
                                <h4>Nenhum caso de mediação registrado</h4>
                            <% } %>
                        </div>                                
                    </ContentTemplate>
                </asp:UpdatePanel>   
            </div>
        </div>
    </div>
</asp:Content>
