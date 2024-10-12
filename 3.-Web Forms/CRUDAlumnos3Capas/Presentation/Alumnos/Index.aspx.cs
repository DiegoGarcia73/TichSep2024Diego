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
        NEstado _NEstado = new NEstado();
        NEstatusAlumno _NEstatusAlumno = new NEstatusAlumno();

        public static List<Estado> _listaEstados = new List<Estado>(); //Para usar en Linq
        public static List<Alumno> _listaAlumnos = new List<Alumno>(); //Para usar en Linq
        public static List<EstatusAlumno> _listaEstatus = new List<EstatusAlumno>(); //Para Usar en Linq


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
            _listaAlumnos = _NAlumno.Consultar();
            _listaEstatus = _NEstatusAlumno.Consultar();
            _listaEstados = _NEstado.Consultar();

            //Uso de Linq
            var innerTablas = (from Alumno in _listaAlumnos
                               join Estado in _listaEstados
                               on Alumno.idEstadoOrigen equals Estado.id
                               join Estatus in _listaEstatus
                               on Alumno.idEstatus equals Estatus.id
                               select new
                               {
                                   Alumno.id,
                                   Alumno.nombre,
                                   Alumno.primerApellido,
                                   Alumno.segundoApellido,
                                   Alumno.fechaNacimiento,
                                   Alumno.correo,
                                   Alumno.telefono,
                                   Alumno.curp,
                                   Alumno.sueldo,
                                   nombreEstado = Estado.nombre,
                                   nombreEstatus = Estatus.nombre
                               }).ToList();


            gvAlumnos.DataSource = innerTablas; //Muestra el gridview
            gvAlumnos.DataBind();


        }

        protected void gvAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
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