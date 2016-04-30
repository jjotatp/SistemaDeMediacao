<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="depoimentos.aspx.cs" Inherits="FrontEnd.depoimentos" %>

<%@ MasterType VirtualPath="~/med_admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">Depoimentos
                </h4>
            </div>
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="col-md-3">
                        <!-- Exibir campo para filtrar status dos depoimentos e exibir de acordo com o status selecionado -->

                        <%--<input class="form-control input-md" id="txtDataInicioAtividade" type="date" runat="server" />--%>
                    </div>
                    <%--<div class="col-md-4">
                        <asp:TextBox ID="txtTitulo" CssClass="form-control" runat="server"
                            placeholder="Buscar depoimentos">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button CssClass="btn btn-info" runat="server" ID="btnBuscar" Text="Buscar" />
                    </div>--%>
                </div>
                <div class="col-sm-12">
                    <br />
                    <asp:ScriptManager ID="scriptManager" runat="server" />
                    <asp:UpdatePanel ID="updtPanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row">
                                <% foreach (BackEnd.Controllers.depoimento d in listaDepoimentos)
                                    { %>
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <a href="depoimento_editar.aspx?ID=<%:d.id%>">
                                            <div class="caption">
                                                <h3><%: d.descricao %></h3>
                                                <p><%: '('+d.nome + ", "+ d.data.ToString()+')' %></p>
                                                <%--<p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>--%>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <% } %>
                                <% if (listaDepoimentos.Count < 1)
                                    { %>
                                <h4>Nenhum depoimento encontrado</h4>
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
