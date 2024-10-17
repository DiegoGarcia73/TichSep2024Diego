using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entities;
using Data;
using BusinessLogic;
using System.Threading.Tasks;
using MVC_Razor_ADO.Models;
using Newtonsoft.Json;

namespace MVC_Razor_ADO.Controllers
{

    public class AlumnosController : Controller
    {
        NAlumno _nAlumno = new NAlumno();
        NEstado _nEstado = new NEstado();
        NEstatusAlumno _nEstatusAlumno = new NEstatusAlumno();
       
        public static List<Estado> _listaEstados = new List<Estado>(); //Para usar en Linq
        public static List<Alumno> _listaAlumnos = new List<Alumno>(); //Para usar en Linq
        public static List<EstatusAlumno> _listaEstatus = new List<EstatusAlumno>(); //Para Usar en Linq

        public ActionResult Index()
        {
           
            _listaAlumnos = _nAlumno.Consultar();
            _listaEstados = _nEstado.Consultar();
            _listaEstatus = _nEstatusAlumno.Consultar();

            //Uso de Linq
            var innerTablas = (from Alumno in _listaAlumnos
                               join Estado in _listaEstados
                               on Alumno.idEstadoOrigen equals Estado.id
                               join Estatus in _listaEstatus
                               on Alumno.idEstatus equals Estatus.id
                               select new
                               {
                                   Alumno.id,
                                   Alumno.nombre,
                                   Alumno.primerApellido,
                                   Alumno.segundoApellido,
                                   Alumno.fechaNacimiento,
                                   Alumno.correo,
                                   Alumno.telefono,
                                   Alumno.curp,
                                   Alumno.sueldo,
                                   nombreEstado = Estado.nombre,
                                   nombreEstatus = Estatus.nombre
                               }).ToList();
            string json = JsonConvert.SerializeObject(innerTablas);
            List<EstadoEstatus> olistaA = JsonConvert.DeserializeObject<List<EstadoEstatus>>(json);

            return View(olistaA);


        }
        public ActionResult Details(int id)
        {
            EstadoEstatus oNombreEstEsta = ConsultarEstadoEstatus(id);
         
            return View(oNombreEstEsta);
        }
       

        //Delete método GET por defecto
        public ActionResult Delete(int id)
        {

            EstadoEstatus oEstEstElim = ConsultarEstadoEstatus(id);
    
            return View(oEstEstElim);
        }


        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {

            _nAlumno.Eliminar(id);
            return RedirectToAction("Index");
        }

        public ActionResult Create()
        {

            ViewBag.Estado = new SelectList(_nEstado.Consultar(), "Id", "Nombre");
            ViewBag.Estatus = new SelectList(_nEstatusAlumno.Consultar(), "Id", "Nombre");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Alumno objAlumno)
        {

            _nAlumno.Agregar(objAlumno);

            return RedirectToAction("Index");
        }

        public ActionResult Edit(int id)
        {

            Alumno objAlumno = _nAlumno.Consultar(id);
            ViewBag.Estado = new SelectList(_nEstado.Consultar(), "id", "nombre", objAlumno.idEstadoOrigen);
            ViewBag.Estatus = new SelectList(_nEstatusAlumno.Consultar(), "id", "nombre", objAlumno.idEstatus);

            return View(objAlumno);
        }

        [HttpPost]
        public ActionResult Edit(Alumno objAlumno)
        {

            _nAlumno.Actualizar(objAlumno);
            return RedirectToAction("Index");

        }
        private EstadoEstatus ConsultarEstadoEstatus(int id)
        {
            Alumno oAlumno = new Alumno();
            oAlumno = _nAlumno.Consultar(id);
            string json = JsonConvert.SerializeObject(oAlumno);
            EstadoEstatus oAlumnoEstEsta = JsonConvert.DeserializeObject<EstadoEstatus>(json);

            List<Estado> olistaEstado = new List<Estado>();
            olistaEstado = _nEstado.Consultar();
            Estado oEstado = olistaEstado.Find(x => x.id == oAlumno.idEstadoOrigen);
            oAlumnoEstEsta.nombreEstado = oEstado.nombre;

            List<EstatusAlumno> olistaEstatus = new List<EstatusAlumno>();
            olistaEstatus = _nEstatusAlumno.Consultar();
            EstatusAlumno oEstatusAlumno = olistaEstatus.Find(x => x.id == oAlumno.idEstatus);
            oAlumnoEstEsta.nombreEstatus = oEstatusAlumno.nombre;

            //Se invoca al método consultar, se busca un elemento que coincida
            //oAlumnoEstEsta.nombreEstado = _nEstado.Consultar().Find(x => x.id == oAlumno.idEstadoOrigen).nombre;

            return oAlumnoEstEsta;
        }
    }
}