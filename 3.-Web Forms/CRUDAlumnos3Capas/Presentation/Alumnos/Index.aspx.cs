using BusinessLogic;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Alumnos
{
    public partial class Index : System.Web.UI.Page
    {
        NAlumno _NAlumno = new NAlumno();

        protected void Page_Load(object sender, EventArgs e)
        {

                if (!IsPostBack)
                {
                  List <Alumno> listaAlumno = _NAlumno.Consultar();
                }
            
        }
    }
}