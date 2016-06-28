<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="result_tipo_registro.aspx.cs" Inherits="MedAdmin.result_tipo_registro" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-md-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Resultados das Mediações - Tipos de Registros
                </h4>
            </div>                                                   
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <label>Data Inicial</label>
                        <input class="form-control input-md" id="txtDataIni" type="date" runat="server" />
                    </div>
                    <div class="col-md-2">
                        <label>Data Final</label>
                        <input class="form-control input-md" id="txtDataFim" type="date" runat="server" />
                    </div>
                    <div class="col-md-1">
                        <label class="control-label col-md-1"></label>
                        <br />
                        <asp:Button CssClass="btn btn-info" runat="server" ID="btnBuscar" Text="Filtrar" OnClick="btnBuscar_Click" />
                    </div>
                </div>
                <div class="void"> &nbsp; </div>
                <div class="col-md-4">
                    <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover" GridLines="None"
                                AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Tipos de Registro">
                                <ItemTemplate>
                                    <%# Eval("DESCRICAO") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <%# Eval("TOTAL") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>                           
                </div>
            </div>
        </div>
    </div>
</asp:Content>
