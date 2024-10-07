//TEMA: INTRODUCCIÓN A C#
//SUBTEMA: ARREGLOS

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuGeneral
{
    internal class Arreglos
    {
        //opción 1 del menú general
        public static void Cadenas()

        {
            Console.WriteLine("Introduce tu nombre completo: ");
            string nombreCompleto = Console.ReadLine();
            string[] nombrEnPartes = nombreCompleto.Split(' ');

            if (nombrEnPartes.Length > 1) Console.WriteLine("Hola ");

            foreach (string palabra in nombrEnPartes) Console.WriteLine(palabra);

            Console.WriteLine("Apellido Vertical");

            Char[] letras = nombrEnPartes[1].ToCharArray();

            foreach (char letra in letras) Console.WriteLine(letra);

        }
        //Opción 2 del menú general
        public static void Enteros()
        {
            int[] numeros = new int[5];
            Console.WriteLine("Ingrese 5 números enteros");

            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine($"Introduzca el número {i + 1}: ");
                numeros[i] = Convert.ToInt32(Console.ReadLine());
            }
            int numMax = numeros[0];
            for (int i = 1; i < 5; i++) if (numeros[i] > numMax) numMax = numeros[i];
            Console.WriteLine($"El numero con el valor máximo es: {numMax} ");
        }

        //Opción 3 del menú general
        public static string ConvertirATipoOracion(string cadenaTexto)
        {

            string[] palabras = cadenaTexto.Split(' '); //Separa una cadena en subcadenas

            StringBuilder resultado = new StringBuilder(); //StringBuilder cadena de caracteres mutable

            foreach (string palabra in palabras)
            {
                if (!string.IsNullOrEmpty(palabra)) //IsNullOrEmpty indica si el valor de la cadena es nulo o está vacío
                {
                    string palabraLetraMayus = char.ToUpper(palabra[0]) + (palabra.Substring(1));
                    resultado.Append(palabraLetraMayus).Append(' '); //Append anexa en la instancia una copia de la cadena solicitada
                }
            }
            return resultado.ToString().Trim(); //ToString convierte el valor de la instancia a tipo cadena
        }

    }
}

