<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="solicitacao.aspx.cs" Inherits="FrontEnd.solicitacao" %>
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

                    <form role="form">
                        <div class="tab-content">
                            <div class="tab-pane active col-md-offset-3" role="tabpanel" id="step1">
                                <h3>Etapa 1</h3>
                                <p>Seus Dados Exenciais</p>
                                <form class="form-horizontal">
                                    <fieldset>
                                        <!-- Text input-->
                                        <div class="form-group col-md-8 ">
                                            <label class="control-label" for="nome">Nome</label>
                                            <input name="nome" class="form-control input-md" id="nome" type="text" placeholder="Escreva o seu nome">
                                            <br>
                                            <label class=" control-label" for="endereco">Endereço</label>
                                            <input name="endereco" class="form-control input-md" id="endereco" type="text" placeholder="Rua Exemplo n111">
                                            <br>
                                            <label class="col-md-4 control-label" for="telefone">Telefone</label>
                                            <input name="telefone" class="form-control input-md" id="telefone" type="text" placeholder="(xx)1111-1111">
                                            <br>
                                            <label class="col-md-4 control-label" for="email">Email</label>
                                            <input name="email" class="form-control input-md" id="email" type="text" placeholder="email@email.com.br">
                                        </div>


                                    </fieldset>
                                </form>

                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-primary next-step">Continuar</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane col-md-offset-3" role="tabpanel" id="step2">
                                <h3>Etapa 2</h3>
                                <p>Sobre o Caso</p>
                                <form class="form-horizontal">
                                    <fieldset>
                                        <!-- Text input-->
                                        <div class="form-group col-md-8 ">
                                            <label class="control-label" for="nome">Conte um pouco do caso:</label>
                                            <textarea class="form-control" rows="5"></textarea>
                                            <br>
                                            <b>Dados outra(as) Parte(es)</b>
                                            <br>
                                            <label class="control-label" for="nome">Nome</label>
                                            <input name="nome" class="form-control input-md" id="nome" type="text" placeholder="Escreva o seu nome">
                                            <br>
                                            <label class=" control-label" for="endereco">Endereço</label>
                                            <input name="endereco" class="form-control input-md" id="endereco" type="text" placeholder="Rua Exemplo n111">
                                            <br>
                                            <label class=" control-label" for="telefone">Telefone</label>
                                            <input name="telefone" class="form-control input-md" id="telefone" type="text" placeholder="(xx)1111-1111">
                                            <br>
                                            <label class=" control-label" for="email">Email</label>
                                            <input name="email" class="form-control input-md" id="email" type="text" placeholder="email@email.com.br">
                                            <br>
                                            <p>Caso você tenha outras informações da outra parte, digite a baixo;</p>
                                            <textarea class="form-control" rows="5"></textarea><br>
                                        </div>
                                    </fieldset>
                                </form>
                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-default prev-step">Voltar</button></li>
                                    <li><button type="button" class="btn btn-primary next-step">Continuar</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="step3">
                                <h3>Etapa 3</h3>
                                <p>Gostariamos que informasse qual periodo e dia dasemana tem disponível.</p>
                                <form class="form-horizontal">
                                    <fieldset>

                                        <!-- Multiple Radios -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="radios"></label>
                                            <div class="col-md-4">
                                                <div class="radio">
                                                    <label for="radios-0">
                                                        <input name="radios" id="radios-0" type="radio" checked="checked" value="1">
                                                        Semana Inteira
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Multiple Checkboxes -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="checkboxes"></label>
                                            <div class="col-md-4">
                                                <div class="checkbox">
                                                    <label for="checkboxes-0">
                                                        <input name="checkboxes" id="checkboxes-0" type="checkbox" value="1">
                                                        Segunda
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkboxes-1">
                                                        <input name="checkboxes" id="checkboxes-1" type="checkbox" value="2">
                                                        Terça
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkboxes-2">
                                                        <input name="checkboxes" id="checkboxes-2" type="checkbox" value="3">
                                                        Quarta
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkboxes-3">
                                                        <input name="checkboxes" id="checkboxes-3" type="checkbox" value="5">
                                                        Quinta
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label for="checkboxes-4">
                                                        <input name="checkboxes" id="checkboxes-4" type="checkbox" value="6">
                                                        Sexta
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Multiple Radios -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="radios"></label>
                                            <div class="col-md-4">
                                                <div class="radio">
                                                    <label for="radios-0">
                                                        <input name="radios" id="radios-0" type="radio" checked="checked" value="1">
                                                        Dia Inteiro
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radios-1">
                                                        <input name="radios" id="radios-1" type="radio" value="2">
                                                        Parte da Manhã
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radios-2">
                                                        <input name="radios" id="radios-2" type="radio" value="3">
                                                        Parte da Tarde
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>

                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-default prev-step">Voltar</button></li>
                                    <li><button type="button" class="btn btn-primary btn-info-full next-step">Continuar</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="complete">
                                <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                                    <h3>Solicitação de Mediação</h3>
                                    <h1 class="titulo">Feita com Sucesso!</h1>
                                    <p><a class="btn btn-danger btn-lg wow tada data-wow-duration="2s"" href="index.aspx" role="button">Voltar para o Início</a></p>
                                    <br>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
