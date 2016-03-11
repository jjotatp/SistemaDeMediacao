<%@ Page Title="" Language="C#" MasterPageFile="~/med_admin.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="p" runat="server">
    <div style="height:509px; width: 100%;">
        <%= this.Scheduler.Render()%>
    </div>
</asp:Content>
