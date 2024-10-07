using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace MenuGeneral
{
    internal class Archivotxt
    {
        
        public static void EscribirTxt(string rutaArchivo, bool esNuevo, string codificacion)
        {
           //Encoding representa una codificación de caracteres y se almacena en la variable encoding
            Encoding encoding;
            switch (codificacion.ToUpper())
            {
                case "UTF7":
                    encoding = Encoding.UTF7;
                    break;
                case "UTF8":
                    encoding = Encoding.UTF8;
                    break;
                case "UNICODE":
                    encoding = Encoding.Unicode;
                    break;
                case "UTF32":
                    encoding = Encoding.UTF32;
                    break;
                case "ASCII":
                    encoding = Encoding.ASCII;
                    break;
                default:
                    Console.WriteLine("Será UTF8.");
                    encoding = Encoding.UTF8;
                    break;
            }

            //  apertura del archivo
            FileMode fileMode = esNuevo ? FileMode.Create : FileMode.Append;

            //ciclo While que solicitará información al usuario dentro del método EscribirTxt
            while (true)
            {
              
                Console.WriteLine("Introduce el nombre del alumno:");
                string nombre = Console.ReadLine();

                Console.WriteLine("Introduce el primer apellido del alumno:");
                string primerApellido = Console.ReadLine();

                Console.WriteLine("Introduce el segundo apellido del alumno:");
                string segundoApellido = Console.ReadLine();

                Console.WriteLine("Introduce la edad del alumno:");
                string edad = Console.ReadLine();

                Console.WriteLine("Introduce el estado del alumno:");
                string estado = Console.ReadLine();

                //  comas
                string linea = $"{nombre},{primerApellido},{segundoApellido},{edad},{estado}";

                //  línea archivo
                using (StreamWriter writer = new StreamWriter(rutaArchivo, append: !esNuevo, encoding: encoding))
                {
                    writer.WriteLine(linea);
                }

               
                Console.WriteLine("¿Desea agregar otro alumno? (sí/no)");
                string respuesta = Console.ReadLine().ToLower();

                if (respuesta != "sí" && respuesta != "si")
                {
                    break;
                }
            }
        }
    /*Este método lee el archivo de texto línea por línea y muestra su contenido en la consola.
    StreamReader: Se utiliza para abrir y leer el archivo.
    Si ocurre algún error al leer el archivo (como que no exista), se captura una excepción 
    y se muestra un mensaje de error. */
        public static void MostrarTxt(string rutaCompleta) 
        {
            try
            {
                // Abrir 
                using (StreamReader lector = new StreamReader(rutaCompleta))
                {
                    string linea;
                    // Leer 
                    while ((linea = lector.ReadLine()) != null)
                    {
                        Console.WriteLine(linea);
                    }
                }
            }
            catch (IOException e)
            {
                
                Console.WriteLine($"Error al leer el archivo {rutaCompleta}: {e.Message}");
            }
        }
        /*Este método también lee un archivo, pero asume que es un archivo CSV (valores separados por
         comas). Split(','): Divide cada línea del archivo en campos separados por comas y los
         muestra en la consola, organizados en columnas. */
        public static void MostrarCSV(string rutaCompleta)
        {
            try
            {
                // Abrir
                using (StreamReader lector = new StreamReader(rutaCompleta))
                {
                    string linea;
                    // Leer 
                    while ((linea = lector.ReadLine()) != null)
                    {
                        
                        string[] campos = linea.Split(',');

                        // Mostrar 
                        foreach (string campo in campos)
                        {
                            Console.Write(campo + "\n"); //la \t hace tabulaciones
                        }
                        Console.WriteLine(); 
                    }
                }
            }
            catch (IOException e)
            {
                
                Console.WriteLine($"Error al leer el archivo {rutaCompleta}: {e.Message}");
            }
        }
        public static void Presentacion()
        {
            Console.WriteLine("------ Presentación ------");
            string rutaTxt = LeerCadena("Ingrese la ruta y nombre del archivo txt (Ej. C:\\carpeta\\archivo.txt): ");
            MostrarTxt(rutaTxt);

            string rutaCSV = LeerCadena("Ingrese la ruta y nombre del archivo csv (Ej. C:\\carpeta\\archivo.csv): ");
            MostrarCSV(rutaCSV);
        } 
        private static string LeerCadena(string mensaje)
        {
            Console.Write(mensaje);
            return Console.ReadLine();
        }
    }
}
