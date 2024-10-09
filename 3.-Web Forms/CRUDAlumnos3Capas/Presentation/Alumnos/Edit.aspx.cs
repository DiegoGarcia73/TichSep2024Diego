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
    public partial class Edit : System.Web.UI.Page
    {
        NAlumno _NAlumno = new NAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] ?? "13"); //OPERADOR DE USO COMBINADO NULL (??) 
            Alumno oAlumno = _NAlumno.Consultar(id);
            oAlumno.nombre = "Roberto";
            _NAlumno.Actualizar(oAlumno);
        }
    }
}