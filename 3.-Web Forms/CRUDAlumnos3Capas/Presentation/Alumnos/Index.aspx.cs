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
                CargarGridView();
                }
            
        }

        protected void gvAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAlumnos.PageIndex = e.NewPageIndex; //NewPageIndex muestra el nuevo indice que se mostrrará
            CargarGridView();
        }
        private void CargarGridView() //Invocar al método 
        {
            List<Alumno> listaAlumno = _NAlumno.Consultar();
            gvAlumnos.DataSource = listaAlumno; //Muestra el gridview
            gvAlumnos.DataBind();
        }

        protected void gvAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName != "Page")
            {

            //Command Argument trae el número de renglón del GridView
            int numRenglon = Convert.ToInt16(e.CommandArgument);

            //Almacenar el renglón que se extrae
            GridViewRow renglon = gvAlumnos.Rows[numRenglon];

            //Table Cell se extrae la celda en la posición 0
            TableCell celda = renglon.Cells[0];

            //Extrae el valor de la celda en la posición 0, en este caso id
            int id = Convert.ToInt16(celda.Text);

            switch (e.CommandName)
            {
                case "btnDetalles":
                    Response.Redirect($"Details.aspx?id={id}");
                    break;

                case "btnEditar":
                    Response.Redirect($"Edit.aspx?id={id}");
                    break;

                case "btnEliminar":
                    Response.Redirect($"Delete.aspx?id={id}");
                    break;

            }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            
             Response.Redirect($"Create.aspx");
           
        }
    }
}