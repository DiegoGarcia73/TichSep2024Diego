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
        NEstado _NEstado = new NEstado();
        NEstatusAlumno _NEstatusAlumno = new NEstatusAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Estado> listaEstados = new List<Estado>();
                listaEstados = _NEstado.Consultar();
                ddlEstados.DataSource = listaEstados;
                ddlEstados.DataTextField = "nombre";
                ddlEstados.DataValueField = "id";
                ddlEstados.DataBind();

                List<EstatusAlumno> listaEstatus = new List<EstatusAlumno>();
                listaEstatus = _NEstatusAlumno.Consultar();

                ddlEstatus.DataSource = listaEstatus;
                ddlEstatus.DataTextField = "nombre";
                ddlEstatus.DataValueField = "id";
                ddlEstatus.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Alumno oAlumno = new Alumno();
            //CODIGO DURO

            oAlumno.nombre = txtNombre.Text;
            oAlumno.primerApellido = txtPrimerApellido.Text;
            oAlumno.segundoApellido = txtSegundoApellido.Text;
            oAlumno.correo = txtCorreo.Text;
            oAlumno.telefono = txtTelefono.Text;
            oAlumno.fechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
            oAlumno.curp = txtCurp.Text;
            oAlumno.sueldo = Convert.ToDecimal(txtSueldo.Text);
            oAlumno.idEstadoOrigen = Convert.ToInt32(ddlEstados.Text);
            oAlumno.idEstatus = Convert.ToInt32(ddlEstatus.Text);

            //List<Estado> listaEstados = new List<Estado>();
            //listaEstados = _NEstado.Consultar();
            //ddlEstados.DataSource = listaEstados;
            //ddlEstados.DataTextField = "nombre";
            //ddlEstados.DataValueField = "id";
            //ddlEstados.DataBind();

            //List<EstatusAlumno> listaEstatus = new List<EstatusAlumno>();
            //listaEstatus = _NEstatusAlumno.Consultar();

            //ddlEstatus.DataSource = listaEstatus;
            //ddlEstatus.DataTextField = "nombre";
            //ddlEstatus.DataValueField = "id";
            //ddlEstatus.DataBind();


            _NAlumno.Agregar(oAlumno);
            Response.Redirect($"Index.aspx");

        }
    }
}