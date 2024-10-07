using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDEstatus_
{
 public class EstatusAlumnos
    {
       private static List<Estatus> listaE = new List<Estatus>(); //Creación de la lista

        public static List<Estatus> consultarTodos() //Definiendo el método consultarTdoso
        {
            return listaE;
        }
        public static Estatus consultarSoloUno(int id)
        {
            // Buscar el elemento por id en la lista
            var clave = listaE.Find(e => e.id == id);
            return clave;
        }

        public static void agregar(Estatus estatus)
        {

            listaE.Add(estatus);
        }
 
        public static void actualizar(Estatus estatus)
        {

           Estatus actualizar1=listaE.Find(e => e.id == estatus.id);
           actualizar1.clave=estatus.clave;
           actualizar1.nombre=estatus.nombre;
        }

        public static void eliminar(int id)

        {
           
            Estatus eliminar = listaE.Find(e => e.id == id);
            listaE.Remove(eliminar);
        }















       /* public static void presentacion(string res)
        {
            // Implementación de la lógica de presentación
            switch (res)
            {
                case "1":
                    
                    Console.WriteLine("Consultar todas");
                     List <alumnos> retorna=consultarTodos();
                    foreach (var item in retorna)
                    {
                        Console.WriteLine($"El ID es: {item.id}, la clave:{item.clave},  el estatus;{item.nombre}");
                    }
                    break;
                case "2":
                    Console.WriteLine("Consultar solo uno");
                    Console.WriteLine("Ingresa el ID a consultar:");
                    int idConsulta = Convert.ToInt32(Console.ReadLine());
                    try
                    {
                        var uno = consultarSoloUno(idConsulta);
                        Console.WriteLine($"El ID es: {uno.id}. clave: {uno.clave}. el estatus es ;{uno.nombre}");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    break;
                case "3":
                    Console.WriteLine("Agregar");
                    Console.WriteLine("Ingresa el ID:");
                    int idAgregar = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Ingresa la clave del estatus");
                    string claveAgregar = Console.ReadLine();
                    Console.WriteLine("Ingresa el estatus:");
                    string nombreAgregar = Console.ReadLine();
                    try
                    {
                        EstatusAlumnos.agregar(idAgregar, claveAgregar,nombreAgregar);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    break;
                    
                case "4":
                    Console.WriteLine("Actualizar");
                    Console.WriteLine("Ingresa el ID a actualizar:");
                    int idActualizar = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Ingresa la clave del estatus:");
                    string estadoActualizar = Console.ReadLine();
                    Console.WriteLine("Ingresa el estatus:");
                    string nombreActualizar = Console.ReadLine();
                    try
                    {
                        EstatusAlumnos.actualizar(idActualizar, estadoActualizar, nombreActualizar);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    break;

                case "5":
                    Console.WriteLine("Has elegido eliminar");
                         Console.WriteLine("Ingresa el id a eliminar");
                         int id = Convert.ToInt16(Console.ReadLine());

                         try
                         {
                            EstatusAlumnos.eliminar(id);


                             Console.ReadKey();
                         }
                         catch (Exception e)
                         {
                             Console.WriteLine(e.Message);

                         }
                    break;

            }
                    Console.ReadKey();
            } */

        }

}

    
  