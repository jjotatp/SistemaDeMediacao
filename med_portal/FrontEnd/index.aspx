<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FrontEnd.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Solicite sua Mediação</h1>
                        <p>Em poucos Passos você consegue resolver o problema que te encomoda...</p>
                        <p>Preencha nosso formulário de contato para começar a resolver o seu problema</p>
                        <p><a class="btn btn-danger btn-lg" href="solicitacao.aspx" role="button">Solicitação</a></p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

    <br />

    <div class="container">
        <!-- div body -->

        <section id="menus-especiais">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-sm-4 wow fadeIn data-wow-duration="6s" data-wow-delay="0.5s"">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-info-sign"></span> O que é Mediação?</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: center;"> Conheça um pouca mais sobre Mediação</p>
                                <ul class="pager">
                                    <li><a href="oQueEMeciacao.html">Saiba Mais</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 wow fadeIn data-wow-duration="6s" data-wow-delay="0.7s"">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-bullhorn"></span> Exemplificação de Mediação</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: center;"> Listamos alguns casos que resolvemos aqui</p>
                                <ul class="pager">
                                    <li><a href="exCasos.aspx">Saiba Mais</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 wow fadeIn data-wow-duration="6s" data-wow-delay="0.9s"">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span> Pontos de Mediação</h3>
                            </div>
                            <div class="panel-body">
                                <p style="text-align: center;"> Conheça o que tem mais próximo de você...</p>
                                <ul class="pager">
                                    <li><a href="pontoDeMeciacao.html">Saiba Mais</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section id="artigos">
            <div class="container">
                <div class="col-md-12">
                    <div class="page-header">
                      <h1 class="titulo-artigo"><span class="glyphicon glyphicon-exclamation-sign"></span> Atigos <small>Alguns textos sobre Mediação</small></h1>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="thumbnail">
                                    <img src="https://farm1.staticflickr.com/187/390803227_b368fb0a30_o.jpg" alt="...">
                                    <div class="caption">
                                        <h3>Artigo Principal 01</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                        <p><a href="#" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 col-md-4">
                                <div class="thumbnail">
                                    <img src="http://2.bp.blogspot.com/-xipn6itNUMI/Vnc4E2zlMmI/AAAAAAAAAbo/_B1dKg1hRIE/s1600/tumblr_inline_nvtmpaaR7c1r3b7m6_500.jpg" alt="...">
                                    <div class="caption">
                                        <h3>Artigo Principal 02</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                        <p><a href="#" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-header">
                              <h1 class="titulo-artigo"><span class="glyphicon glyphicon-list-alt"></span> Noticias <small>Fique ligado!</small></h1>
                            </div>
                    <div class="row">
                        
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                <div class="caption">
                                    <h3>Artigo 01</h3>
                                    <p><a href="#" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                <div class="caption">
                                    <h3>Artigo 02</h3>
                                    <p><a href="#" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                <div class="caption">
                                    <h3>Artigo 03</h3>
                                    <p><a href="#" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                </div>
                            </div>
                        </div>

                    
                    </div>
                </div>
            </div>
        </section>
</asp:Content>
