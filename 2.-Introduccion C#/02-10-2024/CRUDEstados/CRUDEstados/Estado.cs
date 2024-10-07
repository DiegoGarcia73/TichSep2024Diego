using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDEstados
{
    public class Estado
    {
        public Estado() //Método constructor vacío
        {
        }

        public Estado(int id, string nombre) //Método constructor
        {
            this.id = id;
            this.nombre = nombre;
        }

        public int id { get; set; }
        public string nombre { get; set; }
    }
}
