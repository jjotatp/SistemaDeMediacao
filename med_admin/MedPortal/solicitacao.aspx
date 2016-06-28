<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="solicitacao.aspx.cs" Inherits="FrontEnd.solicitacao" %>
<%@ MasterType VirtualPath="med_portal.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <div class="row">
            <section>
                <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                    <h1 class="titulo">Para fazer a solicitação de uma Mediação</h1>
                    <h3>Deverá seguir alguns passos primeiro</h3>

                    <br>
                </div>
                <div class="wizard">
                    <div class="wizard-inner">
                        <div class="connecting-line"></div>
                        <ul class="nav nav-tabs" role="tablist">

                            <li role="presentation" class="active">
                                <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-edit"></i>
                            </span>
                                </a>
                            </li>

                            <li role="presentation" class="disabled">
                                <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-comment"></i>
                            </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-time"></i>
                            </span>
                                </a>
                            </li>

                            <li role="presentation" class="disabled">
                                <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                                </a>
                            </li>
                        </ul>
                    </div>

                        <div class="tab-content">
                            <small class="col-sm-offset-3">Campos com * são obrigatórios</small>
                            <div class="tab-pane active col-md-offset-3" role="tabpanel" id="step1">
                                <h3>Etapa 1</h3>
                                <p>Seus Dados Essenciais</p>
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group col-md-8 ">
                                        <label class="control-label" for="nome">Nome *</label>
                                        <input name="nome" class="form-control input-md" id="txtNome" type="text" placeholder="Escreva o seu nome" runat="server" required="required">
                                        <br>
                                        <label class=" control-label" for="endereco">Endereço</label>
                                        <input name="endereco" class="form-control input-md" id="txtEndereco" type="text" placeholder="Rua Exemplo, n 111, Bairro exemplo, Mirassol" runat="server">
                                        <br>
                                        <label class="col-md-4 control-label" for="telefone">Telefone *</label>
                                        <input name="telefone" class="form-control input-md" id="txtTelefone" type="text" placeholder="(xx)1111-1111" runat="server" required="required" onkeypress="formataTelefone(this,event);">
                                        <br>
                                        <label class="col-md-4 control-label" for="email">Email</label>
                                        <input name="email" class="form-control input-md" id="txtEmail" type="text" placeholder="email@email.com.br" runat="server">
                                    </div>
                                </fieldset>

                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-primary next-step">Continuar</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane col-md-offset-3" role="tabpanel" id="step2">
                                <h3>Etapa 2</h3>
                                <p>Sobre o Caso</p>
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group col-md-8 ">
                                        <label class="control-label" for="txtDescProblema">Conte um pouco do caso *</label>
                                        <asp:TextBox TextMode="MultiLine" Rows="5" runat="server" ID="txtDescCaso" CssClass="form-control input-md" placeholder="Descreva brevemente o problema" required="required"></asp:TextBox>
                                        <br>
                                        <label class="control-label" for="txtDadosPartes">Dados outra(as) Parte(es) *</label>
                                        <br>
                                        <asp:TextBox TextMode="MultiLine" Rows="5" runat="server" ID="txtDadosPartes" placeholder="Insira dados das partes envolvidas, facilitando o contato (Nome, Endereço, Telefone)" CssClass="form-control input-md" required="required"></asp:TextBox>
                                    </div>
                                </fieldset>
                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-default prev-step">Voltar</button></li>
                                    <li><button type="button" class="btn btn-primary next-step">Continuar</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane col-md-offset-3" role="tabpanel" id="step3">
                                <h3>Etapa 3</h3>
                                <p>Gostariamos que informasse seu período e dia da semana melhores para uma reunião.</p>
                                    <fieldset>

                                        <!-- Multiple Checkboxes -->
                                        <div class="form-group col-md-8">
                                            <asp:CheckBoxList runat="server" ID="cbgDia" CssClass="col-md-6">
                                                <asp:ListItem Text="Segunda"></asp:ListItem>
                                                <asp:ListItem Text="Terça"></asp:ListItem>
                                                <asp:ListItem Text="Quarta"></asp:ListItem>
                                                <asp:ListItem Text="Quinta"></asp:ListItem>
                                                <asp:ListItem Text="Sexta"></asp:ListItem>
                                            </asp:CheckBoxList>
                                            <asp:CheckBoxList runat="server" ID="cbgPeriodo" CssClass="col-md-6">
                                                <asp:ListItem Text="Manhã"></asp:ListItem>
                                                <asp:ListItem Text="Tarde"></asp:ListItem>
                                                <asp:ListItem Text="Noite"></asp:ListItem>
                                            </asp:CheckBoxList>
                                            <br><br>
                                            <label class="control-label" for="ddLocal">Selecione o Núcleo de Mediação mais próximo de você</label>
                                            <br>
                                            <asp:DropDownList runat="server" ID="ddLocal" CssClass="form-control" placeholder="Selecione...">
                                            </asp:DropDownList>
                                        </div>

                                    </fieldset>

                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-default prev-step">Voltar</button></li>
                                    <li><asp:Button runat="server" ID="btnFinalizarSolicitacao" CssClass="btn btn-primary btn-info-full" Text="Continuar" OnClick="btnFinalizarSolicitacao_Click"/></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

