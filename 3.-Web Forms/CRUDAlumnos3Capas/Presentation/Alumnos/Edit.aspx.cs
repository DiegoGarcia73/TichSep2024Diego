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
        NEstado _NEstado = new NEstado();
        NEstatusAlumno _NEstatusAlumno = new NEstatusAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["id"] ?? "2"); //OPERADOR DE USO COMBINADO NULL (??) 
                Alumno oAlumno = _NAlumno.Consultar(id);
                txtID.Text = oAlumno.id.ToString();
                txtNombre.Text = oAlumno.nombre;
                txtPrimerApellido.Text = oAlumno.primerApellido;
                txtSegundoApellido.Text = oAlumno.segundoApellido;
                txtCorreo.Text = oAlumno.correo;
                txtTelefono.Text = oAlumno.telefono;
                txtFechaNacimiento.Text = oAlumno.fechaNacimiento.ToString("yyyy-MM-dd");
                txtCurp.Text = oAlumno.curp;
                txtSueldo.Text = oAlumno.sueldo.ToString();
                //txtIdOrigenEstado.Text = oAlumno.idEstadoOrigen.ToString();
                //txtIdEstatus.Text = oAlumno.idEstatus.ToString();
                List <Estado> listaEstados = new List<Estado>();
                listaEstados = _NEstado.Consultar();
                ddlEstados.DataSource = listaEstados;
                ddlEstados.DataTextField = "nombre";
                ddlEstados.DataValueField = "id";
                ddlEstados.SelectedValue = Convert.ToString(oAlumno.idEstadoOrigen);
                ddlEstados.DataBind();

                List<EstatusAlumno> listaEstatus = new List<EstatusAlumno>();
                listaEstatus = _NEstatusAlumno.Consultar();

                ddlEstatus.DataSource = listaEstatus;
                ddlEstatus.DataTextField = "nombre";
                ddlEstatus.DataValueField = "id";
                ddlEstatus.SelectedValue = Convert.ToString(oAlumno.idEstatus);
                ddlEstatus.DataBind();
            }
            


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Alumno oAlumno = new Alumno();
                oAlumno.id = Convert.ToInt32(txtID.Text);
                oAlumno.nombre = txtNombre.Text;
                oAlumno.primerApellido = txtPrimerApellido.Text;
                oAlumno.segundoApellido = txtSegundoApellido.Text;
                oAlumno.correo = txtCorreo.Text;
                oAlumno.telefono = txtTelefono.Text;
                oAlumno.fechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
                oAlumno.curp = txtCurp.Text;
                oAlumno.sueldo = Convert.ToDecimal(txtSueldo.Text);
                oAlumno.idEstadoOrigen = Convert.ToInt32(ddlEstados.SelectedValue);
                oAlumno.idEstatus = Convert.ToInt32(ddlEstatus.SelectedValue);

                _NAlumno.Actualizar(oAlumno);
                Response.Redirect($"Index.aspx");
            }
       
        }

        protected void cvCURPFechavsNac_ServerValidate(object source, ServerValidateEventArgs args)
        {

            var fechaNac = txtFechaNacimiento.Text.ToString();
            var fechaCURP = args.Value.Substring(4, 6);
            var FechaNacFormatCURP = fechaNac.Substring(2, 2) + fechaNac.Substring(5, 2) + fechaNac.Substring(8, 2);
            args.IsValid = fechaCURP == FechaNacFormatCURP;
        }
    }
}