<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="cad_mediador.aspx.cs" Inherits="MedAdmin.cad_mediador" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %> 
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">                 
    <div class="col-sm-10 col-sm-offset-1">
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                Cadastro de Mediador
            </h4>
        </div>
        <div class="panel-body">                                        
            <fieldset>
                <!-- Text input-->                                                                                
                <asp:Label runat="server" ID="txtID" hidden="hidden"></asp:Label>                            
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Nome</label>
                    <div class="col-md-6">
                        <input name="nome" class="form-control input-md" id="txtNome" type="text" placeholder="Nome" runat="server">
                    </div>
                </div>
                                    
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Patente</label>
                    <div class="col-md-6">
                        <input name="patente" class="form-control input-md" id="txtPatente" type="text" placeholder="Patente" runat="server">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="sel1">Núcleo de mediação</label>
                    <div class="col-md-6">
                        <asp:DropDownList runat="server" ID="ddLocal" CssClass="form-control"
                                placeholder="Selecione...">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Nível de permissão</label>
                    <div class="col-md-4">
                        <asp:DropDownList runat="server" ID="ddNivelPermissao" CssClass="form-control"
                                placeholder="Selecione...">
                            <asp:ListItem Text="Padrão" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Avançado" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Administrador" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>              
                    <button type="button" class="btn glyphicon glyphicon-question-sign" data-toggle="modal" data-target="#myModal"></button>
                </div>              
                <!-- Modal -->                                                
                <div id="myModal" class="modal fade" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                        <h3 class="modal-title">Níveis de permissão</h3>
                      </div>
                      <div class="modal-body">
                        <h4>Padrão</h4>
                        <p>Mediadores com a permissão de nível padrão terão acesso ao módulo de solicitações, agenda, registrar mediações e listar o histórico.
                        </p><br />

                        <h4>Avançado</h4>
                        <p>Mediadores com a permissão de nível avançado terão acesso as permissões dos níveis anteriores, e o módulo de resultados.
                        </p><br />

                        <h4>Administrador</h4>
                        <p>Mediadores com a permissão de nível administrador terão acesso total ao sistema, incluindo o módulo de controle (cadastros).
                        </p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                      </div>
                    </div>

                  </div>
                </div>
                <!-- End Modal -->
                            
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Usuário</label>
                    <div class="col-md-6">                        
                        <input runat="server" class="form-control input-md" id="txtUsuario" type="text" placeholder="Nome de usuário">
                    </div>
                </div>
                                    
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Senha</label>
                    <div class="col-md-6">
                        <input class="form-control input-md" id="txtSenha" type="password" placeholder="Digite sua senha" runat="server">
                    </div>
                </div>
                      
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Confirmar Senha</label>
                    <div class="col-md-6">
                        <input class="form-control input-md" id="txtConfirmarSenha" type="password" runat="server" placeholder="Digite novamente sua senha">
                    </div>
                </div>              
                                                                         
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">
                        Status
                    </label>
                    <div class="col-md-6">
                        <input type="checkbox" id="cbbAtivo" runat="server" data-toggle="toggle" data-on="Ativo" data-off="Inativo"/>
                    </div>
                </div>
                                                                      
                <div class="col-md-offset-4">
                    <asp:Button runat="server" id="btnSalvar" class="btn btn-success"
                    OnClick="btnSalvar_Click" Text="Salvar" />
                    <asp:Button runat="server" id="btnListar" class="btn btn-info"
                    OnClick="btnListar_Click" Text="Listar" />
                    <asp:Button runat="server" id="btnLimpar" class="btn btn-warning"
                    OnClick="btnLimpar_Click" Text="Limpar" />
                </div>
            </fieldset>                  
        </div>
    </div>    
 </div>
</asp:Content>
