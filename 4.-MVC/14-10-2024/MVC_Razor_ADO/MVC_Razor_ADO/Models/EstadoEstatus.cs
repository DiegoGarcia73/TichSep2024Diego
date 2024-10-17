using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_Razor_ADO.Models
{
    public class EstadoEstatus
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string correo { get; set; }
        public string telefono { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string curp { get; set; }
        public decimal sueldo { get; set; }
        public string nombreEstado { get; set; }
        public string nombreEstatus { get; set; }
    }
}