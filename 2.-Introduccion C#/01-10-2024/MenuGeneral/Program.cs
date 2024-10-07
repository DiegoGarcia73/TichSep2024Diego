using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuGeneral
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string res;
            Console.Clear();
            do
            {
                Console.Clear();
                Console.WriteLine("Menu General");
                Console.WriteLine("Seleccione una opción");
                Console.WriteLine("opcion 1.- Arreglos ");
                Console.WriteLine("opcion 2.- Enteros ");
                Console.WriteLine("opcion 3.- ConvierteATipoOracion");
                Console.WriteLine("opcion 4.- Poliza");
                Console.WriteLine("opcion 5.- Mostrar  archivos txt ,csv");
                Console.WriteLine("opcion 6.- EscribirTxt ");
                Console.WriteLine("opcion 7.- Procedimiento del Calculo del ISR");

                Console.WriteLine("f - Terminar");

                res = Console.ReadLine();

                if (res == "1")
                {
                    Console.WriteLine("Arreglos");

                    Arreglos.Cadenas();

                    Console.ReadKey();

                }
                else if (res == "2")
                {


                    Console.WriteLine("Enteros ");
                    Arreglos.Enteros();
                   
                    Console.ReadKey();
                   
                }
                else if (res == "3")
                {
                    

                    Console.WriteLine("Ingrese el texto a convertir:");
                    string texto = Console.ReadLine();

                    string resultado = Arreglos.ConvertirATipoOracion(texto);
                    Console.WriteLine($"Texto : {resultado}");

                    Console.ReadKey();
                }
                else if (res == "4")
       
                {
                    Console.WriteLine("Poliza");
                    Console.WriteLine("");
                    Poliza.Presentacion();
                    Console.ReadKey();
                }
                else if (res == "5")
                {
                    Console.WriteLine("Archivos txt ,csv ");
                    Archivotxt.Presentacion();
                    Console.ReadKey();
                }

                else if (res == "6")
                {
                    Console.WriteLine("Introduce la ruta del archivo:");
                    string rutaArchivo = Console.ReadLine();

                    Console.WriteLine("¿Es un archivo nuevo? (sí/no):");
                    bool esNuevo = Console.ReadLine().ToLower() == "sí" || Console.ReadLine().ToLower() == "si";

                    Console.WriteLine("Introduce la codificación (UTF7, UTF8, Unicode, UTF32, ASCII):");
                    string codificacion = Console.ReadLine();

                   Archivotxt.EscribirTxt(rutaArchivo, esNuevo, codificacion);
                    break;
                }

                    else if (res == "7")
                {
                    Console.WriteLine("Procedimiento del Calculo del ISR");
                    Tabla_del_ISR.Presentacion();

                    Console.ReadKey();
                }

                else if (res.ToLower() == "f")
                {
                   
                    Console.WriteLine("Terminando...");
                    Console.ReadKey();
                    break;

                }
                else
                {
                    Console.Clear();
                    Console.WriteLine("Opción inválida. Intente de nuevo.");

                   // continue;
                   Console.ReadKey();

                }              
            } while (res != "f" );           
        }
        private static void LeerArchivoTexto(string rutaArchivo)
        {
            throw new NotImplementedException();
        }
    }
}
