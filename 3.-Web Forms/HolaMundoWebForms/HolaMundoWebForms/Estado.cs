using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HolaMundoWebForms
{
    public class Estado //Clase Estado
    {
        public Estado()
        {
        }

        public Estado(int id, string nombre)
        {
            this.id = id;
            this.nombre = nombre;
        }

        public int id {  get; set; }
        public string nombre { get; set; }
    }
}