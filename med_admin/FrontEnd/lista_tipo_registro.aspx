<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="lista_tipo_registro.aspx.cs" Inherits="FrontEnd.lista_tipo_registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <%@ MasterType VirtualPath="~/med_admin.master"  %>            
    <div class="container">
        <div class="col-md-12">
            <h3>
                Listagem - Tipos de Registro
            </h3>
            <p>
                Lista dos tipos de registro cadastrados
            </p>
        </div>
        <br />
        <div class="col-md-5">
            <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control" placeholder="Digite o tipo de registro e realize a busca" ToolTip="Nome da Cidade"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click"/>
            <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click"/>
        </div>
        
        <br />
        <br />
        <br />
        <br />
        <br />

        <div class="col-md-12">
        <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                    AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gdvLista_RowCommand"
                    PageSize="5" OnPageIndexChanging="gdvLista_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <%#Eval("id") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nome">
                    <ItemTemplate>
                        <%#Eval("descricao") %>
                    </ItemTemplate>
                </asp:TemplateField>
                               
                <asp:ButtonField CommandName="Editar" HeaderStyle-Width="60" Text="Editar" runat="server">
                    <ControlStyle CssClass="btn btn-xs btn-default"/>                         
                    <HeaderStyle Width="60px"></HeaderStyle>
                </asp:ButtonField>
                
            </Columns>

            <PagerSettings Mode="NextPrevious"
                Position="Bottom"                                
                PageButtonCount="5"
                NextPageText="<div class='form-control btn-default'><b> Próxima Página </b></div>"
                PreviousPageText="<div class='form-control btn-default'><b> Página Anterior </b></div>" />            
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
     </div>       
  </div>
</asp:Content>
