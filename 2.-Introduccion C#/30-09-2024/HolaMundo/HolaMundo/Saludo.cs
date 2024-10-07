using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HolaMundo
{
    public class Saludo
    {
        public static string saludarEstatico(string nombre)//Método estático
        {
            return "Hola " + nombre + ", Saludando desde un método estático";
        }
        public string saludarNoEstatico(string nom)//Método no estático. Se recibe parámetro
        {
            return "Hola " + nom + ", Saludando desde un método no estático";
        }
    }
}
