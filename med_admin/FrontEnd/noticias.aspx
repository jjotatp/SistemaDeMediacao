<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="noticias.aspx.cs" Inherits="FrontEnd.noticias" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="container">
                <div class="container">
                    <a href="editar-noticias.html" class="btn btn-block btn-warning" role="button">Novo Artigo</a>
                    <br>
                </div>
                <section id="artigos">
                    <div class="container">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                        <div class="caption">
                                            <h3>Artigo 01</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                            <p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                        <div class="caption">
                                            <h3>Artigo 02</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                            <p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                        <div class="caption">
                                            <h3>Artigo 03</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                            <p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-md-3">
                                    <div class="thumbnail">
                                        <img src="https://visualhunt.com/photos/xl/1/silhouette-fitness-bless-you-bike-woman-sporty.jpg" alt="...">
                                        <div class="caption">
                                            <h3>Artigo 04</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacus lectus, sagittis ut ante a, commodo ultricies magna. Nullam eu dui non lectus feugiat molestie vitae nec libero.</p>
                                            <p><a href="#" class="btn btn-danger" role="button">Leia Mais</a> <a href="editar-noticias.html" class="btn btn-warning" role="button">Editar</a></p>                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
</asp:Content>
