using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using Entities;

namespace Presentation.Alumnos
{
    public partial class Create : System.Web.UI.Page
    {
        NAlumno _NAlumno = new NAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            //CODIGO DURO
            Alumno oAlumno = new Alumno();
            oAlumno.nombre = "Juan";
            oAlumno.primerApellido = "Rodriguez";
            oAlumno.segundoApellido = "Lara";
            oAlumno.correo = "juan@hotmail.com";
            oAlumno.telefono = "4549530043";
            oAlumno.fechaNacimiento = new DateTime(1995, 05, 02);
            oAlumno.curp = "ROLJ950502HMSRRG00";
            oAlumno.sueldo = 22000;
            oAlumno.idEstadoOrigen = 23;
            oAlumno.idEstatus = 4;

            _NAlumno.Agregar(oAlumno);
        }
    }
}