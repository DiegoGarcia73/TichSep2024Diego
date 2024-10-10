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
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] ?? "2");
            Alumno oAlumno = _NAlumno.Consultar(id);

            lblDefID.Text = oAlumno.id.ToString();
            lblDefNombre.Text = oAlumno.nombre;
            lblDefPrimerApellido.Text = oAlumno.primerApellido;
            lblDefsegundoApellido.Text = oAlumno.segundoApellido;
            lblDefCorreo.Text = oAlumno.correo;
            lblDefTelefono.Text = oAlumno.telefono;
            lblDefFechaNacimiento.Text = oAlumno.fechaNacimiento.ToString("yyyy-MM-dd");
            lblDefCurp.Text = oAlumno.curp;
            lblDefSueldo.Text = oAlumno.sueldo.ToString();
            lblDefIdEstadoOrigen.Text = oAlumno.idEstadoOrigen.ToString();
            lblDefIdEstatus.Text = oAlumno.idEstatus.ToString();


        }
    }
}