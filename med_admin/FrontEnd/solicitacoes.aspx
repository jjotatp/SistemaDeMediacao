<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="solicitacoes.aspx.cs" Inherits="MedAdmin.solicitacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <%@ MasterType VirtualPath="medAdmin.Master"  %>               
<%--    <div style="text-align: center;">
        <h1>
            Gerenciamento de Solicitações
        </h1>                
    </div>--%>
    <div class="col-md-7">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="ion-chatbubble">
                    </i>
                    Solicitações
                </h4>                
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddTipoBusca" CssClass="form-control" runat="server">
                            <asp:ListItem>Nome</asp:ListItem>
                            <asp:ListItem>Data</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-7">                    
                        <input type="text" id="txtBusca" runat="server" placeholder="Buscar..." class="form-control">
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-info" Text="Buscar" OnClick="btnBuscar_Click"/>
                    </div>
                </div>
                <asp:GridView ID="gdvLista" runat="server" CssClass="table table-hover" GridLines="None"
                    AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gdvLista_RowCommand"
                        PageSize="8" OnPageIndexChanging="gdvLista_PageIndexChanging" EmptyDataText="Nenhuma solicitação encontrada.">
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
                    <ControlStyle CssClass="btn btn-xs btn-info"/>                         
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
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <i class="ion-chatbubble">
                    </i>
                    Visualização
                </h4>
                <input id="txtId" runat="server" readonly="readonly" hidden="hidden">
            </div>
            <div class="panel-body">                    
                <div class="alert alert-success" role="alert" id="pnlAcaoSoli" runat="server" style="display:none">
                    <strong>
                        <asp:Label ID="lblDescAcaoSoli" runat="server" Text="Solicitação já agendada." Font-Size="10" Visible="true"/>
                    </strong>
                </div> 
                <asp:Panel id="pnlDados" runat="server">                    
                <fieldset>
                    <!-- Botões de opções -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="">
                        </label>
                        <div class="col-md-8">
                            <a role="button" data-toggle="modal" data-target="#modalAgendar" aria-expanded="false">
                                <span class="btn btn-success">Agendar</span>
                            </a>                        
                            <a role="button" data-toggle="modal" data-target="#modalTransferir" aria-expanded="false" 
                                title="Permite selecionar o núcleo de mediação que a solicitação deve ser atendida.">
                                <span class="btn btn-success">Transferir</span>
                            </a>                                 
                            <asp:Button ID="btnExcluir" CssClass="btn btn-danger" runat="server" Text="Arquivar" 
                                ToolTip="Arquiva a solicitação do sistema" OnClientClick="javascript:return confirm('Tem certeza que deseja arquivar a solicitação?');"
                                OnClick="btnExcluir_Click"/>
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
                            Dia  disponível
                        </label>
                        <div class="col-md-8">
                            <input readonly="readonly" id="txtDia" class="form-control input-md" runat="server" type="text">
                        </div>
                    </div>  
                    <!--  ============= MODAL AGENDAR ============  -->
                    <div id="modalAgendar" class="modal fade" role="dialog">                    
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">                            
                            <h3 class="modal-title">Agendar um horário</h3>
                        </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">
                                        Data
                                    </label>
                                    <div class="col-md-8">
                                        <input type="date" class="form-control" onkeyup="formataData(this,event);" runat="server" id="txtData"  MaxLength="10"/>
                                    </div>                            
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">
                                        Hora
                                    </label>                            
                                    <div class="col-md-5">                                        
                                        <input type="time" class="form-control" runat="server" id="txtHoraInicial"  MaxLength="5" placeholder="Horário inicial"/>
                                    </div>                                                    
                                    <div class="col-md-5">
                                        <input type="time" class="form-control" runat="server" id="txtHoraFinal"  MaxLength="5" placeholder="Horário final"/>
                                    </div>              
                                </div>                        
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="descricao">
                                        Detalhes
                                    </label>
                                    <div class="col-md-10">                                        
                                        <textarea id="txtDescricaoAgendamento" class="form-control input-md" runat="server" placeholder="Descrever o agendamento" maxlength="50"></textarea>
                                    </div>
                                </div>                                
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnAgendar" runat="server" Text="Realizar Agendamento"
                                 CssClass="btn btn-success" OnClick="btnAgendar_Click"></asp:Button>   
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>               
                   <!-- ==============  FIM MODAL AGENDAR================= --> 
                    <!--========================= MODAL TRANSFERIR =================== -->                        
                    <div id="modalTransferir" class="modal fade" role="dialog">                    
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">                            
                            <h3 class="modal-title">Transferir a solicitação</h3>
                        </div>
                            <div class="modal-body">
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
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnConfirmaTransferencia" runat="server" Text="Confirmar Transferência" 
                                CssClass="btn btn-success" OnClientClick="javascript:return confirm('Tem certeza que deseja transferir a solicitação?');" 
                                OnClick="btnConfirmaTransferencia_Click"></asp:Button>  
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>     
                    <!--===================== FIM MODAL TRANSFERIR=================== -->    
                </fieldset> 
                </asp:Panel>           
            </div>
        </div>
    </div>
</asp:Content>
