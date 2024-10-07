using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Arreglo con objeto de tipo cuadrado y triangulo
            IFigura[] FiguraArreglo = new IFigura[2];
            FiguraArreglo[0] = new Cuadrado(10);
            FiguraArreglo[1] = new Triangulo(8, 9);

            foreach(IFigura figura in FiguraArreglo)
            {
                //Muestra informacion detallada sobre el objeto
                Console.WriteLine(figura.ToString());
                decimal area = figura.Area(); //invocación del método área
                Console.WriteLine("Area: {0}", area);
                decimal perimetro = figura.Perimetro(); //invocación del método perímetro
                Console.WriteLine("Perimetro: {0}", perimetro);
                Math.Round(perimetro, 2);
            }
            Console.ReadKey();
        }
    }
}
