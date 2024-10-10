using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolaMundoWebForms.Estados
{
    public partial class Index : System.Web.UI.Page
    {
        List<Estado> _listaEstados = new List<Estado>() //Lista global
        { 
            //Agregar elementos a nuestra lista
          new Estado{id = 1, nombre = "Aguascalientes"},
          new Estado{id = 2, nombre = "BajaCalifornia"},
          new Estado{id = 3, nombre = "Baja California Sur"}
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlEstados.DataSource = _listaEstados; //Añade elementos
                ddlEstados.DataTextField = "nombre"; //Muestra el nombre al usuario
                ddlEstados.DataValueField = "id"; //Valor interno con el que se va a trabajars
                ddlEstados.DataBind(); //Enlace de datos
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(ddlEstados.SelectedValue); //Obtiene el elemento seleccionado que tiene DataValueField, en este caso el id
            Response.Redirect($"Details.aspx?id={id}");
        }
    }
}