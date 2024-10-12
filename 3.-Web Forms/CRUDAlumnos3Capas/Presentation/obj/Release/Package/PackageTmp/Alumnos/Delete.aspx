<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="Presentation.Alumnos.Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Datos del Alumno</h2>

        <dl class="row">
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblID" runat="server" Text="ID"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefID" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefNombre" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblprimerApellido" runat="server" Text="PrimerApellido"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefPrimerApellido" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblsegundoApellido" runat="server" Text="SegundoApellido"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefsegundoApellido" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefCorreo" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblTelefono" runat="server" Text="Telefono"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefTelefono" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefFechaNacimiento" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblCurp" runat="server" Text="Curp"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefCurp" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblSueldo" runat="server" Text="Sueldo"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefSueldo" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblIdEstadoOrigen" runat="server" Text="Estado de Origen"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefIdEstadoOrigen" runat="server" Text=""></asp:Label>
            </dd>
            <dt class="col-sm-2 text-end">
                <asp:Label ID="lblIdEstatus" runat="server" Text="Estatus"></asp:Label>
            </dt>
            <dd class="col-sm-10">
                <asp:Label ID="lblDefIdEstatus" runat="server" Text=""></asp:Label>
            </dd>
        </dl>
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
    </div>
    <div class="form-group">
        <div class="col-md-7">
            <a href="Index.aspx">Regresar a la lista</a>
        </div>
    </div>

</asp:Content>
