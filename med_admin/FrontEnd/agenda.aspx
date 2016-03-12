<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    
    <div class="col-md-12">        
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">
                <div class="form-group">
                    <div class="col-md-3">
                        <div class="input-group">                                            
                            <div runat="server" class="input-group-addon btn" id="btnAnterior" onclick="DiaAnterior()"><i class="fa fa-chevron-left"></i></div>
                            <input runat="server" id="txtData" onkeyup="formataData(this,event);"  onblur="Post()"
                                    maxlength="10" class="dt form-control" type="text" />
                            <div runat="server" class="input-group-addon btn" id="btnPosterior" onclick="DiaPosterior()"><i class="fa fa-chevron-right"></i></div>                                            
                        </div>
                    </div>                                
                    <div class="col-sm-6 text-center">
                        <h5><asp:Label ID="txtTexto" runat="server" class="text-center"/></h5>
                    </div>
                </div>
            </div>
                        
            <div class="panel-body">
            <% if (gvAgenda.Rows.Count > 0) { %>
                <asp:GridView runat="server" ID="gvAgenda" CssClass="table table-bordered" 
                    GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="gvAgenda_RowCommand" 
                        meta:resourcekey="gvAgendaResource1">
                <Columns>                                
                <asp:TemplateField HeaderText="Hora de início">
                    <ItemTemplate>
                        <%# DateTime.Parse(Eval("data_inicial").ToString()).ToShortTimeString() %>
                    </ItemTemplate>
                    <HeaderStyle Width="100px"></HeaderStyle>
                </asp:TemplateField>                                                                  
                    <asp:TemplateField HeaderText="Detalhes" >
                    <ItemTemplate>
                        <%#Eval("descricao") %>
                    </ItemTemplate>
                </asp:TemplateField>                                  
                <asp:ButtonField CommandName="Abrir" HeaderStyle-Width="40" Text="Abrir Registro">
                    <ControlStyle CssClass="btn btn-xs btn-default"/>                                    
                <HeaderStyle Width="40px"></HeaderStyle>
                </asp:ButtonField>
                </Columns>                            
                </asp:GridView>                                 
            <%} else { %>
                <h4 style="text-align: center">Nada agendado"</h4>
            <%} %>
            </div>                                                                                
        </div>
    </div>                 	

    <script type="text/javascript">
        $(document).ready(function () {

            //$('.dt').datepicker({
            //    format: "dd/mm/yyyy",
            //    lang: 'pt-BR',
            //    calendarWeeks: true,
            //    todayHighlight: true
            //});

        });

        function DiaPosterior() {
            __doPostBack('btnPosterior', 'posterior');
        }

        function DiaAnterior() {
            __doPostBack('btnAnterior', 'anterior');
        }

        function Post() {
            __doPostBack('agenda', '');
        };

        //$('.dt').on('        
    </script>
    <style type="text/css">
        .rdius {
            border-radius: 50%!important;
        }
    </style>

</asp:Content>

