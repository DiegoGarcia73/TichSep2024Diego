using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDEstados
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string respuesta;
            do
            {
                Console.Clear();
                Console.WriteLine("Menú CRUDEstados");
                Console.WriteLine("1. Consultar todos");
                Console.WriteLine("2. Consultar solo uno");
                Console.WriteLine("3. Agregar");
                Console.WriteLine("4. Actualizar");
                Console.WriteLine("5. Eliminar");
                Console.WriteLine("6. Terminar");

                respuesta = Console.ReadLine();

                switch (respuesta) {

                    case "1":
                        Dictionary<int, Estado> DicEstado = DicCRUD.ConsultarTodos();
                        foreach (KeyValuePair<int, Estado> kvp in DicEstado)
                        {
                            Console.WriteLine($"id: {kvp.Key} nombre: {kvp.Value.nombre}");
                        }
                        Console.ReadKey();
                        break;

                    case "2":
                        Console.WriteLine("Proporcione el id a consultar");
                        int id = Convert.ToInt32(Console.ReadLine());
                        Estado oestado = DicCRUD.ConsultarSoloUno(id);
                        Console.WriteLine($"id: {oestado.id} nombre: {oestado.nombre}");
                        Console.ReadKey();
                        break;
                    case "3":
                        Estado oestadoAgregar = new Estado();
                        Console.WriteLine("Proporcione el id para agregar");
                        oestadoAgregar.id = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Proporcione el nombre para agregar");
                        oestadoAgregar.nombre = Console.ReadLine();
                        DicCRUD.Agregar(oestadoAgregar);
                        Console.ReadKey();
                        break;
                    case "4":
                        Estado oestadoActualizar = new Estado();
                        Console.WriteLine("Proporcione el id para actualizar");
                        oestadoActualizar.id = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Proporcione el nombre para actualizar");
                        oestadoActualizar.nombre = Console.ReadLine();
                        DicCRUD.Actualizar(oestadoActualizar);
                        Console.ReadKey();
                        break;
                    case "5":
                        Console.WriteLine("Proporcione el id para eliminar");
                        id= Convert.ToInt32(Console.ReadLine());
                        DicCRUD.Eliminar(id);
                        Console.ReadKey();
                        break;
                      
                }
          

            } while (respuesta != "6");
        } 
    }
}
