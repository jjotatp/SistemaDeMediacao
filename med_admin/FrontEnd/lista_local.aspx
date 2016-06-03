<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="lista_local.aspx.cs" Inherits="MedAdmin.lista_local" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <%@ MasterType VirtualPath="medAdmin.Master"  %>              
<div class="col-sm-10 col-sm-offset-1">
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                Listagem de Núcleos de Mediação
            </h4>
        </div>
        <div class="panel-body">
        <div class="col-md-5">
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Digite o nome e realize a busca"></asp:TextBox>
        </div>
        <div class="col-md-2">
            <asp:CheckBox id="cbSomenteAtivo" runat="server" CssClass="checkbox checkbox-info" Checked="true" Text="Listar somente ativos"/>
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-info" Text="Buscar" OnClick="btnBuscar_Click"/>
            <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-default" Text="Voltar" OnClick="btnVoltar_Click"/>
        </div>
                
        <br />
        <br />

        <div class="col-md-12">
        <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                    AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" OnRowCommand="gdvLista_RowCommand"
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
                <asp:TemplateField HeaderText="Descrição" >
                    <ItemTemplate>
                        <%#Eval("Descrição") %>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Cidade" >
                    <ItemTemplate>
                        <%#Eval("Cidade") %>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Bairro" >
                    <ItemTemplate>
                        <%#Eval("Bairro") %>
                    </ItemTemplate>
                </asp:TemplateField>               
                <asp:TemplateField HeaderText="Telefone" >
                    <ItemTemplate>
                        <%#Eval("Telefone") %>
                    </ItemTemplate>
                </asp:TemplateField>        
                <asp:TemplateField HeaderText="Status" >
                    <ItemTemplate>
                        <%# (Boolean.Parse(Eval("ativo").ToString())) ? "Ativo" : "Inativo" %>
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
