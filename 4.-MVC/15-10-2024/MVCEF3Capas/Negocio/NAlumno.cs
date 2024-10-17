using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Configuration;
using Negocio.WCFAlumno;

namespace Negocio
{
   
    public class NAlumno
    {
        //WCFAlumno.WCFAlumnosClient oWCFAlumno = new WCFAlumno.WCFAlumnosClient();
        InstitutoTich _DBContext = new InstitutoTich();
        List<Alumnos> _listaAlumnos = new List<Alumnos>();
        Alumnos oAlumno = new Alumnos();
        public List<Alumnos> Consultar()
        {
            _DBContext.Configuration.LazyLoadingEnabled = false;
            _listaAlumnos = _DBContext.Alumnos.Include("Estados").ToList();
            _listaAlumnos = _DBContext.Alumnos.Include("EstatusAlumnos").ToList();

            return _listaAlumnos;
        }
       
        public Alumnos Consultar(int id)
        {
            _DBContext.Configuration.LazyLoadingEnabled=false;
            oAlumno = _DBContext.Alumnos.Include("Estados").Where(x => x.id == id).FirstOrDefault();
            oAlumno = _DBContext.Alumnos.Include("EstatusAlumnos").Where(x=>x.id == id).FirstOrDefault();
            return oAlumno;
        }
        public void Agregar (Alumnos alumno)
        {
            _DBContext.Alumnos.Add(alumno);
            _DBContext.SaveChanges();
        }
        public void Actualizar (Alumnos alumno)
        {
            _DBContext.Entry(alumno).State = System.Data.Entity.EntityState.Modified;
            _DBContext.SaveChanges();
        }
        public void Eliminar (int id)
        {
            oAlumno = _DBContext.Alumnos.Find(id);
            _DBContext.Alumnos.Remove(oAlumno);
            _DBContext.SaveChanges();

        }
        decimal UMA = Convert.ToDecimal(ConfigurationManager.AppSettings["UMA"]);
        public AportacionesIMSS CalcularIMSS(int id)
        {
            WCFAlumno.WCFAlumnosClient oServoWCFIMSS = new WCFAlumno.WCFAlumnosClient();
            AportacionesIMSS objIMSS = oServoWCFIMSS.CalcularIMSS(id);
            return objIMSS;

        }
        public ItemTablaISR CalcularISR(int id)
        {
            WCFAlumno.WCFAlumnosClient oServWFISR = new WCFAlumno.WCFAlumnosClient();
            ItemTablaISR objISR = oServWFISR.CalcularISR(id);
            return objISR;
        }
    }
}
