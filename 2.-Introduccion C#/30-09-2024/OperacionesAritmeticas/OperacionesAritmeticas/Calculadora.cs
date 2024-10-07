using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace OperacionesAritmeticas
{
    public class Calculadora
    {
        //Método estático sumar
        public static decimal Sumar(decimal num1, decimal num2)
        {
            return num1 + num2;
        }
        //Método estático restar
        public static decimal Restar(decimal num1, decimal num2)
        {
            return num1 - num2;
        }
        //Método estático multiplicar
        public static decimal Multiplicar(decimal num1, decimal num2)
        {
            return num1 * num2;
        }
        //Método estático dividir
        public static decimal Dividir(decimal num1, decimal num2)
        {
            if (num2 == 0) throw new DivideByZeroException("No se puede dividir entre 0");
            return num1 / num2;
        }
        //Método estático módulo
        public static decimal Modulo(decimal num1, decimal num2)
        {
            if (num2 == 0) throw new DivideByZeroException("No se puede calcular modulo con 0");
            return num1 % num2;
        }
        public static decimal Operacion(OperacionAritmetica operacion)
        {
            switch (operacion.Operacion)
            {
                case tipoOperacion.sumar:
                    return Sumar(operacion.Operando1, operacion.Operando2);

                case tipoOperacion.restar:
                    return Restar(operacion.Operando1, operacion.Operando2);

                case tipoOperacion.multiplicar:
                    return Multiplicar(operacion.Operando1, operacion.Operando2);

                case tipoOperacion.dividir:
                    return Dividir(operacion.Operando1, operacion.Operando2);

                case tipoOperacion.modulo:
                    return Modulo(operacion.Operando1, operacion.Operando2);

                default:
                    throw new ArgumentException("Operacion inválida");
            }
        }
        public static Resultado Simultaneas(decimal num1, decimal num2)
        {
            return new Resultado
            {
                suma = Sumar(num1, num2),
                resta = Restar(num1, num2),
                multiplicacion = Multiplicar(num1, num2),
                division = num2 != 0 ? Dividir(num1, num2) : 0,
                modulo = num2 != 0 ? Modulo(num1, num2) : 0
            };

        }

        public static void Presentacion()
        {
            decimal resultadoOperacion;
            OperacionAritmetica operacionAritmetica = new OperacionAritmetica();
            Console.WriteLine("Seleccione la operación a realizar: \nSumar = 1 \nRestar = 2 \nMultiplicar = 3 \nDividir = 4 \nModulo = 5");
            operacionAritmetica.Operacion = (tipoOperacion)Convert.ToInt32(Console.ReadLine());
            //Console.ReadKey();

            Console.WriteLine("Proporcione el primer operador: ");
            operacionAritmetica.Operando1 = Convert.ToDecimal(Console.ReadLine());
            //Console.ReadKey();

            Console.WriteLine("Proporcione el segundo operador: ");
            operacionAritmetica.Operando2 = Convert.ToDecimal(Console.ReadLine());
            //Console.ReadKey();

            resultadoOperacion = Operacion(operacionAritmetica);

            if (tipoOperacion.sumar == operacionAritmetica.Operacion)
            {
                Console.WriteLine($"El resultado de la suma es: {resultadoOperacion}");

            }
            else if (tipoOperacion.restar == operacionAritmetica.Operacion)
            {
                Console.WriteLine($"El resultado la resta es: {resultadoOperacion}");
            }
            if (tipoOperacion.multiplicar == operacionAritmetica.Operacion)
            {
                Console.WriteLine($"El resultado de la multiplicacion es: {resultadoOperacion}");
            }
            else if (tipoOperacion.dividir == operacionAritmetica.Operacion)
            {
                Console.WriteLine($"El resultado de la division es: {resultadoOperacion}");
            }
            if (tipoOperacion.modulo == operacionAritmetica.Operacion)
            {
                Console.WriteLine($"El resultado de la division es: {resultadoOperacion}");
            }
           
            Console.ReadKey();
        }
    }
}
