using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuGeneral
{
    public class Poliza
    {

        public struct RangoEdad
        {
            public int EdadInicial { get; set; }
            public int EdadFinal { get; set; }
            public string Genero { get; set; }
            public decimal Factor { get; set; }
        }

        //cambiar a arreglo de decimales 

        /*private static decimal[,] RangoEdad1 = new decimal[,]
            {
                {0m, 20m, 0m, 0.05m},
                {21m, 30m, 0m, 0.1m},
                {31m, 40m, 0m, 0.4m},
                {41m, 50m, 0m, 0.5m},
                {51m, 60m, 0m, 0.65m},
                {61m, decimal.MaxValue, 0m, 0.85m},
                {0m, 20m, 1m, 0.05m},
                {21m, 30m, 1m, 0.1m},
                {31m, 40m, 1m, 0.4m},
                {41m, 50m, 1m, 0.55m},
                {51m, 60m, 1m, 0.7m},
                {61m, decimal.MaxValue, 0m, 0.9m}
            };  */

        private static RangoEdad[] factores = new RangoEdad[]
        {
            new RangoEdad { EdadInicial = 0, EdadFinal = 20, Genero = "Femenino", Factor = 0.05m },
            new RangoEdad { EdadInicial = 21, EdadFinal = 30, Genero = "Femenino", Factor = 0.1m },
            new RangoEdad { EdadInicial = 31, EdadFinal = 40, Genero = "Femenino", Factor = 0.4m },
            new RangoEdad { EdadInicial = 41, EdadFinal = 50, Genero = "Femenino", Factor = 0.5m },
            new RangoEdad { EdadInicial = 51, EdadFinal = 60, Genero = "Femenino", Factor = 0.65m },
            new RangoEdad { EdadInicial = 61, EdadFinal = int.MaxValue, Genero = "Femenino", Factor = 0.85m },
            new RangoEdad { EdadInicial = 0, EdadFinal = 20, Genero = "Masculino", Factor = 0.05m },
            new RangoEdad { EdadInicial = 21, EdadFinal = 30, Genero = "Masculino", Factor = 0.1m },
            new RangoEdad { EdadInicial = 31, EdadFinal = 40, Genero = "Masculino", Factor = 0.4m },
            new RangoEdad { EdadInicial = 41, EdadFinal = 50, Genero = "Masculino", Factor = 0.55m },
            new RangoEdad { EdadInicial = 51, EdadFinal = 60, Genero = "Masculino", Factor = 0.7m },
            new RangoEdad { EdadInicial = 61, EdadFinal = int.MaxValue, Genero = "Masculino", Factor = 0.9m }
        };

        //  devuelve PolizaResultado
        public static PolizaResultado calcular(DateTime fechaInicio, string tipoPeriodo, int cantidadPeriodos,
                                               decimal sumaAsegurada, DateTime fechaNacimiento, string genero)
        {
            DateTime fechaTermino = CalcularFechaTermino(fechaInicio, tipoPeriodo, cantidadPeriodos);
            decimal prima = CalcularPrima(sumaAsegurada, fechaInicio, fechaTermino, fechaNacimiento, genero);


            PolizaResultado resultado = new PolizaResultado
            {
                FechaTermino = fechaTermino,
                Prima = prima
            };


            return resultado;
        }

        private static DateTime CalcularFechaTermino(DateTime fechaInicio, string tipoPeriodo, int cantidadPeriodos)
        {
            switch (tipoPeriodo.ToLower())
            {
                case "años":
                    return fechaInicio.AddYears(cantidadPeriodos);
                case "meses":
                    return fechaInicio.AddMonths(cantidadPeriodos);
                case "días":
                    return fechaInicio.AddDays(cantidadPeriodos);
                default:
                    throw new ArgumentException("El tipo de periodo especificado no es válido.");
            }
        }

        public static decimal CalcularPrima(decimal sumaAsegurada, DateTime fechaInicio, DateTime fechaTermino,
                                           DateTime fechaNacimiento, string genero)
        {
            int edad = CalcularEdad(fechaNacimiento);
            decimal factor = ObtenerFactor(edad, genero);

            int dias = (int)(fechaTermino - fechaInicio).TotalDays;

            return sumaAsegurada * (factor * dias / 360);
        }

        private static int CalcularEdad(DateTime fechaNacimiento)
        {
            DateTime ahora = DateTime.Today;
            int edad = ahora.Year - fechaNacimiento.Year;
            if (fechaNacimiento.Date > ahora.AddYears(-edad)) edad--;
            return edad;
        }

        private static decimal ObtenerFactor(int edad, string genero)
        {

            foreach (var rango in factores)
            {
                if (edad >= rango.EdadInicial && edad <= rango.EdadFinal && rango.Genero.ToLower() == genero.ToLower())
                {
                    return rango.Factor;
                }
            }

            throw new ArgumentException("No se encontró un factor para la combinación de edad y género especificada.");
            Console.ReadKey();
        }


        public static void Presentacion()
        {
            Console.WriteLine("Proporciona la fecha de inicio de vigencia (yyyy-MM-dd): ");
            DateTime fechaInicio = DateTime.Parse(Console.ReadLine());

            Console.WriteLine("Proporciona para cuánto tiempo requieres la póliza (ejemplo 2 años, 3 meses, 10 días): ");
            string[] partesPeriodo = Console.ReadLine().Split(' ');
            string tipoPeriodo = partesPeriodo[1];
            int cantidadPeriodos = int.Parse(partesPeriodo[0]);

            Console.WriteLine("Proporciona la suma asegurada: ");
            decimal sumaAsegurada = decimal.Parse(Console.ReadLine());

            Console.WriteLine("Proporciona la fecha de nacimiento del asegurado (yyyy-MM-dd): ");
            DateTime fechaNacimiento = DateTime.Parse(Console.ReadLine());

            Console.WriteLine("Proporciona el género del asegurado (Femenino/Masculino): ");
            string genero = Console.ReadLine();


            PolizaResultado resultado = calcular(fechaInicio, tipoPeriodo, cantidadPeriodos,
                                                 sumaAsegurada, fechaNacimiento, genero);


            Console.WriteLine("\nResultados:");
            Console.WriteLine($"La poliza vencerá el: {resultado.FechaTermino.ToString("d 'de' MMMM 'de' yyyy", new System.Globalization.CultureInfo("es-ES"))}");
            Console.WriteLine($"La prima a pagar es de: {((int)resultado.Prima)} pesos");
        }
    }

    public class PolizaResultado
    {

        public DateTime FechaTermino { get; set; }
        public decimal Prima { get; set; }
    }


}
