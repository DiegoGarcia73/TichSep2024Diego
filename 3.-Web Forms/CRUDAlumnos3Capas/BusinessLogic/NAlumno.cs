using Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using Data;
using Newtonsoft.Json;
using Microsoft.SqlServer.Server;

namespace BusinessLogic
{
    public class NAlumno
    {
        DAlumno _DAlumno = new DAlumno();
        public List<Alumno> Consultar()
        {
            List <Alumno> listaAlumno = _DAlumno.Consultar();
            return listaAlumno;

        }
        public Alumno Consultar(int id)
        {
           Alumno oAlumno = _DAlumno.Consultar(id);
           return oAlumno;
        }
        public void Agregar(Alumno alumno)
        {
            _DAlumno.Agregar(alumno);
        }
        public void Actualizar(Alumno alumno)
        {
            _DAlumno.Actualizar(alumno);
        }
        public void Eliminar(int id)
        {
            _DAlumno.Eliminar(id);
        }

        public ItemTablaISR CalcularISR(int id)
        {
            ItemTablaISR oitemTablaISR = new ItemTablaISR();
            try
            {
                RefWSAlumnos.WSAlumnosSoapClient oWSASMX = new RefWSAlumnos.WSAlumnosSoapClient();
                RefWSAlumnos.ItemTablaISR oRefWISR = oWSASMX.CalcularISR(id);
                string json = JsonConvert.SerializeObject(oRefWISR);
                oitemTablaISR = JsonConvert.DeserializeObject<ItemTablaISR>(json);          
            }
            catch (Exception e)
            {
                Alumno oAlumno = _DAlumno.Consultar(id);
             

                decimal sueldoQuincenal = oAlumno.sueldo / 2;

                List<ItemTablaISR> listaISR = new List<ItemTablaISR>();
                listaISR = _DAlumno.ConsultarTablaISR();

                oitemTablaISR = (from ItemTablaISR in listaISR
                                 where sueldoQuincenal >= ItemTablaISR.LimiteInferior && sueldoQuincenal <= ItemTablaISR.LimiteSuperior
                                 select ItemTablaISR).ToList()[0];

                decimal excedente = sueldoQuincenal - oitemTablaISR.LimiteInferior;

                oitemTablaISR.ISR = (excedente * oitemTablaISR.Excedente / 100) + oitemTablaISR.CuotaFija - oitemTablaISR.Subsidio;

              
            }
            return oitemTablaISR;

        }

        decimal UMA = Convert.ToDecimal(ConfigurationManager.AppSettings["UMA"]);
        public AportacionesIMSS CalcularIMSS(int id)
        {
            AportacionesIMSS oAportacionesIMSS = new AportacionesIMSS();
            try
            {
                RefWSAlumnos.WSAlumnosSoapClient oWSAlumnos = new RefWSAlumnos.WSAlumnosSoapClient();
                RefWSAlumnos.AportacionesIMSS oIMSS = oWSAlumnos.CalcularIMSS(id);
                string json = JsonConvert.SerializeObject(oIMSS);
                oAportacionesIMSS = JsonConvert.DeserializeObject<AportacionesIMSS>(json);
            }
            catch (Exception e)
            {
                Alumno oAlumno = _DAlumno.Consultar(id);
                decimal sueldoMensual = oAlumno.sueldo;

                oAportacionesIMSS.EnfermedadMaternidad = (sueldoMensual - (UMA * 3)) * 0.004m;
                oAportacionesIMSS.InvalidezVida = sueldoMensual * 0.00625m;
                oAportacionesIMSS.Retiro = sueldoMensual * 0.00m;
                oAportacionesIMSS.Cesantia = sueldoMensual * 0.01125m;
            }

            return oAportacionesIMSS;
        }
    }
}
 