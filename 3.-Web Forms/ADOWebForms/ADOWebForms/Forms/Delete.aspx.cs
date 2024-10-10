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
    public partial class Delete : System.Web.UI.Page
    {
        ADOEstatusAlumno _oADOEstatus = new ADOEstatusAlumno(); //Usar como prefijo el guión bajo para variables global
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) //Para que solo se cargue el Data Griev View la primera vez
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
               
                EstatusAlumno oEstatusAlumno = new EstatusAlumno();
                oEstatusAlumno = _oADOEstatus.Consultar(id); //se almacena el valor que retorna el método Consultar, es decir el objeto tipo Estatus Alumno
                lblIDef.Text = oEstatusAlumno.id.ToString();
                lblNomDef.Text = oEstatusAlumno.nombre;
                lblClaveDef.Text = oEstatusAlumno.clave;
            }
        }

        protected void btnEliminar1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(lblIDef.Text);
            _oADOEstatus.Eliminar(id);
            Response.Redirect($"Index.aspx");
        }
    }
}