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
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e) //Creación del evento
        {
            ADOEstatusAlumno oADOEstatus = new ADOEstatusAlumno();
            EstatusAlumno oEstatusAlumno = new EstatusAlumno();
            oEstatusAlumno.id = Convert.ToInt16(txtID.Text);
            oEstatusAlumno.nombre = txtNom.Text;
            oEstatusAlumno.clave = txtClave.Text; //Objeto oEstatusAlumno en su propiedad clave recibe lo que contenga el control textBox
            oADOEstatus.Agregar(oEstatusAlumno);
            Response.Redirect($"Index.aspx"); //Envía
        }
    }
}