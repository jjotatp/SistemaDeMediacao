    <%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">           
    <div class="col-md-3">
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">
                <h4>Agendamentos</h4>            
            </div>
            <div class="panel-body clearfix">
                <div class="form-group">
                    <div class="col-md-12">
                        <center>
                            <asp:Calendar ID="clData" runat="server" CssClass="table-condensed" OnSelectionChanged="Calendar1_SelectionChanged" 
                                SelectionMode="Day" BorderStyle="None" DayHeaderStyle-BackColor="#D8B221" TitleStyle-BackColor="#FFCA00"></asp:Calendar>
                        </center>
                    </div>                
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <center>
                            <a role="button" data-toggle="collapse" href="#collapseAgendar" aria-expanded="false"
                                aria-controls="collapseExample"><span class="btn btn-success btn-block">Agendar</span></a>
                        </center>
                    </div>
                </div>                
                <div class="collapse" id="collapseAgendar">
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
                            Info
                        </label>
                        <div class="col-md-10">
                            <textarea id="txtDescricaoAgendamento" class="form-control input-md" runat="server" placeholder="Descrever o agendamento" maxlength="50"></textarea>
                        </div>
                    </div>
                    <center>                           
                        <asp:Button ID="btnAgendar" runat="server" Text="Confirmar Agendamento" UseSubmitBehavior="False" 
                            CssClass="btn btn-success btn-rounded" OnClick="btnAgendar_Click"></asp:Button>  
                    </center>
                </div>                    
            </div>                    
        </div>        
    </div>
    <div class="col-md-9">        
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">                
                    <div class="col-md-4">                        
                        <div class="input-group">                                                                        
                            <div runat="server" class="input-group-btn">
                                <asp:Button ID="btnAnterior" UseSubmitBehavior="False" runat="server" CssClass="btn btn-default" OnClick="btnAnterior_Click" Font-Bold="true" Text="<"/>
                            </div>                                                            
                                <asp:TextBox runat="server" AutoPostBack="true" onkeyup="formataData(this,event);" maxlength="10" CssClass="dt form-control text-center" id="txtData"></asp:TextBox>                                
                                <%--<input runat="server" id="txtData" onkeyup="formataData(this,event);" maxlength="10" class="dt form-control text-center" type="text"/>--%>                            
                            <div runat="server" class="input-group-btn">
                                <asp:Button ID="btnPosterior" UseSubmitBehavior="False" runat="server" CssClass="btn btn-default" OnClick="btnPosterior_Click" Text=">" Font-Bold="true" />
                            </div>
                        </div>                        
                    </div>                                
                    <div class="col-sm-6 text-center">
                        <h5><asp:Label ID="txtTexto" runat="server" class="text-center"/></h5>
                    </div>                                                                                
            </div>
                        
            <div class="panel-body">
            <% if (gvAgenda.Rows.Count > 0) { %>
                <asp:GridView runat="server" ID="gvAgenda" CssClass="table table-hover table-striped" 
                    GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gvAgenda_RowCommand">
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
                <asp:TemplateField HeaderText="Detalhes agendamento" >
                    <ItemTemplate>
                        <%#Eval("descricao") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="btnExcluirAgendamento" runat="server" Text="Remove User From Role" CommandName="Apagar" 
                          OnClientClick="confirm('Deseja realmente excluir o agendamento?');" CssClass="btn btn-xs btn-danger"/>
                      <HeaderStyle Width="40px"></HeaderStyle>
                  </ItemTemplate>
                </asp:TemplateField>--%>                                                    
                <asp:ButtonField CommandName="Apagar" HeaderStyle-Width="40" Text="Apagar" >
                    <ControlStyle CssClass="btn btn-xs btn-danger deleteLink" />                                                        
                    <HeaderStyle Width="40px"></HeaderStyle>
                </asp:ButtonField>
                </Columns>                            
                </asp:GridView>                                 
            <%} else { %>
                <h4 style="text-align: center">Nada agendado neste dia</h4>
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

