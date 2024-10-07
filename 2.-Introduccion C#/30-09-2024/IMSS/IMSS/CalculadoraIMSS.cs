using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSS
{
    internal class CalculadoraIMSS
    {
        public static Aportaciones Calcular(decimal salarioBase, decimal uma, int esPatron)
        {
            Aportaciones resultados = new Aportaciones();

            decimal valor3UMAs = 3 * uma;

            // Cálculos para las aportaciones
            if (esPatron == 1)
            {

                resultados.enfermedadMaternidad = (salarioBase - valor3UMAs) * 0.011m;
                resultados.invalidezVida = salarioBase * 0.0175m;
                resultados.retiro = salarioBase * 0.02m;
                resultados.cesantia = salarioBase * 0.0315m;
                resultados.infonavit = salarioBase * 0.05m;
            }
            else if (esPatron == 2) //Opción para trabajador
            {
                resultados.enfermedadMaternidad = (salarioBase - valor3UMAs) * 0.004m;
                resultados.invalidezVida = salarioBase * 0.00625m;
                resultados.retiro = salarioBase * 0.00m;
                resultados.cesantia = salarioBase * 0.01125m;
            }
            else
            {

                Console.WriteLine("esta opcion no existe");
                Presentacion();

            }
            return resultados;
        }
        public static void Presentacion()
        {

            Console.WriteLine("Calculadora IMSS");

            Console.Write("Ingrese el Salario Base de Cotización (SBC): ");
            decimal salarioBase = Convert.ToDecimal(Console.ReadLine());

            Console.Write("Ingrese la Unidad de Medida de Actualización (UMA): ");
            decimal uma = Convert.ToDecimal(Console.ReadLine());

            Console.WriteLine("Presione 1 si el calculo es para el patrón y 2 para el trabajador");
            int esPatron = Convert.ToInt16(Console.ReadLine());


            Aportaciones resultados = Calcular(salarioBase, uma, esPatron);


            Console.WriteLine("\nResultados:");

            //La "C" formatea numeros como valores monetarios, es decir se mostrará en formato moneda
            Console.WriteLine($"Enfermedad y Maternidad: {resultados.enfermedadMaternidad:C}");
            Console.WriteLine($"Invalidez y Vida: {resultados.invalidezVida:C}");
            Console.WriteLine($"Retiro: {resultados.retiro:C}");
            Console.WriteLine($"Cesantía: {resultados.cesantia:C}");
            Console.WriteLine($"Crédito Infonavit: {resultados.infonavit:C}");


            decimal total = resultados.enfermedadMaternidad + resultados.invalidezVida +
                            resultados.retiro + resultados.cesantia + resultados.infonavit;
            Console.WriteLine($"\nTotal de Aportaciones: {total:C}");

            Console.ReadLine();

        }

    }
}