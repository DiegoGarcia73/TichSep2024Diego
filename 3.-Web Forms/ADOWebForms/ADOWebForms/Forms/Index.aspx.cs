using ADOWebForms.ADO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADOWebForms.Entidades;

namespace ADOWebForms.Forms
{
    public partial class Index : System.Web.UI.Page
    {
        ADOEstatusAlumno oADOEstatus = new ADOEstatusAlumno(); //Creación del objeto

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //tipo de dato        //nombre variable     //Invocación del método
                List<EstatusAlumno> listaEstatusAlumno = oADOEstatus.Consultar(); //Se almacena la lista que devuelve el método en esa variable de tipo lista EstatusAlumno

                ddlEstatus.DataSource = listaEstatusAlumno;
                ddlEstatus.DataTextField = "nombre"; //como se hayan definido en la clase Entidades
                ddlEstatus.DataValueField = "id";
                ddlEstatus.DataBind(); //Enlace de datos
            }         
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect($"Create.aspx");
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(ddlEstatus.SelectedValue);
            Response.Redirect($"Details.aspx?id={id}");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(ddlEstatus.SelectedValue);
            Response.Redirect($"Edit.aspx?id={id}");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(ddlEstatus.SelectedValue);
            Response.Redirect($"Delete.aspx?id={id}");
        }
    }
}