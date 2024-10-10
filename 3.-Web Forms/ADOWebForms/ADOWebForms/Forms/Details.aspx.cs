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
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //Para que solo se cargue el Data Griev View la primera vez
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                ADOEstatusAlumno oADOEstatus = new ADOEstatusAlumno();
                EstatusAlumno oEstatusAlumno = new EstatusAlumno();
                oEstatusAlumno = oADOEstatus.Consultar(id); //se almacena el valor que retorna el método Consultar, es decir el objeto tipo Estatus Alumno
                lblIDef.Text = oEstatusAlumno.id.ToString();
                lblNomDef.Text = oEstatusAlumno.nombre;
                lblClaveDef.Text = oEstatusAlumno.clave;
            }
           
        }
    }
}