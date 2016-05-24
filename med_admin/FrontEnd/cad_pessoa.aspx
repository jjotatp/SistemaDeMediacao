<%@ Page Title="" Language="C#" MasterPageFile="~/medAdmin.master" AutoEventWireup="true"
CodeBehind="cad_pessoa.aspx.cs" Inherits="FrontEnd.cad_pessoa" %>
    <%@ MasterType VirtualPath="~/medAdmin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Cadastrar Parte da Mediação (Pessoa Envolvida)
                </h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        CPF
                    </label>
                    <div class="col-sm-6">
                        <asp:TextBox AutoPostBack="true" CssClass="form-control" id="txtCPF" onkeypress="formataCPF(this,event);"
                        OnTextChanged="txtCPF_TextChanged" runat="server" required="required">
                        </asp:TextBox>
                        <asp:Label id="lblAlertaCPF" runat="server" Font-Size="8pt" ForeColor="#00CC66">
                        </asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        RG
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtRG" onkeypress="formataRG(this,event);" required="required" runat="server">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Nome
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtNome" type="text" runat="server" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label" for="nome">
                        Estado Civil
                    </label>
                    <div class="col-md-6">
                        <asp:DropDownList CssClass="form-control" ID="ddEstadoCivil" runat="server"
                        ToolTip="Selecione o estado civil">
                            <asp:ListItem Text="Casado(a)" Value="casado">
                            </asp:ListItem>
                            <asp:ListItem Text="Solteiro(a)" Value="solteiro">
                            </asp:ListItem>
                            <asp:ListItem Text="Divorciado(a)" Value="divorciado">
                            </asp:ListItem>
                            <asp:ListItem Text="Viúvo(a)" Value="viuvo">
                            </asp:ListItem>
                            <asp:ListItem Text="Separado(a)" Value="separado">
                            </asp:ListItem>
                            <asp:ListItem Text="Companheiro(a)" Value="companheiro">
                            </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Profissão
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtProfissao" type="text" runat="server"
                        required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        Data de Nascimento
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtDataNascimento" type="date" runat="server"
                        required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Cidade Natal
                    </label>
                    <div class="col-sm-6">
                        <asp:DropDownList CssClass="form-control" ID="ddCidadeNatal" runat="server"
                        ToolTip="Selecione a cidade em que nasceu">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Sexo
                    </label>
                    <div class="col-sm-6">
                        <asp:RadioButtonList ID="rdbSexo" runat="server" CssClass="radio radio-primary">
                            <asp:ListItem Value="M" Selected="True">
                                Masculino
                            </asp:ListItem>
                            <asp:ListItem Value="F">
                                Feminino
                            </asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Nome do Pai
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtNomePai" type="text" runat="server"
                        required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Nome da Mãe
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtNomeMae" type="text" runat="server"
                        required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Logradouro
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtLogradouro" type="text" runat="server"
                        required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Número
                    </label>
                    <div class="col-sm-2">
                        <input class="form-control" id="txtNumero" type="text" runat="server"
                        required="required">
                    </div>
                    <label class="col-sm-1 control-label" for="">
                        Bairro
                    </label>
                    <div class="col-sm-3">
                        <input class="form-control" id="txtBairro" type="text" runat="server"
                        required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="">
                        Cidade
                    </label>
                    <div class="col-sm-6">
                        <asp:DropDownList CssClass="form-control" ID="ddCidade" runat="server"
                        ToolTip="Selecione sua cidade">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="inputEmail3">
                        Telefone
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" id="txtTelefone" runat="server" onkeypress="formataTelefone(this,event);">
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="container text-right">
                <asp:button id="btnNovaPessoa" runat="server" cssclass="btn btn-success"
                text="Salvar e registrar uma outra parte" OnClick="btnNovaPessoa_Click" />
                <asp:Button id="btnMediacao" runat="server" CssClass="btn btn-purple"
                Text="Salvar e ir para a mediação" OnClick="btnMediacao_Click" />
            </div>
        </div>
    </div>
</asp:Content>