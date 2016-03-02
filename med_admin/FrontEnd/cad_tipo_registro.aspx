<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="cad_tipo_registro.aspx.cs" Inherits="FrontEnd.cad_tipo_registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">    
<%@ MasterType VirtualPath="~/med_admin.master"  %>
    <div class="container">
        <h3>Cadastro - Tipos de Registro</h3>
                                    
        <p>Faça o cadastro dos Tipos de Registros</p>
        <div class="panel-body">                    
            <fieldset>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">
                        ID
                    </label>
                    <div class="col-md-1">                            
                        <asp:Label runat="server" class="alert-info form-control" ID="txtID" ></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="">Descrição</label>
                    <div class="col-md-6">
                        <input name="descricao" class="form-control" id="txtDescricao" runat="server" placeholder="Descrição do tipo de registro"/>
                    </div>
                </div>
                                    
                            
                <div class="col-md-offset-3">
                    <asp:Button runat="server" id="btnSalvar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                    OnClick="btnSalvar_Click" Text="Salvar" />
                    <asp:Button runat="server" id="btnListar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                    OnClick="btnListar_Click" Text="Listar" />
                    <asp:Button runat="server" id="btnLimpar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                    OnClick="btnLimpar_Click" Text="Limpar" />
                </div>
            </fieldset>            
        </div>
    </div>


</asp:Content>
