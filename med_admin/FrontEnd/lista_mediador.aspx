<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="lista_mediador.aspx.cs" Inherits="MedAdmin.lista_mediador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
<%@ MasterType VirtualPath="medAdmin.Master"  %>        
<div class="col-sm-10 col-sm-offset-1">
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                Listagem de Mediadores
            </h4>
        </div>
        <div class="panel-body">
            <div class="col-md-5">
                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Digite o nome e realize a busca"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-info" Text="Buscar" OnClick="btnBuscar_Click"/>
                <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-default" Text="Voltar" OnClick="btnVoltar_Click"/>
            </div>
        
            <br />
            <br />

            <div class="col-md-12">
            <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gdvLista_RowCommand"
                        PageSize="5" OnPageIndexChanging="gdvLista_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <%#Eval("ID") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nome">
                        <ItemTemplate>
                            <%#Eval("Nome") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Patente" >
                        <ItemTemplate>
                            <%#Eval("Patente") %>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Núcleo de mediação" >
                        <ItemTemplate>
                            <%#Eval("Nucleo") %>
                        </ItemTemplate>
                    </asp:TemplateField> 
                                
                    <asp:ButtonField CommandName="Editar" HeaderStyle-Width="40" Text="Editar" runat="server">
                        <ControlStyle CssClass="btn btn-xs btn-info"/>                         
                        <HeaderStyle Width="40px"></HeaderStyle>
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
  </div>
</div>
</asp:Content>
