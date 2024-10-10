<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="ADOWebForms.Forms.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Detalles</h1>
    <dl>
        <dt> 
            <asp:Label ID="lblId" runat="server" Text="ID"></asp:Label>
        </dt>
        <dd>
            <asp:Label ID="lblIDef" runat="server" Text=""></asp:Label>
        </dd>
        <dt>
         <asp:Label ID="lblNom" runat="server" Text="NOMBRE"></asp:Label>
        </dt>
        <dd>
         <asp:Label ID="lblNomDef" runat="server" Text=""></asp:Label>
        </dd>
        <dt>
          <asp:Label ID="lblClave" runat="server" Text="CLAVE"></asp:Label>
        </dt>
        <dd>
          <asp:Label ID="lblClaveDef" runat="server" Text=""></asp:Label>
        </dd>
    </dl>
</asp:Content>
