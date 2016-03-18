<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="lista_local.aspx.cs" Inherits="FrontEnd.lista_local" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <%@ MasterType VirtualPath="~/med_admin.master"  %>              
    <div class="container">
        <div class="col-md-12">
            <h3>
                Listagem - Núcleos de Mediação
            </h3>
            <p>
                Lista dos núcleos de mediação cadastrados
            </p>
        </div>
        <br />
        <div class="col-md-5">
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Digite o nome e realize a busca"></asp:TextBox>
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
                        <%#Eval("nome") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descrição" >
                    <ItemTemplate>
                        <%#Eval("descricao") %>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Cidade" >
                    <ItemTemplate>
                        <%#Eval("cidade.nome") %>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Bairro" >
                    <ItemTemplate>
                        <%#Eval("bairro") %>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Logradouro" >
                    <ItemTemplate>
                        <%#Eval("logradouro") %>
                    </ItemTemplate>
                </asp:TemplateField>                
                <asp:TemplateField HeaderText="Telefone" >
                    <ItemTemplate>
                        <%#Eval("telefone") %>
                    </ItemTemplate>
                </asp:TemplateField>        
                <asp:TemplateField HeaderText="Número" >
                    <ItemTemplate>
                        <%#Eval("numero") %>
                    </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Ativo?" >
                    <ItemTemplate>
                        <%# Eval("ativo") %>
                    </ItemTemplate>
                </asp:TemplateField> 

                <asp:ButtonField CommandName="Editar" HeaderStyle-Width="40" Text="Editar" runat="server">
                    <ControlStyle CssClass="btn btn-xs btn-default"/>                         
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
</asp:Content>
