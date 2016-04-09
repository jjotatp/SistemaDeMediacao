<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">           
    <div class="col-md-3">
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">
                <center>
                    <h5><asp:Label ID="txtTexto" runat="server" class="text-center"/></h5>
                </center>
            </div>
            <div class="panel-body clearfix">
                <div class="form-group">
                    <div class="col-md-12">
                        <center>
                            <asp:Calendar ID="clData" runat="server" CssClass="table-condensed" OnSelectionChanged="Calendar1_SelectionChanged" 
                                SelectionMode="Day" BorderStyle="None" DayHeaderStyle-BackColor="#1E90FF" TitleStyle-BackColor="#ADD8E6" DayHeaderStyle-ForeColor="White"></asp:Calendar>
                        </center>
                    </div>                
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <center>
                            <a role="button" data-toggle="modal" data-target="#modalAgendar"><span class="btn btn-success btn-block">Agendar</span></a>
                        </center>
                    </div>
                </div>                
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
                                        <input type="date" class="form-control dateSet" onkeyup="formataData(this,event);" runat="server" id="txtDataAgendar"  MaxLength="10"/>
                                    </div>                            
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">
                                        Hora
                                    </label>                            
                                    <div class="col-md-5">
                                        <input type="time" class="form-control" runat="server" id="txtHoraInicial"  MaxLength="5" placeholder="Horário de início"/>
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
                                <asp:Button ID="btnAgendar" runat="server" Text="Confirmar Agendamento" UseSubmitBehavior="False" 
                                        CssClass="btn btn-success" OnClick="btnAgendar_Click" data-dismiss="modal"></asp:Button>  
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>                    
            </div>                    
        </div>        
    </div>
    <div class="col-md-9">        
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">
                <center>
                    <h4><asp:Label ID="lblTituloLista" runat="server" class="text-center" Text="Agendamentos"/></h4>
                </center>                                    
            </div>
                        
            <div class="panel-body">
            <% if (gvAgenda.Rows.Count > 0) { %>
                <asp:GridView runat="server" ID="gvAgenda" CssClass="table table-hover table-striped" OnRowCommand="gvAgenda_RowCommand" 
                    GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowDataBound="gvAgenda_RowDataBound" >
                <Columns>                                
                <asp:TemplateField HeaderText="Hora inicial">
                    <ItemTemplate>
                        <%# DateTime.Parse(Eval("data_inicial").ToString()).ToShortTimeString() %>
                    </ItemTemplate>                  
                    <HeaderStyle Width="110px"/>
                </asp:TemplateField>                               
                <asp:TemplateField HeaderText="Hora final">
                    <HeaderStyle Width="110px"/>
                    <ItemTemplate>
                        <%# DateTime.Parse(Eval("data_final").ToString()).ToShortTimeString() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Detalhes agendamento">
                    <ItemTemplate>
                        <%# Eval("descricao") %>
                    </ItemTemplate>
                </asp:TemplateField>                                    
                <asp:TemplateField HeaderStyle-HorizontalAlign="Right">                    
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemTemplate>                                                 
                        <asp:LinkButton ID="btnVisualizar" CssClass="btn btn-xs btn-default" 
                            runat="server" UseSubmitBehavior="false"
                            CommandName="Visualizar" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                            Text="Visualizar Mediação"
                            Tooltip="Visualizar a mediação vinculada ao registro"                               
                            />
                        <asp:LinkButton ID="btnMediacao" CssClass="btn btn-xs btn-success"
                            runat="server" UseSubmitBehavior="false"
                            CommandName="Mediacao" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                            Text="Nova Mediação"    
                            ToolTip="Iniciar uma nova mediação"                         
                            />    
                        <asp:LinkButton ID="btnExcluir" CssClass="btn btn-xs btn-danger" 
                            runat="server" UseSubmitBehavior="false"
                            CommandName="Apagar" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                            Text="Apagar"                 
                            OnClientClick="javascript: return confirm('Confirma a exclusão do agendamento?');" 
                            ToolTip="Apagar o agendamento"                                                                                        
                            />
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>                            
                </asp:GridView>                                 
            <%} else { %>
                <h5 style="text-align: center">Nada agendado neste dia</h5>
            <%} %>
            </div>                                                                                
        </div>
    </div>                 	        
    <script type="text/javascript"> 
        $(".deleteLink").click(function() {
          return confirm('Tem certeza que deseja excluir o agendamento?');
        });
</script>
</asp:Content>

