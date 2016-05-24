<%@ Page Title="" Language="C#" MasterPageFile="~/medAdmin.master" AutoEventWireup="true" CodeBehind="result_tipo_registro.aspx.cs" Inherits="FrontEnd.result_tipo_registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-md-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Resultados das Mediações - Tipos de Registros
                </h4>
            </div>                                                   
            <div class="panel-body">
                <div class="col-md-4">
                    <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover" GridLines="None"
                                AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Tipos de Registro">
                                <ItemTemplate>
                                    <%# Eval("Tipo_Registro") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <%# Eval("Total") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>                           
                </div>
            </div>
        </div>
    </div>
</asp:Content>
