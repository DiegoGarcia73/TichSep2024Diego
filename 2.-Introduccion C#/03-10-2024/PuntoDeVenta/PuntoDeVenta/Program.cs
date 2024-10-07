using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Newtonsoft.Json;
using System.Runtime.InteropServices.WindowsRuntime;

namespace PuntoDeVenta
{
    internal class Program
    {
        public static List<Articulo> _articulos;
        static void Main(string[] args)
        {
            CargarArticulos();
            while (true)
            {
                MostrarMenuPrincipal();
                string respuesta = Console.ReadLine().ToUpper();

                if (respuesta == "T")
                {
                    MostrarTotalVenta(); //Terminar 
                    break;
                }
                else if (respuesta == "V") ProcesarVenta();
            }
        }
        private static void CargarArticulos()
        {
            //CARGANDO EL CATÁLOGO DE ARTÍCULOS PARA DESERIALIZARLO
            using (StreamReader catArticulos = new StreamReader(@"C:\Users\DIEGO\Documents\Bootcamp_TICH_SEP_2024\C_Sharp_POO\Semana_2\03-10-2024\Articulos.json"))
            {
                string json = catArticulos.ReadToEnd();
                _articulos = JsonConvert.DeserializeObject<List<Articulo>>(json);
            }
        }
        private static void MostrarMenuPrincipal()
        {
            Console.Clear();
            Console.WriteLine("Empresa TICH");
            Console.WriteLine("----------------------------------------------------------------");
            Console.WriteLine("MC: Presiona (V) para iniciar una nueva Venta o Presiona (T) para terminar");
        }

       public static void ProcesarVenta()
        {
            decimal totalPrecio = 0;
            List<ItemBase> itemBase = new List<ItemBase>();
            while (true)
            {
                Console.WriteLine("Ingrese el id del Articulo");
                int id = LeerEntero();
                Console.WriteLine("Ingrese la cantidad del articulo");
                int cantidad = LeerEntero();

                Articulo articulo = _articulos.Find(art => art.id == id);

                if(articulo == null)
                {
                    Console.WriteLine("Articulo no encontrado");
                    Console.WriteLine("Presione una tecla para continuar");
                    Console.ReadKey();
                    continue;
                }

                ItemBase item = CrearItem(articulo, cantidad, out decimal itemTotal);
                if (item != null)
                {
                    itemBase.Add(item);
                    totalPrecio += itemTotal;
                }
                Console.Clear();
                ImprimirTicket(itemBase, totalPrecio);

                Console.WriteLine("¿Desea terminar su venta o desea agregar más productos al carrito? " +
                    "TV: Terminar Venta, Y: SÍ");
                string respuesta = Console.ReadLine().ToUpper();
                if (respuesta == "TV") break;            
            }
             Console.Clear();
             ImprimirTicket(itemBase, totalPrecio);
             Console.WriteLine($"Su total a pagar es:{totalPrecio:F2}");
             Console.ReadKey();
        }
        public static ItemBase CrearItem(Articulo articulo, int  cantidad, out decimal itemTotal)
        {
            ItemBase item = null;
            itemTotal = 0;

            switch (articulo.tipo)
            {
                case 1:
                    item = new Item(articulo, cantidad); itemTotal = item.Total(); break;

                case 2: //Si es artículo tipo 2
                    Console.WriteLine("Proporcione el % Descuento");
                    decimal descuento = LeerDecimal();
                    item = new ItemDescuento(articulo, cantidad, descuento);
                    itemTotal = item.Total();
                    break;

                case 3: //Si es articulo tiempo aire
                    Console.WriteLine("Proporcione el número telefónico: ");
                    string telefono = Console.ReadLine();
                    Console.WriteLine("Proporcione la compañía de telefonía: ");
                    string compañia = Console.ReadLine();
                    Console.WriteLine("Proporcione la comisión en $: ");
                    decimal comision = LeerDecimal();
                    item = new ItemTA(articulo, cantidad, telefono, compañia, comision);
                    itemTotal = item.Total();
                    break;

                default:
                    Console.WriteLine("Tipo de artículo inválido");
                    break;
            }
            return item; 
        }
        public static void ImprimirTicket(List<ItemBase> itemBase, decimal totalPagar)
        {
            Console.Clear();
            Console.WriteLine("Empresa TICH");
            Console.WriteLine("--------------------------------------------------------------");
           
            foreach (ItemBase item in itemBase)
            {
                Console.WriteLine("*****************************************************");
                item.Imprimir();
                Console.WriteLine("*****************************************************");
            }
           // Console.WriteLine(itemBase.Sum(x => x.Total()));
           
        }

       public static void MostrarTotalVenta()
        {
            decimal totalPagar = 0;
            Console.Clear();
            Console.WriteLine("***********************************************************");
            Console.WriteLine($"El total a pagar es: {totalPagar}");
            Console.WriteLine("Presione 'T' para terminar");
            Console.WriteLine("***********************************************************");
            Console.ReadKey();
        }
        private static int LeerEntero()
        {
            while (true)
            {
                if (int.TryParse(Console.ReadLine(), out int valor))
                {
                    return valor;
                }
                Console.WriteLine("Por favor, ingrese un número entero");
            }
        }
        private static decimal LeerDecimal()
        {
            while (true)
            {
                if (int.TryParse(Console.ReadLine(), out int valor))
                {
                    return valor;
                }
                Console.WriteLine("Por favor, ingrese un número decimal");
            }
        }
    }
}