using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OperacionesAritmeticas
{
    public struct OperacionAritmetica
    {
        public OperacionAritmetica(decimal operando1, decimal operando2, tipoOperacion operacion)
        {
            Operando1 = operando1;
            Operando2 = operando2;
            Operacion = operacion;
        }

        //Propiedades
        public decimal Operando1 { get; set; } //obtiene y asigna
            public decimal Operando2 { get; set; }
            public tipoOperacion Operacion { get; set; }
    }
}
