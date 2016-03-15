    <%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">

    
    <div class="col-md-4">
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">
                <h3>Horários agendados</h3>
            <p>
                Selecione o dia que deseja visualizar
            </p>  
            </div>
            <div class="panel-body clearfix">
                <div class="form-group">
                    <div class="col-md-12">
                        <asp:Calendar ID="clData" runat="server" CssClass="calendar" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="Day"></asp:Calendar>                            
                    </div>                
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                    <a role="button" data-toggle="collapse" href="#collapseAgendar" aria-expanded="false"
                                aria-controls="collapseExample" onclick="AtribuiDataAgendar();"><span class="btn btn-success">Agendar</span></a>

                    </div>
                </div>
                <div class="collapse" id="collapseAgendar">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">
                                Data
                            </label>
                            <div class="col-lg-9">
                                <input type="date" class="form-control dateSet" onkeyup="formataData(this,event);" runat="server" id="txtDataAgendar"  MaxLength="10"/>
                            </div>                            
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">
                                Horário de
                            </label>                            
                            <div class="col-lg-4">
                                <input type="time" class="form-control" runat="server" id="txtHoraInicial"  MaxLength="5"/>
                            </div>                            
                            <label class="col-lg-1 control-label">
                                até
                            </label>
                            <div class="col-lg-4">
                                <input type="time" class="form-control" runat="server" id="txtHoraFinal"  MaxLength="5"/>
                            </div>              
                        </div>                        
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="descricao">
                                Descrição
                            </label>
                            <div class="col-md-9">
                                <input id="txtDescricaoAgendamento" class="form-control input-md" runat="server">
                            </div>
                        </div>
                        <center>                           
                            <asp:Button ID="btnAgendar" runat="server" Text="Realizar Agendamento"
                                CssClass="btn btn-success btn-rounded" OnClick="btnAgendar_Click"></asp:Button>  
                        </center>
                    </div>

            </div>
                    
        </div>
    </div>
    <div class="col-md-8">        
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">                
                    <div class="col-md-4">
                        <div class="input-group">                                                                        
                            <div runat="server" class="input-group-btn">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" OnClick="btnAnterior_Click" Font-Bold="true" Text="<"/>
                            </div>                    
                            <center>
                                <input runat="server" id="txtData" onkeyup="formataData(this,event);" maxlength="10" class="dt form-control text-center dateGet" type="text" />                                                        
                            </center>        
                            <div runat="server" class="input-group-btn">
                                <asp:Button ID="btnPosterior" runat="server" CssClass="btn btn-default" OnClick="btnPosterior_Click" Text=">" Font-Bold="true" />
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
                <asp:ButtonField CommandName="Abrir" HeaderStyle-Width="40" Text="Apagar">
                    <ControlStyle CssClass="btn btn-xs btn-danger"/>                                    
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
        function AtribuiDataAgendar() {
            //jQuery('.dateSet').val(jQuery('.dateGet').val);
        }
    </script>
</asp:Content>

