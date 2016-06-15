<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="solicitacao_concluido.aspx.cs" Inherits="FrontEnd.solicitacao_concluido" %>
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

                            <li role="presentation" class="disabled">
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

                            <li role="presentation" class="active">
                                <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                                </a>
                            </li>
                        </ul>
                    </div>

                        <div class="tab-content">
                            <div class="tab-pane col-md-offset-3" role="tabpanel" id="step1">
                            </div>
                            <div class="tab-pane col-md-offset-3" role="tabpanel" id="step2">
                            </div>
                            <div class="tab-pane col-md-offset-3" role="tabpanel" id="step3">
                            </div>
                            <div class="tab-pane active" role="tabpanel" id="complete">
                                <div style="text-align: center;" class="col-md-10 col-md-offset-1">
                                    <h1 class="titulo">Solicitação feita com Sucesso!</h1>
                                    <h5>Em breve um mediador entrará em contato por telefone on email!</h5>
                                    <p><a class="btn btn-danger btn-lg wow tada data-wow-duration='2s'" href="index.aspx" role="button">Voltar para o Início</a></p>
                                    <br>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
