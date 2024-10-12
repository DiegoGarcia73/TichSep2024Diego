using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;


namespace Presentation.Alumnos
{
    public partial class Details : System.Web.UI.Page
    {
        NAlumno _NAlumno = new NAlumno();
        NEstatusAlumno _NEstatusAlumno = new NEstatusAlumno();
        NEstado _NEstado = new NEstado();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] ?? "2");
            Entities.Alumno oAlumno = _NAlumno.Consultar(id);
            List<Estado> oListaEstado = _NEstado.Consultar();
            List<EstatusAlumno> oListaEstatus = _NEstatusAlumno.Consultar();

            lblDefID.Text = oAlumno.id.ToString();
            lblDefNombre.Text = oAlumno.nombre;
            lblDefPrimerApellido.Text = oAlumno.primerApellido;
            lblDefsegundoApellido.Text = oAlumno.segundoApellido;
            lblDefCorreo.Text = oAlumno.correo;
            lblDefTelefono.Text = oAlumno.telefono;
            lblDefFechaNacimiento.Text = oAlumno.fechaNacimiento.ToString("yyyy-MM-dd");
            lblDefCurp.Text = oAlumno.curp;
            lblDefSueldo.Text = oAlumno.sueldo.ToString();
            Estado oEstado = oListaEstado.Find(x => x.id == oAlumno.idEstadoOrigen); //Creación de objeto de tipo Estado nombre del objeto oEstado
            lblDefIdEstadoOrigen.Text = oEstado.nombre;
            lblDefIdEstatus.Text = oListaEstatus.Find(x=> x.id == oAlumno.idEstatus).nombre;



        }

        protected void btnCalcularIMSS_Click(object sender, EventArgs e)
        {
            AportacionesIMSS aportacionesIMSS = new AportacionesIMSS();
            aportacionesIMSS = _NAlumno.CalcularIMSS(Convert.ToInt16(lblDefID.Text));

            lblEnfermedadyMaternidad.Text = aportacionesIMSS.EnfermedadMaternidad.ToString();
            lblInvalidezyVida.Text = aportacionesIMSS.InvalidezVida.ToString();
            lblRetiro.Text = aportacionesIMSS.Retiro.ToString();
            lblCesantia.Text = aportacionesIMSS.Cesantia.ToString();
            lblInfonavit.Text = aportacionesIMSS.Infonavit.ToString();

            string script1 = @"<script type='text/javascript'> 
                              $(function(){
                                $('#modalIMSS').modal('show')
                                                });
                                            </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "VentanaModalIMSS", script1, false);

            //lblIMSSeISR.Text = $"Enfermedades y Maternidad: {aportacionesIMSS.EnfermedadMaternidad:C2} Invalidez y Vida: {aportacionesIMSS.InvalidezVida:C2} Retiro: {aportacionesIMSS.Retiro:C2}" +
            //    $" Cesantia: {aportacionesIMSS.Cesantia:C2} Credito Infonavit {aportacionesIMSS.Infonavit:C2}";

        }

        protected void btnCalcularISR_Click(object sender, EventArgs e)
        {
            ItemTablaISR itemTablaISR = new ItemTablaISR();
            itemTablaISR = _NAlumno.CalcularISR(Convert.ToInt16(lblDefID.Text));

            lblLimInferior.Text = itemTablaISR.LimiteInferior.ToString();
            lblLimSuperior.Text = itemTablaISR.LimiteSuperior.ToString();
            lblCuotaFija.Text = itemTablaISR.CuotaFija.ToString();
            lblExcedente.Text = itemTablaISR.Excedente.ToString();
            lblSubsidio.Text = itemTablaISR.Subsidio.ToString();   
            lblISR.Text = itemTablaISR.ISR.ToString();

            string script = @"<script type='text/javascript'> 
                              $(function(){
                                $('#modalISR').modal('show')
                                                });
                                            </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "MuestraVentanaModal", script, false);

            //lblIMSSeISR.Text = $"Limite Inferior: {itemTablaISR.LimiteInferior:C2} Limite Superior: {itemTablaISR.LimiteSuperior:C2} Cuota Fija: {itemTablaISR.CuotaFija:C2} Excedentes Limite Superior: {itemTablaISR.Excedente:C2}" +
            //    $" Subsidio: {itemTablaISR.Subsidio:C2} Impuesto: {itemTablaISR.ISR:C2} ";
        }
    }
}