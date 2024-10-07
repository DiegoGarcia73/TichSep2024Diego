using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Globalization;
namespace MenuGeneral
{
    internal class Tabla_del_ISR
    {
        private static List<ItemISR> _listaItemISR = new List<ItemISR>();

        public static void CargarTabla(string rutaArchivo)
        {
            _listaItemISR.Clear();

            try
            {

                using (StreamReader TablaISR = new StreamReader(rutaArchivo))
                // using (StreamReader reader = new StreamReader(rutaArchivo))
                {
                    string Lectura;
                    while ((Lectura = TablaISR.ReadLine()) != null)
                    {
                        ItemISR itemISR = new ItemISR();
                        string[] campos = Lectura.Split(',');

                        itemISR.limInf = Convert.ToDecimal(campos[1]);
                        itemISR.limSup = Convert.ToDecimal(campos[2]);
                        itemISR.cuotaFija = Convert.ToDecimal(campos[3]);
                        itemISR.porExced = Convert.ToDecimal(campos[4]);
                        itemISR.subsidio = Convert.ToDecimal(campos[5]);
                        _listaItemISR.Add(itemISR);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al cargar la tabla ISR: " + ex.Message);
            }
        }


        public static decimal Calcular(decimal sueldoMensual)
        {
            decimal sueldoQuincenal = sueldoMensual / 2;

            decimal impuesto = 0;

            foreach (var rango in _listaItemISR)
            {
                if (sueldoQuincenal >= rango.limInf && sueldoQuincenal <= rango.limSup)
                {
                    decimal excedente = sueldoQuincenal - rango.limInf;

                    impuesto = (excedente * rango.porExced / 100) + rango.cuotaFija - rango.subsidio;
                    break;
                }
            }

            return Math.Round(impuesto, 2);
        }


        public static void Presentacion()
        {
            Console.WriteLine("Introduce el nombre del archivo y ruta que contiene la tabla ISR:");
            string rutaArchivo = Console.ReadLine();
            CargarTabla(rutaArchivo);

            Console.WriteLine("Introduce el sueldo mensual:");
            if (decimal.TryParse(Console.ReadLine(), NumberStyles.Currency, CultureInfo.InvariantCulture, out decimal sueldoMensual))
            {
                decimal resultadoIsrQuincenal = Calcular(sueldoMensual);
                Console.WriteLine($"El ISR quincenal a pagar es: {resultadoIsrQuincenal:C}");
            }
            else
            {
                Console.WriteLine("Sueldo mensual ingresado no es válido.");
            }
        }
        internal class ItemISR
        {
            public decimal limInf { get; set; }
            public decimal limSup { get; set; }
            public decimal cuotaFija { get; set; }
            public decimal porExced { get; set; }
            public decimal subsidio { get; set; }
        }
    }
}