<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true"
CodeBehind="cad_cidade.aspx.cs" Inherits="FrontEnd.cad_cidade" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
        <div class="">
            <div class="container">
                <h3>
                    Cadastro - Cidade
                </h3>
                <p>
                    Faça o cadastro de Mediadores
                </p>
                <div class="panel-body">
                    <fieldset>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Nome
                            </label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtNome" CssClass="form-control input-md" runat="server"
                                placeholder="Nome da Cidade">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">
                                Estado
                            </label>
                            <div class="col-md-6">
                                <asp:DropDownList CssClass="btn btn-default dropdown-toggle" ID="ddUF"
                                runat="server" ToolTip="Selecione o estado">
                                    <asp:ListItem>
                                        AC
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        AL
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        AP
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        AM
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        BA
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        CE
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        DF
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        ES
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        GO
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        MA
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        MT
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        MS
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        MG
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        PA
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        PB
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        PR
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        PE
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        PI
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        RJ
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        RN
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        RS
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        RO
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        RR
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        SC
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        SP
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        SE
                                    </asp:ListItem>
                                    <asp:ListItem>
                                        TO
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-offset-3">
                            <asp:Button runat="server" id="btnSalvar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                            OnClick="btnSalvar_Click" Text="Cadastrar" />
                            <asp:Button runat="server" id="btnListar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                            OnClick="btnListar_Click" Text="Listar" />
                            <asp:Button runat="server" id="btnLimpar" class="btn btn-success btn-rounded w-md waves-effect waves-light m-b-5"
                            OnClick="btnLimpar_Click" Text="Limpar" />
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </asp:Content>