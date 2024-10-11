using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Entities;
using BusinessLogic;

namespace HolaMundoWSASMX
{
    /// <summary>
    /// Descripción breve de WSAlumnos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")] //Decoradores //Adicionar elementos
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)] //
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WSAlumnos : System.Web.Services.WebService
    {

        [WebMethod] //Decorador. Permite exponer los métodos, si no la tiene no serán expuestos los métodos. Depende de los métodos que se agreguen se añade esta clase decorador
        public ItemTablaISR CalcularISR(int id)
        {
           NAlumno oNAlumno = new NAlumno();
           ItemTablaISR oISR = oNAlumno.CalcularISR(id);
           return oISR;
        }
    }
}
