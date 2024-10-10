<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ADOWebForms.Forms.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Actualizar</h1>
    <dl>
        <dt>
            <asp:Label ID="lblId" runat="server" Text="ID"></asp:Label>
        </dt>
        <dd>
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        </dd>
        <dt>
            <asp:Label ID="lblNom" runat="server" Text="NOMBRE"></asp:Label>
        </dt>
        <dd>
            <asp:TextBox ID="txtNom" runat="server"></asp:TextBox>
        </dd>
        <dt>
            <asp:Label ID="lblClave" runat="server" Text="CLAVE"></asp:Label>
        </dt>
        <dd>
            <asp:TextBox ID="txtClave" runat="server"></asp:TextBox>
        </dd>
    </dl>
    <asp:Button ID="btnGuardar1" runat="server" Text="Guardar" OnClick="btnGuardar1_Click" />
</asp:Content>
