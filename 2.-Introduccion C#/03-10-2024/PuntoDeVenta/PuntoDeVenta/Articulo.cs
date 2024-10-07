using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PuntoDeVenta
{
    public class Articulo
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public decimal precio { get; set; }
        public int tipo { get; set; }
    }
   /* public enum tipoProducto
    {
        tipo1=1,
        tipo2=2,
        tipo3=3
    } */
}
