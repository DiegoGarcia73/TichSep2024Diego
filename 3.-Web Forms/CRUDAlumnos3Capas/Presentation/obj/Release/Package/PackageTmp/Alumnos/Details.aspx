<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Presentation.Alumnos.Details" %>

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
    </div>
    <div class="form-group">
        <div class="col-md-2">
            <input id="btnCalcularIMSS" class="btn btn-primary" type="button" value="Calcular IMSS" onclick="CalcularIMSS()" />
<%--            <asp:Button ID="btnCalcularIMSS" class="btn btn-primary" runat="server" Text="CalcularIMSS" OnClick="btnCalcularIMSS_Click" />--%>
            <asp:Button ID="btnCalcularISR" class="btn btn-secondary" runat="server" Text="CalcularISR" OnClick="btnCalcularISR_Click" />
            <br />
        </div>
        <div class="col text-end">
            <asp:Label ID="lblIMSSeISR" runat="server" Text=""></asp:Label>
        </div>

    </div>
    <div class="form-group">
        <div class="col-md-7">
            <a href="Index.aspx">Regresar a la lista</a>
        </div>
    </div>

    <div class="modal" id="modalIMSS" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cálculo del IMSS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <dl>
                        <dt>Enfermedad y Maternidad</dt>
                        <dd>
                            <asp:Label ID="lblEnfermedadyMaternidad" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>Invalidez y Vida</dt>
                        <dd>
                            <asp:Label ID="lblInvalidezyVida" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>Retiro</dt>
                        <dd>
                            <asp:Label ID="lblRetiro" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>Cesantía</dt>
                        <dd>
                            <asp:Label ID="lblCesantia" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>Infonavit</dt>
                        <dd>
                            <asp:Label ID="lblInfonavit" runat="server" Text=""></asp:Label>
                        </dd>
                    </dl>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="modalISR" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cálculo del ISR</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <dl>
                        <dt>LimiteInferior </dt>
                        <dd>
                            <asp:Label ID="lblLimInferior" runat="server" Text="Label"></asp:Label>
                        <dt>Limite Superior</dt>
                        <dd>
                            <asp:Label ID="lblLimSuperior" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>CuotaFija</dt>
                        <dd>
                            <asp:Label ID="lblCuotaFija" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>Excedente</dt>
                        <dd>
                            <asp:Label ID="lblExcedente" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>Subsidio</dt>
                        <dd>
                            <asp:Label ID="lblSubsidio" runat="server" Text=""></asp:Label>
                        </dd>
                        <dt>ISR </dt>
                        <dd>
                            <asp:Label ID="lblISR" runat="server" Text=""></asp:Label>
                        </dd>
                    </dl>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function CalcularIMSS() {
            let id = $("#<%=lblDefID.ClientID%>").text();
            var urlws = 'http://localhost:50047/WSAlumnos.asmx/CalcularIMSS';
            var alumno = { id: id };
            var parametros = JSON.stringify(alumno);
            $.ajax({
                type: 'POST',
                url: urlws,
                data: parametros,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: respuestaExitosa,
                error: respuestaErronea
            });
        }

        function respuestaExitosa(resultado, estatus, jqXHR) { /*jqXHR son las propiedades de la respuesta obtenida del servidor*/

            try {
               IMSS = resultado.d;
                if (IMSS != null)
                {
        
                    $("#<%=lblEnfermedadyMaternidad.ClientID%>").text(IMSS.EnfermedadMaternidad);
                    $("#<%=lblInvalidezyVida.ClientID%>").text(IMSS.InvalidezVida);
                    $("#<%=lblRetiro.ClientID%>").text(IMSS.Retiro);
                    $("#<%=lblCesantia.ClientID%>").text(IMSS.Cesantia);
                    $("#<%=lblInfonavit.ClientID%>").text(IMSS.Infonavit);

                    $("#modalIMSS").modal('show'); /*Esta línea de código muestra el modal*/

                }
                else {
                    alert('La respuesta que se recibió no es correcta' + resultado.d);
                }
            }
            catch (exception) {
                alert('No se recibieron los datos');
            }
        }





        function respuestaErronea(jqXHR, estatus, error) {
            var mensaje = '';
            if (jqXHR.status === 0) {
                mensaje = 'No hay conexión con el servidor';
            } else if (jqXHR.status === 404) {
                mensaje = 'No se encontró la página solicitada';
            }
            else {
                mensaje = 'Error desconocido. Contacte al administrador del sitio web';
                console.log(exception);
            }
            alert(mensaje);
        }


    </script>

</asp:Content>
