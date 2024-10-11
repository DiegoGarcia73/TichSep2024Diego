using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Entities;
using BusinessLogic;

namespace WebServiceASMX
{
    /// <summary>
    /// Descripción breve de WSAlumnos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WSAlumnos : System.Web.Services.WebService
    {

        [WebMethod]
        public ItemTablaISR CalcularISR(int id)
        {
            NAlumno oNAlumnoISR = new NAlumno();
            ItemTablaISR oISR = oNAlumnoISR.CalcularISR(id);
            return oISR;
        }
        [WebMethod]
        public AportacionesIMSS CalcularIMSS(int id)
        {
            //Invocación del método para calcular las Aportaciones IMSS a través de la
            //creación de un objeto tipo Aportaciones IMSS llamado oIMSS
            NAlumno NAlumnoIMSS = new NAlumno();
            AportacionesIMSS oIMSS = NAlumnoIMSS.CalcularIMSS(id);
            return oIMSS;
        }
    }
}
