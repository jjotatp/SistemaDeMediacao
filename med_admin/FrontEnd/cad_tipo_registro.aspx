﻿<%@ Page Title="" Language="C#" MasterPageFile="medAdmin.Master" AutoEventWireup="true" CodeBehind="cad_tipo_registro.aspx.cs" Inherits="MedAdmin.cad_tipo_registro" %>
<%@ MasterType VirtualPath="medAdmin.Master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">                
<div class="col-sm-10 col-sm-offset-1">
    <div class="panel panel-color panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                Cadastro de Tipos de Registro
            </h4>
        </div>
        <div class="panel-body">                    
            <fieldset>
                <!-- Text input-->
                <asp:Label runat="server" ID="txtID" hidden="hidden"></asp:Label>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="">Descrição</label>
                    <div class="col-md-6">
                        <input name="descricao" class="form-control" id="txtDescricao" runat="server" placeholder="Descrição do tipo de registro"/>
                    </div>
                </div>
                                    
                            
                <div class="col-md-offset-4">
                    <asp:Button runat="server" id="btnSalvar" class="btn btn-success"
                    OnClick="btnSalvar_Click" Text="Salvar" />
                    <asp:Button runat="server" id="btnListar" class="btn btn-info"
                    OnClick="btnListar_Click" Text="Listar" />
                    <asp:Button runat="server" id="btnLimpar" class="btn btn-warning"
                    OnClick="btnLimpar_Click" Text="Limpar" />
                </div>
            </fieldset>            
        </div>
    </div>
</div>
</asp:Content>
