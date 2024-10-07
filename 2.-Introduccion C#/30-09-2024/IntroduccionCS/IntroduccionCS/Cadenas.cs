/* TEMA: INTRODUCCIÓN A C#
SUBTEMA: OPERACIONES BÁSICAS */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace IntroduccionCS
{
    public class Cadenas
    {
        public static void HolaMundo()
        {
            Console.WriteLine("Proporciona tu nombre");
            string nombre = Console.ReadLine().Trim();

            Console.WriteLine("Proporciona tu primer apellido");
            string primerApellido = Console.ReadLine().Trim();
 
            Console.WriteLine("Propociona tu segundo apellido");
            string segundoApellido = Console.ReadLine().Trim();

            Console.WriteLine("Proporciona tu edad");
            int edad = int.Parse(Console.ReadLine().Trim());

            //Concatenación
            Console.WriteLine("Hola " + nombre + " " + primerApellido + " " + segundoApellido);

            //Formato compuesto
            Console.WriteLine("{0} {1} {2} tiene {3} años", nombre, primerApellido, segundoApellido, edad);

            //Utilizando interpolación y mayúsculas
            Console.WriteLine($"Gusto en conocerte {nombre.ToUpper()} {primerApellido.ToUpper()} {segundoApellido.ToUpper()}!!!");

            //Secuencias de escape
            string ruta = @"C: \Users\DIEGO\Documents\Bootcamp TICH SEP - 2024\C# y POO\Semana 2\30-09-2024\IntroduccionCS\IntroduccionCS";
            Console.WriteLine("El archivo fue almacenado en: \n" + ruta);
            
            Console.ReadKey();

        }

    }
}
