<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true"
    CodeBehind="cad_local.aspx.cs" Inherits="FrontEnd.cad_local" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
    <asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">              
        <div class="col-sm-10 col-sm-offset-1">
            <div class="panel panel-color panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        Cadastro de Núcleo de Mediação
                    </h4>
                </div>                                               
                <div class="panel-body">
                    <fieldset>
                        <!-- Text input-->
                        <asp:Label runat="server" ID="txtID" hidden="hidden"></asp:Label>                         
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Nome
                            </label>
                            <div class="col-md-6">
                                <asp:TextBox runat="server" CssClass="form-control input-md" ID="txtNome"
                                placeholder="Nome">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">
                                Descrição
                            </label>
                            <div class="col-md-6">
                                <input name="descricao" class="form-control" id="txtDescricao" runat="server" placeholder="Descrição do local" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                CEP
                            </label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtCEP" CssClass="form-control input-md" runat="server" onkeypress="formataCEP(this,event);"
                                placeholder="digite seu CEP"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Logradouro
                            </label>
                            <div class="col-md-6">
                                <input class="form-control input-md" id="txtLogradouro" type="text" placeholder="Logradouro"
                                runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Numero
                            </label>
                            <div class="col-md-6">
                                <input class="form-control input-md" id="txtNumero" type="text"
                                placeholder="Numero" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Bairro
                            </label>
                            <div class="col-md-6">
                                <input class="form-control input-md" id="txtBairro" type="text" placeholder="Bairro"
                                runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">
                                Cidade
                            </label>
                            <div class="col-md-6">
                                <asp:DropDownList runat="server" ID="ddCidade" CssClass="form-control"
                                placeholder="Selecione...">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Início das Atividades
                            </label>
                            <div class="col-md-6">
                                <input class="form-control input-md" id="txtDataInicioAtividade" type="date" runat="server" />
 <%--                               <asp:TextBox runat="server" TextMode="DateTime" CssClass="form-control input-md"
                                    id="txtDataInicioAtividade" onkeypress="formataData(this,event);"></asp:TextBox>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Telefone
                            </label>
                            <div class="col-md-6">
                                <%--<input class="form-control input-md" id="txtDataInicioAtividade" type="date" runat="server" />--%>
                                <asp:TextBox runat="server" CssClass="form-control input-md"
                                    id="txtTelefone" onkeypress="formataTelefone(this,event);"></asp:TextBox>
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
        <script>          
        </script>

    </asp:Content>