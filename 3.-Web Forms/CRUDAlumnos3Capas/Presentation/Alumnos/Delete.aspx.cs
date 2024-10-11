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
        NEstado _NEstado = new NEstado(); //Se instancia la clase NAlumno para poder acceder a los métodos y propiedades de la misma
        NEstatusAlumno _NEstatus = new NEstatusAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] ?? "9"); //Recibe el id como parámetro a través del UR          
            Alumno oAlumno = _NAlumno.Consultar(id);
            List <Estado> oListaEstado = _NEstado.Consultar(); //Se crea una variable de objeto de tipo List Estado llamada oListaEstado
            //Para almacenar el retorno del método consultar
            List <EstatusAlumno> oListaEstatus = _NEstatus.Consultar();

            lblDefID.Text = id.ToString();
            lblDefNombre.Text = oAlumno.nombre;
            lblDefPrimerApellido.Text = oAlumno.primerApellido;
            lblDefsegundoApellido.Text = oAlumno.segundoApellido;
            lblDefCorreo.Text = oAlumno.correo;
            lblDefTelefono.Text = oAlumno.telefono;
            lblDefFechaNacimiento.Text = oAlumno.fechaNacimiento.ToString("yyyy-MM-dd");
            lblDefCurp.Text = oAlumno.curp;
            lblDefSueldo.Text = oAlumno.sueldo.ToString();
            Estado oEstado = oListaEstado.Find(x => x.id == oAlumno.idEstadoOrigen);
            lblDefIdEstadoOrigen.Text = oEstado.nombre;
            EstatusAlumno oEstatus = oListaEstatus.Find(x => x.id == oAlumno.idEstatus);
            lblDefIdEstatus.Text = oEstatus.nombre;

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(lblDefID.Text);
            _NAlumno.Eliminar(id);
            Response.Redirect($"Index.aspx");
        }
    }
}