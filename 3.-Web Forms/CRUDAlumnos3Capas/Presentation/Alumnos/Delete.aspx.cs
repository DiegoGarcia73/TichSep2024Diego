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
    public partial class Delete : System.Web.UI.Page
    {
        NAlumno _NAlumno = new NAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] ?? "9"); //Recibe el id como parámetro a través del UR          
            Alumno oAlumno = _NAlumno.Consultar(id);
            lblDefID.Text = id.ToString();
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

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(lblDefID.Text);
            _NAlumno.Eliminar(id);
            Response.Redirect($"Index.aspx");
        }
    }
}