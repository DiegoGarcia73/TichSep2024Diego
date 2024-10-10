<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ADOWebForms.Forms.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Indice</h1>
    <asp:DropDownList ID="ddlEstatus" runat="server"></asp:DropDownList>

    <br />
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
    <asp:Button ID="btnDetalles" runat="server" Text="Detalles" OnClick="btnDetalles_Click" />
    <asp:Button ID="btnEditar" runat="server" Text="Edita" OnClick="btnEditar_Click" />
    <asp:Button ID="btnEliminar" runat="server" Text="Elimina" OnClick="btnEliminar_Click" />

</asp:Content>

