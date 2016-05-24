<%@ Page Title="" Language="C#" MasterPageFile="~/medAdmin.master" AutoEventWireup="true"
CodeBehind="cad_mediacao.aspx.cs" Inherits="FrontEnd.cad_mediacao" %>
<%@ MasterType VirtualPath="~/medAdmin.master" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">              
        <div class="container">
            <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1>
                    Cadastro de Mediação
                </h1>                
            </div>
            <!--==============DECLARAÇÃO DAS PARTES==============-->            
            <div class="col-md-12">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Declaração das partes envolvidas
                        </h4>
                    </div>
                    <asp:Panel CssClass="panel-body" ID="pnlDepoimentos" runat="server"> 
                        <asp:PlaceHolder runat="server" ID="TextBoxPlaceHolder"></asp:PlaceHolder>                             
                        <%--<% foreach (BackEnd.Controllers.pessoa p in lista)
                           { %>                                           
                                <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                    <%: p.nome %>
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox CssClass="form-control" id="Txt" runat="server">
                                    </asp:TextBox>
                                </div>
                        </div>                     
                        <% } %>--%>
                    </asp:Panel>
                </div>
            </div>
            <!--====================DADOS DA MEDIAÇÃO===============-->
            <div class="col-md-12">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="ion-chatbubble">
                            </i>
                            Dados da Mediação
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="">
                                Data
                            </label>
                            <div class="col-sm-2">
                                <input class="form-control" id="txtData" type="date" runat="server" required="required">
                            </div>
                            <label class="col-sm-2 control-label" for="">
                                Hora
                            </label>
                            <div class="col-sm-2">
                                <input class="form-control" id="txtHora" type="time" runat="server" required="required">
                            </div>
                        </div>                                                
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="">
                                Tema do Conflito
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="txtTemaConflito" type="text" runat="server" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="sel1">
                                Tipo de Registro
                            </label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddTipoRegistro" runat="server" CssClass="form-control"></asp:DropDownList>     
                            </div>
                        </div>      
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="sel1">
                                Resolução da Mediação
                            </label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddResolucao" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="True" Text="Acordo entre as partes" Value="A"></asp:ListItem>
                                    <asp:ListItem Text="Desacordo entre as partes" Value="D"></asp:ListItem>
                                </asp:DropDownList>     
                            </div>
                        </div>                                                 
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="">
                                Objeto da Mediação
                            </label>
                            <div class="col-sm-9">
                                <asp:TextBox TextMode="MultiLine" Rows="5" CssClass="form-control" id="txtObjetoMediacao" runat="server" required="required"></asp:TextBox>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>  
        </div>          
        <div class="form-group">
            <div style="text-align: center;" class="col-md-10 col-md-offset-1">                
                <asp:Button CssClass="btn btn-success" runat="server" ID="btnSalvar" Text="Salvar Mediação" OnClick="btnSalvar_Click"/>
            </div>
        </div>        
    </asp:Content>