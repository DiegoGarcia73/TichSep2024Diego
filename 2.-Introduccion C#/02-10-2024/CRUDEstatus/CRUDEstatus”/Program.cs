using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDEstatus_
{
    internal class Program
    {
        static void Main(string[] args)
        {
             string res;

            do
            {

                Console.Clear();
                Console.WriteLine("Menu CRUD Estatus");
                Console.WriteLine("1. Consultar todos");
                Console.WriteLine("2. Consultar solo uno");
                Console.WriteLine("3. Agregar");
                Console.WriteLine("4. Actualizar");
                Console.WriteLine("5. Eliminar");
                Console.WriteLine("6. Terminar");

                res = Console.ReadLine();

                switch (res)
                {
                    case "1":

                        Console.WriteLine("Consultar todas");
                        List<Estatus> retorna = EstatusAlumnos.consultarTodos();
                        foreach (var item in retorna)
                        {
                            Console.WriteLine($"El ID es: {item.id}, la clave: {item.clave}, El estatus es: {item.nombre}");
                        }
                        break;
                    case "2":
                        Console.WriteLine("Consultar solo uno");
                        Console.WriteLine("Ingresa el ID a consultar:");
                        int idConsulta = Convert.ToInt32(Console.ReadLine());
                        try
                        {
                            var uno = EstatusAlumnos.consultarSoloUno(idConsulta);
                            Console.WriteLine($"El ID es: {uno.id}. clave: {uno.clave}. el estatus es ;{uno.nombre}");
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;
                    case "3":
                        Estatus oestatusAgregar = new Estatus();
                        Console.WriteLine("Agregar");
                        Console.WriteLine("Ingresa el ID para agregar:");
                        oestatusAgregar.id = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Ingresa la clave del estatus");
                        oestatusAgregar.clave = Console.ReadLine();
                        Console.WriteLine("Ingresa el estatus:");
                        oestatusAgregar.nombre = Console.ReadLine();
                        try
                        {
                            EstatusAlumnos.agregar(oestatusAgregar);
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        break;

                    case "4":
                        Estatus oestatusActualizar = new Estatus();
                        Console.WriteLine("Actualizar");
                        Console.WriteLine("Ingresa el ID a actualizar:");
                        oestatusActualizar.id = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Ingresa la clave del estatus:");
                        oestatusActualizar.clave = Console.ReadLine();
                        Console.WriteLine("Ingresa el estatus:");
                        oestatusActualizar.nombre = Console.ReadLine();
                        try
                        {
                            EstatusAlumnos.actualizar(oestatusActualizar);
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

            } while (res != "6");


        }
    }
}






//EstatusAlumnos estados = new EstatusAlumnos();
//se instancia estados en el objeto estados

//EstatusAlumnos.presentacion(res);
//mandar a llamar el metodo presentacion desde estados 