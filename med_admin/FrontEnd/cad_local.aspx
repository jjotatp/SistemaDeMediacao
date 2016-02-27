<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="cad_local.aspx.cs" Inherits="FrontEnd.cad_local" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div class="wrapper">
            <div class="container">
                <h3>Cadastro - Local</h3>
                <p>Faça o cadastro dos Locais de Mediação</p>
                <div class="panel-body">                            
                            <fieldset>
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="nome">Nome</label>
                                    <div class="col-md-6">
                                        <input name="nome" class="form-control input-md" id="nome" type="text" placeholder="Nome">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="">Descrição</label>
                                    <div class="col-md-6">
                                        <textarea name="descricao" class="form-control" id="descricao">Descrição do local...</textarea>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="sel1">Cidade</label>
                                    <div class="col-md-6">
                                    <select class="form-control" id="sel1">
                                    <option>Cidade 1</option>
                                    <option>Cidade 2</option>
                                    <option>Cidade 3</option>
                                    </select>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="nome">Bairro</label>
                                    <div class="col-md-6">
                                        <input name="nome" class="form-control input-md" id="bairro" type="text" placeholder="Bairro">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="nome">Logradouro</label>
                                    <div class="col-md-6">
                                        <input name="nome" class="form-control input-md" id="logradouro" type="text" placeholder="Logradouro">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="nome">Numero</label>
                                    <div class="col-md-6">
                                        <input name="nome" class="form-control input-md" id="numero" type="number" placeholder="Numero">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="nome">CEP</label>
                                    <div class="col-md-6">                                        
                                        <asp:TextBox ID="txtCEP" CssClass="form-control input-md" runat="server" placeholder="CEP"></asp:TextBox>
                                    </div>
                                </div>
                            
                                <div class="col-md-offset-3">
                                    <asp:Button runat="server" id="btnSalvar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5" OnClick="" Text="Cadastrar" />
                                    <asp:Button runat="server" id="btnListar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5" OnClick="" Text="Listar" />                                
                                    <asp:Button runat="server" id="btnLimpar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5" OnClick="" Text="Limpar" />                                
                                </div>
                            </fieldset>                    
                </div>
            </div>
        </div>
</asp:Content>
