<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="noticia_publicar.aspx.cs" Inherits="FrontEnd.noticia_publicar" %>
<%@ MasterType VirtualPath="~/med_admin.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="container">
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-12 portlets">
                            <h4 class="page-title">Clique ou arraste o arquivo</h4>
                            <!-- Your awesome content goes here -->
                            <div class="m-b-30">
                                <form action="#" class="dropzone" id="dropzone">
                                    <div class="fallback">
                                        <input name="file" type="file" multiple />
                                    </div>
                                </form>
                                <div class="clearfix pull-right m-t-15">
                                    <button type="button" class="btn btn-success btn-rounded">Enviar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="card-box">
                            <h4 class="m-b-30 m-t-0 header-title"><b>Editor de texto</b></h4>
                            <div class="summernote">
                                <h3>Hello World</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix pull-right m-t-15">
                    <button type="button" class="btn btn-success btn-rounded">Enviar</button>
                </div>
        </div>
</asp:Content>
