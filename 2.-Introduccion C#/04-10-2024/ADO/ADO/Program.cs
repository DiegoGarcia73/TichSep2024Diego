using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ADOEstatus estatusAlu = new ADOEstatus(); //Creación del objeto
            Estatus estatus = new Estatus();
            List<Estatus> _listaEstatus = new List<Estatus>();

            string respuesta;

            do
            {
                Console.Clear();
                Console.WriteLine("Menu de opciones");
                Console.WriteLine("1. Consultar todos");
                Console.WriteLine("2. Consultar solo uno");
                Console.WriteLine("3. Agregar");
                Console.WriteLine("4. Actualizar");
                Console.WriteLine("5. Eliminar");
                Console.WriteLine("6. Terminar");

                respuesta = Console.ReadLine();
                Estatus oestatus1 = new Estatus();
                    
                switch (respuesta)
                {
                    case "1":
                    Console.WriteLine("Usted ha seleccionado Consultar todos");
                    List<Estatus> listadeEstatus = estatusAlu.Consultar(); //Creación 

                    foreach (var item in listadeEstatus)
                      {
                      Console.WriteLine($"id: {item.id}, clave: {item.clave}, nombre: {item.nombre}");
                      }
                      Console.ReadKey();
                      break;

                    case "2":
                    Console.WriteLine("Usted ha seleccionado Consultar solo uno");
                    Console.WriteLine("Ingresa el id que desea consultar");
                    int id = Convert.ToInt32(Console.ReadLine());

                    estatus = estatusAlu.Consultar(id); // Consultar el id

                    if (estatus != null) //Se verifica si el resultado no es nulo
                    {
                        Console.WriteLine($"id: {estatus.id}, clave: {estatus.clave}, nombre: {estatus.nombre}");
                    }
                    Console.ReadKey();
                        break;

                    case "3":
                    Console.WriteLine("Usted ha seleccionado Agregar");
                    Console.WriteLine("Ingrese el id que desea agregar");
                    estatus.id = Convert.ToInt32(Console.ReadLine());
                    estatusAlu.Agregar(estatus);
                    Console.ReadKey();
                    break;

                    case "4":
                    Console.WriteLine("Usted ha seleccionado Actualizar");
                    Console.WriteLine("Ingrese el id que desea cambiar para darle un nuevo id");
                    estatus.id = Convert.ToInt32(Console.ReadLine());
                    estatusAlu.Actualizar(estatus);
                    Console.ReadKey();
                    break;

                    case "5":
                    Console.WriteLine("Usted ha seleccionado Eliminar");
                    Console.WriteLine("Ingrese el id que desea eliminar");
                    estatus.id = Convert.ToInt32(Console.ReadLine());
                    estatusAlu.Eliminar(estatus.id);
                    Console.ReadKey();
                    break;
                    
                    case "6":
                    Console.WriteLine("Ha decidido terminar el programa");
                    Console.ReadKey();
                    break;

                    default:
                    Console.WriteLine("Opción no válida, inténtelo de nuevo");
                    Console.ReadKey();
                    break;
                }
            }while (respuesta != "6");
        }
    }
}







/*if (respuesta == "1")
                    {
                    Console.WriteLine("Usted ha seleccionado Consultar todos");
                    List<Estatus> listadeEstatus = estatusAlu.Consultar(); //Creación 

                    foreach (var item in listadeEstatus)
                    {
                        Console.WriteLine($"id: {item.id}, clave: {item.clave}, nombre: {item.nombre}");
                    }
                    Console.ReadKey();
                    }
                if (respuesta == "2")
                {
                    Console.WriteLine("Usted ha seleccionado Consultar solo uno");
                    Console.WriteLine("Ingresa el id que desea consultar");
                    int id = Convert.ToInt32(Console.ReadLine());

                    estatus = estatusAlu.Consultar(id); // Consultar el id

                    if (estatus != null) //Se verifica si el resultado no es nulo
                    {
                        Console.WriteLine($"id: {estatus.id}, clave: {estatus.clave}, nombre: {estatus.nombre}");
                    }
                    Console.ReadKey();
                }


                if (respuesta == "3")
                    {
                    Console.WriteLine("Usted ha seleccionado Agregar");
                    Console.WriteLine("Ingrese el id que desea agregar");
                    estatus.id = Convert.ToInt32(Console.ReadLine());
                    estatusAlu.Agregar(estatus);

                    Console.ReadKey();
                    }

                    if (respuesta == "4")
                    {
                    Console.WriteLine("Usted ha seleccionado Actualizar");
                    Console.WriteLine("Ingrese el id que desea cambiar para darle un nuevo id");
                    estatus.id = Convert.ToInt32(Console.ReadLine());
                 
                    estatusAlu.Actualizar(estatus);

                    Console.ReadKey();
                    }

                    if (respuesta == "5")
                    {
                    Console.WriteLine("Usted ha seleccionado Eliminar");
                    Console.WriteLine("Ingrese el id que desea eliminar");
                    int id = Convert.ToInt32(Console.ReadLine());
                    estatusAlu.Eliminar(id);
                    Console.ReadKey();
                    }
                    else Console.WriteLine("Ha decidido terminar el programa"); */