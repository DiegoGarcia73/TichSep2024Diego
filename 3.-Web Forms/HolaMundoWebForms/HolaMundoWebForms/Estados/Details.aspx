<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="HolaMundoWebForms.Estados.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <dl>
        <dt>
            <asp:Label ID="lbid" runat="server" Text="ID"></asp:Label>
        </dt>
        <dd>
            <asp:Label ID="lbliDef" runat="server" Text=""></asp:Label>
        </dd>
        <dt>
            Nombre
        </dt>
        <dd>
             <asp:Label ID="lblNombreDef" runat="server" Text=""></asp:Label>
        </dd>
    </dl>
</asp:Content>
