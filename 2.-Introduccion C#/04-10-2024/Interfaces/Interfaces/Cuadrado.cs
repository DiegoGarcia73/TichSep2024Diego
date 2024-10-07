using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Cuadrado : IFigura
    {
        decimal lado1;

        public Cuadrado(decimal lado1)
        {
            this.lado1 = lado1;

        }
        public decimal Area()
        {
            return lado1 * lado1;
        }

        public decimal Perimetro()
        {
            return 4 * lado1;
        }
    }
}

