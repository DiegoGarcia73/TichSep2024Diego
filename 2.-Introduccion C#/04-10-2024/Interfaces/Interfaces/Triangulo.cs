using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Triangulo : IFigura
    {

        private double baseTri;
        private double lado1;

        double altura
        {
            get
            {
                //Obteniendo la altura del triángulo isósceles
                return Math.Sqrt((lado1 * lado1) - ((baseTri * baseTri) / 4));
            }
        }
        public Triangulo(decimal baseTri, decimal lado1)
        {
            this.baseTri = Convert.ToDouble(baseTri);
            this.lado1 = Convert.ToDouble(lado1);

        }
        public decimal Area()
        {
            return Convert.ToDecimal((baseTri * altura) / 2);
        }
        public decimal Perimetro()
        {
            return Convert.ToDecimal(baseTri + 2 * lado1);
        }
    }
}