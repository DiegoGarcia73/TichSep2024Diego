<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Presentation.Alumnos.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content">
        <h2>Actualizar Alumno</h2>
        <hr />

        <div class="mb-3 row form-group">
            <asp:Label ID="lblID" class="control-label col-md-3 fw-bold text-end" runat="server" Text="ID"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtID" runat="server" Enabled="false"></asp:TextBox>
            </div>
        </div>

        <div class="mb-3 row form-group">
            <asp:Label ID="lblNombre" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Nombre"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <div>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="El campo nombre es obligatorio" CssClass="text-danger" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:RegularExpressionValidator ID="revNombre" runat="server" ErrorMessage="El campo nombre solo debe contener letras y espacios" CssClass="text-danger" ControlToValidate="txtNombre" ValidationExpression="^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>

        <div class="mb-3 row form-group">
            <asp:Label ID="lblPrimerApellido" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Primer Apellido"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtPrimerApellido" runat="server"></asp:TextBox>
                <div>
                    <asp:RequiredFieldValidator ID="rfvPrimerApellido" runat="server" ErrorMessage="El campo primer apellido es obligatorio" CssClass="text-danger" ControlToValidate="txtPrimerApellido"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:RegularExpressionValidator ID="revPrimerApellido" runat="server" ErrorMessage="El campo primer apellido solo debe contener letras y espacios" CssClass="text-danger" ControlToValidate="txtPrimerApellido" ValidationExpression="^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$"></asp:RegularExpressionValidator>
                </div>
            </div>

        </div>

        <div class="mb-3 row form-group">
            <asp:Label ID="lblSegundoApellido" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Segundo Apellido"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtSegundoApellido" runat="server"></asp:TextBox>
                <div>
                    <asp:RegularExpressionValidator ID="revSegundoApellido" runat="server" ErrorMessage="El campo segundo apellido solo debe contener letras y espacios" CssClass="text-danger" ControlToValidate="txtSegundoApellido" ValidationExpression="^[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]+$"></asp:RegularExpressionValidator>
                </div>
            </div>

        </div>

        <div class="mb-3 row form-group">
            <asp:Label ID="lblCorreo" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Correo"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
                <div>
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="El campo correo es obligatorio" CssClass="text-danger" ControlToValidate="txtCorreo"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <div class="mb-3 row form-group">
            <asp:Label ID="lblTelefono" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Telefono"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
            </div>

        </div>
        <div class="mb-3 row form-group">
            <asp:Label ID="lblFechaNacimiento" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Fecha de Nacimiento"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                <div>
                    <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ErrorMessage="El campo fecha de nacimiento es obligatorio" CssClass="text-danger" ControlToValidate="txtFechaNacimiento"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:RangeValidator ID="rvFechaNacimiento" runat="server" ErrorMessage="La fecha de nacimiento debe estar entre el 01-enero-1990 y el 31-diciembre-2000" CssClass="text-danger" ControlToValidate="txtFechaNacimiento" Type="Date" MaximumValue="2000/12/31" MinimumValue="1990/01/01"></asp:RangeValidator>
                </div>
            </div>

        </div>
        <div class="mb-3 row form-group">
            <asp:Label ID="lblCurp" class="control-label col-md-3 fw-bold text-end" runat="server" Text="CURP"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtCurp" runat="server"></asp:TextBox>
                <div>
                    <asp:RequiredFieldValidator ID="rfvCURP" runat="server" ErrorMessage="El campo CURP es obligatorio" CssClass="text-danger" ControlToValidate="txtCurp"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:RegularExpressionValidator ID="revCURP" runat="server" ErrorMessage="El CURP no tiene formato válido" CssClass="text-danger" ControlToValidate="txtCurp" ValidationExpression="^[A-Z]{4}\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])[HM](AS|BS|CL|CS|DF|GT|HG|MC|MS|NL|PL|QR|SL|TC|TL|YN|NE|BC|CC|CM|CH|DG|GR|JC|MN|NT|OC|QT|SP|SR|TS|VZ|ZS)[B-DF-HJ-NP-TV-Z]{3}\d{2}$"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <asp:CustomValidator ID="cvCURPFechavsNac" runat="server" ErrorMessage="La fecha de nacimiento no coincide con la CURP" CssClass="text-danger" ControlToValidate="txtCurp" OnServerValidate="cvCURPFechavsNac_ServerValidate"></asp:CustomValidator>
                </div>
            </div>


        </div>
        <div class="mb-3 row form-group">
            <asp:Label ID="lblSueldo" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Sueldo"></asp:Label>
            <div class="col-md-7">
                <asp:TextBox ID="txtSueldo" runat="server"></asp:TextBox>
                <div>
                    <asp:RangeValidator ID="rvSueldo" runat="server" ErrorMessage="El sueldo debe estar entre 10000 y 40000" CssClass="text-danger" ControlToValidate="txtSueldo" Type="Currency" MaximumValue="40000" MinimumValue="10000"></asp:RangeValidator>
                </div>
            </div>

        </div>
        <div class="mb-3 row form-group">
            <asp:Label ID="lblIdEstadoOrigen" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Id Estado de Origen"></asp:Label>
            <div class="col-md-7">
                <asp:DropDownList ID="ddlEstados" runat="server"></asp:DropDownList>
            </div>

        </div>
        <div class="mb-3 row form-group">
            <asp:Label ID="lblEstatus" class="control-label col-md-3 fw-bold text-end" runat="server" Text="Id Estatus"></asp:Label>
            <div class="col-md-7">
                <asp:DropDownList ID="ddlEstatus" runat="server"></asp:DropDownList>
            </div>

        </div>

        <div class="form-group">
            <div class="col-md-2">
                <asp:Button ID="btnGuardar" class="btn btn-secondary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />

            </div>
        </div>
        <div class="form-group">
            <div class="col-md-7">
                <a href="Index.aspx">Regresar a la Lista</a>
            </div>
        </div>
    </div>

</asp:Content>
