using ADOWebForms.ADO;
using ADOWebForms.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADOWebForms.Forms
{
    public partial class Edit : System.Web.UI.Page
    {
        ADOEstatusAlumno _oADOEstatus = new ADOEstatusAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //Para que solo se cargue el Data Griev View la primera vez
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                EstatusAlumno oEstatusAlumno = new EstatusAlumno();
                oEstatusAlumno = _oADOEstatus.Consultar(id); //se almacena el valor que retorna el método Consultar, es decir el objeto tipo Estatus Alumno
                txtID.Text = oEstatusAlumno.id.ToString();
                txtNom.Text = oEstatusAlumno.nombre;
                txtClave.Text = oEstatusAlumno.clave;
            }
        }

        protected void btnGuardar1_Click(object sender, EventArgs e)
        {
           
            EstatusAlumno oEstatusAlumno = new EstatusAlumno();
            oEstatusAlumno.id = Convert.ToInt16(txtID.Text);
            oEstatusAlumno.nombre = txtNom.Text;
            oEstatusAlumno.clave = txtClave.Text;
            _oADOEstatus.Actualizar(oEstatusAlumno);
            Response.Redirect($"Index.aspx");
        }
    }
}