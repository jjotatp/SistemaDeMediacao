<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="sobreMediacao.aspx.cs" Inherits="FrontEnd.sobreMediacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>O que é Mediação?</h1>
                        <p>Entenda um pouco sobre</p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <div class="col-md-10 col-md-offset-1 text-center">
        <h1 class="titulo-artigo">A mediação comunitária de conflitos</h1><hr>            
    </div>

    <div class="container">        
        <div class="col-md-12 texto">
            <p style="font-size:large">
                A mediação tem como propositura a desconstrução dos conflitos, sejam eles atuais ou potenciais, restaurando a relação entre as pessoas e a construção de uma solução entre as partes. Trata-se de atividade comunicativa e pacificadora, tendo amplo alcance social, fomentando a cidadania e a contenção de conflitos interpessoais na sua origem (na comunidade), evitando a eclosão de violência e crimes graves. Em suma, evitando-se pequenos desentendimentos, evita-se a escalada da violência.<br />
                <br />
                Basicamente, podem ser alvo de mediação:<br />
                · conflitos envolvendo direitos patrimoniais disponíveis<br />
                · conflitos de vizinhança<br />
                · conflitos familiares, desde que observadas as peculiaridades previstas em lei, tais como Lei “Maria da Penha”, Estatuto do Idoso e Estatuto da Criança e do Adolescente
            </p>
        </div>    
        <br />
        <div style="text-align: center;" class="col-md-10 col-md-offset-1">
            <h1 class="titulo">Deseja solicitar uma Mediação?</h1>
            <p><a href="solicitacao.aspx" class="btn btn-danger" role="button">Solicitação</a> </p>
            <br>
        </div>    
    </div> 

</asp:Content>
