using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolaMundoWebForms.Estados
{
    public partial class Details : System.Web.UI.Page
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
           int id = Convert.ToInt16(Request.QueryString["id"]); //Recibe los parámetros enviadas por el URL
            _listaEstados.Find(x => x.id == id); //Retorna el elemento coincidente con las condiciones
            Estado oEstado1 = new Estado(); //creación de un nuevo objeto
            oEstado1 = _listaEstados.Find(x=>x.id == id); //del objeto que se obtuvo se va a asignar en lo que está en la línea 26 y 27
           // Estado oEstado = _listaEstados.Find(x =>x.id == id); //Crear variable de objeto y directamente asignar
            lbliDef.Text = oEstado1.id.ToString();
            lblNombreDef.Text = oEstado1.nombre;

        }
    }
}