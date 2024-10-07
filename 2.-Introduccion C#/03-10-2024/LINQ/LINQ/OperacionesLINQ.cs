using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Newtonsoft.Json;
using Microsoft.SqlServer.Server;
using System.Web;
using System.Timers;
using System.Diagnostics;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;


namespace LINQ
{
    internal class OperacionesLINQ
    {
        public static List<Alumno> _listaAlumnos = new List<Alumno>();
        public static List<Estado> _listaEstados = new List<Estado>();
        public static List<Estatus> _listaEstatus = new List<Estatus>();
        public static List<ItemISR> _listItemISR = new List<ItemISR>();

        public static void CargarLists()
        {
            //CARGANDO LOS ARCHIVOS DESDE SU UBICACIÓN PARA DESERIALIZARLOS
            using (StreamReader alumnos = new StreamReader(@"C:\Users\DIEGO\Documents\Bootcamp_TICH_SEP_2024\C_Sharp_POO\Semana_2\03-10-2024\Alumnos.json"))
            {
                string json = alumnos.ReadToEnd(); //Declarando variable Json para almacenar la lectura de línea por línea
                _listaAlumnos = JsonConvert.DeserializeObject<List<Alumno>>(json); //Aquí se deserializa la lista Alumnos 
            }
            using (StreamReader estados = new StreamReader(@"C:\Users\DIEGO\Documents\Bootcamp_TICH_SEP_2024\C_Sharp_POO\Semana_2\03-10-2024\Estados.json"))
            {
                string json = estados.ReadToEnd();
                _listaEstados = JsonConvert.DeserializeObject<List<Estado>>(json);
            }
            using (StreamReader estatus = new StreamReader(@"C:\Users\DIEGO\Documents\Bootcamp_TICH_SEP_2024\C_Sharp_POO\Semana_2\03-10-2024\Estatus.json"))
            {
                string json = estatus.ReadToEnd();
                _listaEstatus = JsonConvert.DeserializeObject<List<Estatus>>(json);
            }
            using (StreamReader TablaISR = new StreamReader(@"C:\Users\DIEGO\Documents\Bootcamp_TICH_SEP_2024\C_Sharp_POO\Semana_2\03-10-2024\tablaSR.csv"))
            {
                string Lectura;
                while ((Lectura = TablaISR.ReadLine()) != null)
                {
                    ItemISR itemISR = new ItemISR();
                    string[] campos = Lectura.Split(',');
                    itemISR.LimInf = Convert.ToDecimal(campos[1]);
                    itemISR.LimSup = Convert.ToDecimal(campos[2]);
                    itemISR.CuotaFija = Convert.ToDecimal(campos[3]);
                    itemISR.PorExced = Convert.ToDecimal(campos[4]);
                    itemISR.Subsidio = Convert.ToDecimal(campos[5]);
                    _listItemISR.Add(itemISR);
                }
            }
        }
        public static void Consultas()
        {
            //De la lista estados, obtener el estado que tiene el id 5
            Estado estado = _listaEstados.Find(x => x.id == 5);
            Console.WriteLine($"El estado con el id: {estado.id} es {estado.nombre}");

            //De la lista alumnos obtener los alumnos cuyo idEstado 29 y 13, ordenado por nombre
            var _idAluEstado = _listaAlumnos
                 .Where(alu => alu.idEstado == 29 || alu.idEstado == 13)
                 .OrderBy(alu => alu.nombre);

            foreach (var i in _idAluEstado)
            {
                Console.WriteLine("-------------------------------------");
                Console.WriteLine("Alumnos que son 29 y 13 en estado y están ordenados por nombre");
                Console.WriteLine($"id: {i.id}, nombre: {i.nombre}, estado: {i.idEstado}");
            }

            /*De la lista alumnos obtener los alumnos que son IdEstado 19 y 20 y además que estén en
            el estatus 4 o 5 */
            var idAluEs = _listaAlumnos
                .Where(a => (a.idEstado == 19 || a.idEstado == 20) && (a.idEstatus == 4 || a.idEstatus == 5));

            foreach (var i in idAluEs)
            {
                Console.WriteLine("-------------------------------------");
                Console.WriteLine("Alumnos que son 19 y 20 en estado y el estatus es 4 o 5");
                Console.WriteLine($"id: {i.id}, nombre: {i.nombre}, estado: {i.idEstado}, estatus: {i.idEstatus}");
            }

            /*Obtener una lista de los alumnos que tienen calificación aprobatoria, considerando esta 
             como 6 o mayor, ordenado por calificación del mayor al menor  */
            Console.WriteLine("-------------------------------------");
            Console.WriteLine("Alumnos con calificación mayor a 6, ordenados del mayor al menor");

            var alumnosAprobados = _listaAlumnos
            .Where(aluCalif => aluCalif.calificacion >= 6)
            .OrderByDescending(aluCalif => aluCalif.calificacion);

            foreach (var item in alumnosAprobados)
            {
                Console.WriteLine($"id: {item.id} nombre: {item.nombre}, calificacion: {item.calificacion}");
            }

            /* Obtener la calificación promedio de los alumnos */
            Console.WriteLine("-----------------------------------------");
            var promedioCalif = _listaAlumnos.Average(x => x.calificacion);
            Console.WriteLine($"La calificación promedio es: {promedioCalif}");

            /* En caso de que ningún alumno tenga 10, sumarles un punto de calificación, y en caso de
               que todos estén entre 6 y 7 sumarles dos puntos. */
            bool cal10 = _listaAlumnos.Any(x => x.calificacion == 10);
            Console.WriteLine("----------------------------------------------");
            if (!cal10)
            {
                Console.WriteLine("----------------------------------------------");
                _listaAlumnos.ForEach(x => x.calificacion += 1);
                Console.WriteLine("Si nadie tiene 10 se suma un punto a todos");
            }
            else Console.WriteLine("No se cumplió el primer criterio");

            bool cal6o7 = _listaAlumnos.All(x => x.calificacion == 6 || x.calificacion == 7);
            if (cal6o7)
            {
                Console.WriteLine("------------------------------------------------");
                _listaAlumnos.ForEach(x => x.calificacion = x.calificacion + 2);
                Console.WriteLine("Se sumaron 2 puntos a todos los alumnos");
            }
            else Console.WriteLine("No se cumplió el segundo criterio");

            /* Mostrar en la consola los siguientes datos, de aquellos alumnos que estén en estatus 3:
            • idAlumnos
            • nombreAlumno
            • nombre del Estado al que pertenece */
            var innerestatus3 = from Alumno in _listaAlumnos
                                join Estado in _listaEstados
                                on Alumno.idEstado equals Estado.id
                                where Alumno.idEstatus == 3
                                select new
                                {
                                    idAlumno = Alumno.id,
                                    nombreAlumno = Alumno.nombre,
                                    nombreDelEstado = Estado.nombre
                                };
            Console.WriteLine("--------------------------------------------");

            foreach (var item in innerestatus3)
            {
                Console.WriteLine($"id: {item.idAlumno}, nombre: {item.nombreAlumno}, estado: {item.nombreDelEstado}");
            }

            /* Mostrar en la consola los siguientes datos, de aquellos alumnos que estén en estatus 2, 
             ordenado por nombre del Alumno:
            • idAlumnos,
            • nombreAlumno,
            • nombre del Estatus en que se encuentran */

            var innerestatus2 = from Alumno in _listaAlumnos
                                join Estatus in _listaEstatus
                                on Alumno.idEstatus equals Estatus.id
                                where Alumno.idEstatus == 2
                                orderby Alumno.nombre
                                select new
                                {   idAlumno = Alumno.id,
                                    nombreAlumno = Alumno.nombre,
                                    nombreEstatus = Estatus.nombre
                                };
            Console.WriteLine("---------------------------------------------");

            foreach (var i in innerestatus2)
            {
                Console.WriteLine($"id: {i.idAlumno}, nombre: {i.nombreAlumno}, estatus: {i.nombreEstatus}");
            }
            Console.WriteLine("Parece ser que no hay alumnos con estatus 2, que es en curso propedéutico");

            /* Mostrar en la consola los siguientes datos, de aquellos alumnos cuyo estatus sea mayor 
             a 2, ordenado por nombre del estatus:
             • idAlumnos,
             • nombreAlumno,
             • nombre del Estado al que pertenece
             • nombre del Estatus en que se encuentran */
            var innerestmayor2 = from Alumno in _listaAlumnos
                                 join Estado in _listaEstados
                                 on Alumno.idEstado equals Estado.id
                                 join Estatus in _listaEstatus
                                 on Alumno.idEstatus equals Estatus.id
                                 select new
                                 {   idAlumno = Alumno.id,
                                     nombreAlumno = Alumno.nombre,
                                     nombreEstado = Estado.nombre,
                                     nombreEstatus = Estatus.nombre
                                 };           
            
            Console.WriteLine("------------------------------------------------");
            Console.WriteLine("Alumnos con estatus mayor a 2");
            foreach (var item in innerestmayor2)
            {
                Console.WriteLine($"id: {item.idAlumno}, nombreAlumno: {item.nombreAlumno}, estado: {item.nombreEstado}, {item.nombreEstatus}");
            }

            /*Calcular el impuesto para un sueldo mensual de 22,000, y mostrarlo en la consola:
             •La búsqueda en la tablaISR de los parámetros correspondientes para el cálculo del ISR 
              deben de ser a través de LINQ */
            decimal sueldoMensual = 22000 / 2;
            decimal impuesto = 0;
            Console.WriteLine("--------------------------------------------------");
            //var itemISR = _listItemISR.FirstOrDefault(t => sueldoMensual > t.LimInf && sueldoMensual <= t.LimSup);
            foreach (var rango in _listItemISR)
            {
                
                if (sueldoMensual >= rango.LimInf && sueldoMensual <= rango.LimSup)
                {
                    decimal excedente = sueldoMensual - rango.LimInf;

                    impuesto = (excedente * rango.PorExced / 100) + rango.CuotaFija - rango.Subsidio;

                    Console.WriteLine($"El impuesto para el sueldo mensual especificado es: {impuesto:C2}");
                 
                }
            }
        }
    }
}
