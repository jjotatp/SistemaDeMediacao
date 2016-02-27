<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="cad_tipo_registro.aspx.cs" Inherits="FrontEnd.cad_tipo_registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">

    <div class="wrapper">
            <div class="container">
                <h3>Cadastro - Tipos de Registro</h3>
                                    
                <p>Faça o cadastro dos Tipos de Registros</p>
                <div class="panel-body">
                            <form class="form-horizontal">
                                <fieldset>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="">Descrição</label>
                                        <div class="col-md-6">
                                            <textarea name="descricao" class="form-control" id="descricao">Descrição do tipo de registro...</textarea>
                                        </div>
                                    </div>
                                    
                            
                                    <div class="col-md-offset-3">
                                    <button class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5" type="button">Cadastrar</button>
                                    <button class="btn btn-warning btn-rounded w-md waves-effect waves-light m-b-5" type="button">Listar</button>
                                    </div>
                                </fieldset>
                    </form>
                </div   >
            </div>
        </div>

</asp:Content>
