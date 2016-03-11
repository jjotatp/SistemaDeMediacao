<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true"
CodeBehind="cad_mediacao.aspx.cs" Inherits="FrontEnd.cad_mediacao" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
        <div class="container">
            <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <h1>
                    Cadastro de Mediação
                </h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus iaculis
                    ante in quam molestie.
                </p>
                <br>
            </div>
            <div class="col-md-12">
                <div class="panel panel-color panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="ion-chatbubble">
                            </i>
                            Cadastro de Mediação
                        </h3>
                    </div>
                    <div class="panel-body">                        
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Tema do Conflito
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="txtTemaConflito" type="text" placeholder="Tema do Conflito" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Data
                            </label>
                            <div class="col-sm-5">
                                <input class="form-control" id="txtData" type="date" runat="server">
                            </div>
                            <div class="col-sm-4">
                                <input class="form-control" id="txtHora" type="time" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Número
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="txtNumero" type="number" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="sel1">
                                Tipo de Registro
                            </label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddTipoRegistro" runat="server" CssClass="form-control"></asp:DropDownList>     
                            </div>
                        </div>                            
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Objeto da Mediação
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="5" placeholder="Objeto de Mediação" id="txtObjetoMediacao" runat="server">
                                </textarea>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
            <!--==============PRIMEIRA PARTE==============-->
            <div class="col-md-6">
                <div class="panel panel-color panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Cadastrando Partes de Mediação - Parte 1
                        </h4>
                    </div>
                    <div class="panel-body">                        
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    CPF
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="txtCPF_1" type="number" onkeypress="formataCPF(this,event);">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Nome
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="txtNome_1" type="text" runat="server">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    RG
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="txtRG_1" type="number" onkeypress="formataRG(this,event);">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Data de Nascimento
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="txtDataNascimento_1" type="date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Cidade Natal
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="txtCidadeNatal_1" type="text" runat="server">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <asp:RadioButtonList ID="rdbSexo_1" runat="server">
                                        <asp:ListItem Value="M" Selected="True">Masculino</asp:ListItem>
                                        <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    </asp:RadioButtonList>                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Nome do Pai
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="txtNomePai_1" type="text" runat="server">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Nome da Mãe
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="" type="text" placeholder="Nome da Mae">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Cidade Natal
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="" type="text" placeholder="Cidade Natal">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="inputEmail3">
                                    Telefone
                                </label>
                                <div class="col-sm-9">
                                    <input class="form-control" id="inputEmail3" type="number" placeholder="Telefone">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="">
                                    Declata que:
                                </label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="5">
                                    </textarea>
                                </div>
                            </div>                        
                    </div>
                </div>
            </div>
            <!--===========OUTRA PARTE===========-->
            <div class="col-md-6">
                <div class="panel panel-color panel-danger">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Cadastrando Partes de Mediação - Parte 2
                        </h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                CPF
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="number" placeholder="CPF">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Nome
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="text" placeholder="Nome">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                RG
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="number" placeholder="RG">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Data de Nascimento
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="text" placeholder="Data de Nascimento">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Cidade Natal
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="text" placeholder="Cidade Natal">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="radio ">
                                    <input id="" type="radio">
                                    <label for="">
                                        Masculino
                                    </label>
                                    <br>
                                    <input id="" type="radio">
                                    <label for="">
                                        Feminino
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Nome do Pai
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="text" placeholder="Nome do Pai">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Nome da Mãe
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="text" placeholder="Nome da Mae">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Cidade Natal
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="" type="text" placeholder="Cidade Natal">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="inputEmail3">
                                Telefone
                            </label>
                            <div class="col-sm-9">
                                <input class="form-control" id="inputEmail3" type="number" placeholder="Telefone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="">
                                Declata que:
                            </label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="5">
                                </textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                <a href="#"> <span class="label label-dark">Click para adicionar mais partes</span></a>
                <br>
                <br>
                <button class="btn btn-danger w-lg btn-rounded" type="submit">
                    Assinar Termo
                </button>
            </div>
        </div>
    </asp:Content>