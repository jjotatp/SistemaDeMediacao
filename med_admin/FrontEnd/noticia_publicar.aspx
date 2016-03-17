<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="noticia_publicar.aspx.cs" Inherits="FrontEnd.noticia_publicar" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <form class="form-horizontal" id="form1" runat="server">
        <div class="container">
                <div class="col-md-5">
                    <div class="row">                    
                        <div class="col-md-12">
                            <asp:Image ID="imgImagemCarregada" runat="server" />
                        </div>
                        <div class="form-group col-md-9">                            
                            <asp:FileUpload ID="uplImagemCarregada" Width="300px" runat="server" OnDataBinding="uplImagemCarregada_DataBinding" />                            
                        </div>                                          
                        <div class="form-group col-md-3">
                            <asp:Button ID="btnCarregarImagem" runat="server" Text="Carregar Imagem" OnClick="btnCarregarImagem_Click" ValidationGroup="vg" CssClass="btn btn-default" />
                        </div>
        <br />
        <asp:Label ID="lblMsg" runat="server" ForeColor="Green" Text=""></asp:Label>
        <h2 style="text-decoration: underline; font-weight: bold; color: #0066FF;">
            Listagem de Imagens
        </h2>
        <asp:GridView ID="gdvListaImagens" runat="server" EmptyDataText="Nenhuma foto selecionada."
            AutoGenerateColumns="False" Font-Names="Verdana" AllowPaging="true" PageSize="5"
            Width="40%" OnPageIndexChanging="gdvListaImagens_PageIndexChanging"
            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" OnRowDataBound="gdvListaImagens_RowDataBound"
            DataKeyNames="imagem">
            <AlternatingRowStyle BackColor="#FFD4BA" />
            <HeaderStyle Height="30px" BackColor="#FF9E66" Font-Size="15px" BorderColor="#CCCCCC"
                BorderStyle="Solid" BorderWidth="1px" />
            <RowStyle Height="20px" Font-Size="13px" HorizontalAlign="Center" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" />
            <Columns>                                                
                <asp:TemplateField HeaderText="Lista de Images" HeaderStyle-Width="40%">
                    <ItemTemplate>
                        <asp:Image ID="UsrImages" runat="server" Height="35px" Width="35px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


                        <%--<div class="col-md-12 portlets">
                            <h4 class="page-title">Clique ou arraste o arquivo</h4>
                            <!-- Your awesome content goes here -->
                            <div class="m-b-30">
                                <form action="#" class="dropzone" id="dropzone">
                                    <div class="fallback">
                                        <input name="file" type="file" multiple />
                                    </div>
                                </form>
                                <div class="clearfix pull-right m-t-15">
                                    <button type="button" class="btn btn-success btn-rounded">Enviar</button>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="card-box">
                            <h4 class="m-b-30 m-t-0 header-title"><b>Editor de texto</b></h4>
                            <div class="summernote">
                                <h3>Hello World</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix pull-right m-t-15">
                    <button type="button" class="btn btn-success btn-rounded">Enviar</button>
                </div>
        </div>
    </form>
</asp:Content>
