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
                <div class="col-md-12">
                    <div class="col-md-3">
                        <!-- Exibir campo para filtrar status dos depoimentos e exibir de acordo com o status selecionado -->
                        <asp:dropdownlist runat="server" id="ddStatus" CssClass="form-control">
                            <asp:ListItem Value="0" Text="Todos"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Pendentes"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Aprovados"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Recusados"></asp:ListItem>
                        </asp:dropdownlist>
                        <%--<input class="form-control input-md" id="txtDataInicioAtividade" type="date" runat="server" />--%>
                    </div>
                    <%--<div class="col-md-4">
                        <asp:TextBox ID="txtTitulo" CssClass="form-control" runat="server"
                            placeholder="Buscar depoimentos">
                        </asp:TextBox>
                    </div>--%>
                    <div class="col-md-2">
                        <asp:Button CssClass="btn btn-info" runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click" />
                    </div>
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
                                    <div class="thumbnail status<%:d.status %>">
                                        <a href="depoimento_editar.aspx?ID=<%:d.id%>">
                                            <div class="caption">
                                                <h5><%: d.descricao %></h5>
                                                <h4><%: '('+d.nome + ", "+ d.data.ToShortDateString()+')' %></h4>
                                                
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

    <style type="text/css">
        .status1 { /* STATUS PENDENTE */
            border: 3px solid gray;
        }
        
        .status2 { /* STATUS APROVADO */
            border: 3px solid green;
        }
        
        .status3 { /* STATUS RECUSADO */
            border: 3px solid red;
        }
    </style>
</asp:Content>
