<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="solicitacoes.aspx.cs" Inherits="FrontEnd.solicitacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <%@ MasterType VirtualPath="~/med_admin.master"  %>  
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
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddTipoBusca" CssClass="form-control" runat="server">
                            <asp:ListItem>Cidade</asp:ListItem>
                            <asp:ListItem>Núcleo de mediação</asp:ListItem>
                            <asp:ListItem>Nome</asp:ListItem>
                            <asp:ListItem>Data</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-7">                    
                        <input type="text" id="txtBusca" runat="server" placeholder="Buscar..." class="form-control">
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click"/>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover" GridLines="None"
                    AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gdvLista_RowCommand"
                        PageSize="8" OnPageIndexChanging="gdvLista_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="ID" >
                    <ItemTemplate>
                        <%#Eval("ID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nome">
                    <ItemTemplate>
                        <%#Eval("Nome") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Núcleo de mediação">
                    <ItemTemplate>
                        <%# Eval("Local") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Data">
                    <ItemTemplate>
                        <%#DateTime.Parse(Eval("Data").ToString()).ToShortDateString() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cidade">
                    <ItemTemplate>
                        <%#Eval("Cidade") %>
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
                    Detalhes da solicitação
                </h3>
            </div>
            <div class="panel-body">                
                <div id="pnlDados" runat="server">
                <fieldset>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="id">
                            ID
                        </label>
                        <div class="col-md-8">
                            <input id="txtId" class="form-control input-md" runat="server" readonly="readonly">
                        </div>
                    </div>
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
                            Problema principal
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
                            Período disponível
                        </label>
                        <div class="col-md-8">
                            <input readonly="readonly" id="txtPeriodo" class="form-control input-md" runat="server" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="">
                        </label>
                        <div class="col-md-8">
                            <a role="button" data-toggle="collapse" href="#collapseAgendar" aria-expanded="false"
                            aria-controls="collapseExample"><span class="btn btn-default">Agendar</span></a>                        
                            <%--<asp:Button ID="btnTransferir" CssClass="btn btn-success" runat="server" Text="Transferir" 
                                ToolTip="Permite selecionar o local para a solicitação ser atendida."/>                --%> 
                            <a role="button" data-toggle="collapse" href="#collapseTransferir" aria-expanded="false" 
                                title="Permite selecionar o núcleo de mediação que a solicitação deve ser atendida."
                            aria-controls="collapseExample"><span class="btn btn-success">Transferir</span></a>                                 
                            <asp:Button ID="btnExcluir" CssClass="btn btn-danger" runat="server" Text="Excluir" 
                                ToolTip="Exclui a solicitação do sistema" OnClientClick="javascript:return confirm('Tem certeza que deseja excluir a solicitação?');"
                                OnClick="btnExcluir_Click"/>
                        </div>
                    </div>

                    <br>
                    <div class="collapse" id="collapseTransferir">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">
                                Transferir para:
                            </label>
                            <div class="col-lg-8">
                                <asp:DropDownList runat="server" ID="ddLocal" CssClass="form-control"
                                placeholder="Selecione...">
                                </asp:DropDownList>
                            </div>                            
                        </div>
                        <center>
                            <asp:Button ID="btnConfirmaTransferencia" runat="server" Text="Confirmar Transferência" 
                                CssClass="btn btn-success btn-rounded" OnClientClick="javascript:return confirm('Tem certeza que deseja transferir a solicitação?');" 
                                OnClick="btnConfirmaTransferencia_Click"></asp:Button>                            
                        </center>
                    </div>
                    <div class="collapse" id="collapseAgendar">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">
                                Data e Hora:
                            </label>
                            <div class="col-lg-5">
                                <input type="date"  class="form-control" onkeyup="formataData(this,event);" runat="server" id="txtData"  MaxLength="10"/>
                            </div>
                            <div class="col-lg-3">
                                <input type="time"  class="form-control" maxlength="5" runat="server" id="txtHora"/>
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
                            <asp:Button ID="btnAgendar" runat="server" Text="Realizar Agendamento"
                                CssClass="btn btn-success btn-rounded" OnClick="btnAgendar_Click"></asp:Button>  
                        </center>
                    </div>
                </fieldset> 
                </div>           
            </div>
        </div>
    </div>
</div>
</asp:Content>
