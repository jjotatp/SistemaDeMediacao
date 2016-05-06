<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="historico_mediacoes.aspx.cs" Inherits="FrontEnd.historico_mediacoes" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-md-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Histórico de Mediações
                </h4>
            </div>                                                   
            <div class="panel-body">
                <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover" GridLines="None"
                            AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Numero" OnRowCommand="gdvLista_RowCommand"
                                PageSize="10" OnPageIndexChanging="gdvLista_PageIndexChanging" EmptyDataText="Nenhuma mediação encontrada.">
                    <Columns>
                        <asp:TemplateField HeaderText="Número">
                            <ItemTemplate>
                                <%#Eval("Numero") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tema do Conflito">
                            <ItemTemplate>
                                <%#Eval("TemaConflito") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data">
                            <ItemTemplate>
                                <%#DateTime.Parse(Eval("Data").ToString()).ToShortDateString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo de Registro">
                            <ItemTemplate>
                                <%#Eval("DescricaoTipoRegistro") %>
                            </ItemTemplate>
                        </asp:TemplateField>                
                               
                        <asp:ButtonField CommandName="Visualizar" HeaderStyle-Width="40" Text="Visualizar" runat="server">
                            <ControlStyle CssClass="btn btn-xs btn-info"/>                         
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </asp:ButtonField>
                
                    </Columns>
                    <PagerSettings Mode="NextPrevious"
                        Position="Bottom"                                
                        PageButtonCount="8"
                        NextPageText="<div class='form-control btn-default'><b> Próxima </b></div>"
                        PreviousPageText="<div class='form-control btn-default'><b> Anterior </b></div>" />            
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>                           
            </div>
        </div>
    </div>
</asp:Content>
