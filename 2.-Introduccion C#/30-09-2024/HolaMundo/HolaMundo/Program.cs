//Espacios de nombre
using System;                  
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HolaMundo
{
    internal class Program //Nomenclatura de Pascal
    {
        static void Main(string[] args) //Firma del método
        {
            string nombre;
            Console.WriteLine("¿Cuál es tu nombre?"); //Clase console, método WriteLine 
            nombre = Console.ReadLine(); //Método estático. Asignación

            //Para invocar un método estático (por clase)
            String retornoMetodo = Saludo.saludarEstatico(nombre);

            Console.WriteLine(retornoMetodo);

            //Para invocar un método no estático (por objeto)
            Saludo objSaludo = new Saludo(); //Instanciar una clase para crear un objeto
            retornoMetodo = objSaludo.saludarNoEstatico(nombre);

            Console.WriteLine(retornoMetodo);

            /*Console.WriteLine("Hola, ¿cómo estás, " + nombre + "?"); */
            Console.ReadKey(); //Espera que teclees para que pueda terminar el programa

        }
    }
}
