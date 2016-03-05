<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="solicitacoes.aspx.cs" Inherits="FrontEnd.solicitacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="container">
    <div class="col-md-7">
        <div class="panel panel-color panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="ion-chatbubble">
                    </i>
                    Solicitações
                </h3>
                <small style="color: #fff;">
                    Lista das solicitações feitas no site. Aqui você pode excluir uma solicitação indevida, agendar um horário para
                    a solicitação e atribuir o local de atendimento da mediação.
                </small>
            </div>
            <div class="panel-heading">
                <div class="form-group">
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddTipoBusca" CssClass="form-control" runat="server">
                            <asp:ListItem>Por Cidade</asp:ListItem>
                            <asp:ListItem>Por Local</asp:ListItem>
                            <asp:ListItem>Por Nome</asp:ListItem>
                            <asp:ListItem>Por Data</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-8">                    
                        <input type="text" id="txtBusca" runat="server" placeholder="Buscar..." class="form-control">
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover" GridLines="None"
                    AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gdvLista_RowCommand"
                        PageSize="8" OnPageIndexChanging="gdvLista_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Nome do solicitante">
                    <ItemTemplate>
                        <%#Eval("solicitante_nome   ") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cidade">
                    <ItemTemplate>
                        <%#Eval("cidade.nome") %>
                    </ItemTemplate>
                </asp:TemplateField>                
                               
                <asp:ButtonField CommandName="Visualizar" HeaderStyle-Width="40" Text="Visualizar" runat="server">
                    <ControlStyle CssClass="btn btn-xs btn-default"/>                         
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
                <%--<div class="table-responsive">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>
                                    Gabriela Angela
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Guilherme Silveira
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>--%>
                <!-- <div class="list-group">
                                <a href="#" class="list-group-item">Matheus Silva | <span class="label label-dark">LIXEIRA</span></a>
                                <a href="#" class="list-group-item">Pedro Camargo | <span class="label label-dark">LIXEIRA</span></a>
                                <a href="#" class="list-group-item">Guilherme Silveira | <span class="label label-dark">LIXEIRA</span></a>
                                <a href="#" class="list-group-item active">André Naves | <span class="label label-dark">LIXEIRA</span></a>
                                <a href="#" class="list-group-item">Gabriela Angela | <span class="label label-dark">LIXEIRA</span></a>
                            </div>
                            -->
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="panel panel-color panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="ion-chatbubble">
                    </i>
                    Descrição
                </h3>
            </div>
            <div class="panel-body">                
                <fieldset>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">
                            Nome
                        </label>
                        <div class="col-md-8">
                            <input id="txtNome" class="form-control input-md" runat="server" readonly="readonly">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="email">
                            Email
                        </label>
                        <div class="col-md-8">
                            <input id="txtEmail" class="form-control input-md" runat="server" readonly="readonly">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="endereco">
                            Endereço
                        </label>
                        <div class="col-md-8">
                            <input id="txtEndereco" class="form-control input-md" runat="server" readonly="readonly">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="endereco">
                            Telefone
                        </label>
                        <div class="col-md-8">
                            <input id="txtTelefone" class="form-control input-md" runat="server" readonly="readonly">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="descricao">
                            Descrição do caso
                        </label>
                        <div class="col-md-8">
                            <input id="txtDescricaoProblema" class="form-control" runat="server" readonly="readonly" />                                
                        </div>
                    </div>
                    <!-- Textarea -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="descricao">
                            Um pouco do Caso
                        </label>
                        <div class="col-md-8">
                            <textarea id="txtDescricaoCaso" class="form-control" runat="server" readonly="readonly">                                    
                            </textarea>
                        </div>
                    </div>
                    <!-- Textarea -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="descricao">
                            Dados outra Parte
                        </label>
                        <div class="col-md-8">
                            <textarea id="txtDadosOutraParte" class="form-control" runat="server" readonly="readonly" >                                    
                            </textarea>
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="">
                            Dia(as) e Horário(os) disponíveis
                        </label>
                        <div class="col-md-8">
                            <input readonly="readonly" id="txtPeriodo" class="form-control input-md" runat="server" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="">
                        </label>
                        <div class="col-md-3">
                            <a role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false"
                            aria-controls="collapseExample"><span class="label label-default">Agendar</span></a>
                        </div>
                        <div class="col-md-2">                                
                            <asp:Button ID="btnAtender" CssClass="btn btn-success" runat="server" Text="Atender" 
                                ToolTip="Define que a solicitação será atendida nesse local"/>
                        </div>
                        <div class="col-md-2">                                
                            <asp:Button ID="btnExcluir" CssClass="btn btn-danger" runat="server" Text="Excluir" 
                                ToolTip="Exclui a solicitação do sistema"/>
                        </div>
                    </div>

                    <br>
                    <div class="collapse" id="collapseExample">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">
                                Dia e Hora:
                            </label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control input-daterange-timepicker" name="daterange"
                                value="01/01/2015 1:30 PM - 01/01/2015 2:00 PM" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="descricao">
                                Descrição
                            </label>
                            <div class="col-md-8">
                                <input id="txtDescricaoAgendamento" class="form-control input-md" runat="server">
                            </div>
                        </div>
                        <center>
                            <button class="btn btn-success btn-rounded">
                                Realizar Agendamento
                            </button>
                        </center>
                    </div>
                </fieldset>            
            </div>
        </div>
    </div>
</div>
</asp:Content>
