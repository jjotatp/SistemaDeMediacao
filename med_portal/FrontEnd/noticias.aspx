<%@ Page Title="" Language="C#" MasterPageFile="~/med_portal.Master" AutoEventWireup="true" CodeBehind="noticias.aspx.cs" Inherits="FrontEnd.noticias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <header class="header-bg">
        <!-- Portfolio Item Row -->
        <div class="container">
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <div class="jumbotron wow flipInX data-wow-duration="3s"">
                        <h1>Notícias & Artigos</h1>
                        <p>Todas as noticias e artigos sobre mediação...</p>
                    </div>
                </div>

            </div>

            <!-- /.row -->
        </div>
        <!-- /.row -->
    </header>

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
                                        <p><a href="textoNoticias.aspx" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 col-md-4">
                                <div class="thumbnail">
                                    <img src="http://2.bp.blogspot.com/-xipn6itNUMI/Vnc4E2zlMmI/AAAAAAAAAbo/_B1dKg1hRIE/s1600/tumblr_inline_nvtmpaaR7c1r3b7m6_500.jpg" alt="...">
                                    <div class="caption">
                                        <h3>Artigo Principal 02</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                        <p><a href="textoNoticias.aspx" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
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
                                    <p><a href="textoNoticias.aspx" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                <div class="caption">
                                    <h3>Artigo 02</h3>
                                    <p><a href="textoNoticias.aspx" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                <div class="caption">
                                    <h3>Artigo 03</h3>
                                    <p><a href="textoNoticias.aspx" class="btn btn-link" role="button"><samp class="glyphicon glyphicon-chevron-right"></samp> Leia Mais</a> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>
