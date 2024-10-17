using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RazorMVC.Models;

namespace RazorMVC.Controllers
{
    public class RazorController : Controller
    {
        // GET: Razor
        public ActionResult Index()
        {
 
            return View();
        }

        public ActionResult Sintaxis()
        {
            ViewBag.Encabezado = "Iniciando con Razor";
            ViewData["EncabezadoVD"] = "Iniciando con Razor VD";
            return View();
        }

        public ActionResult LogicaBucles()
        {
            return View();
        }
        public ActionResult GetPost()
        {
            return View();
        }
        public ActionResult Calculadora()
        {
            return View();
        }
        public ActionResult AccesaModelo()
        {
            Alumno mAlumno = NAlumno.Consultar(3)[0];
            return View(mAlumno);
        }
        public ActionResult AccesaObjeto()
        {
            return View();
        }
        public ActionResult AccesaListaObjetos()
        {
            List<Alumno> lstAlumnos = NAlumno.Consultar(-1);
            return View(lstAlumnos);
        }
        //public ActionResult RecibeParametro(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    ViewBag.id = id;
        //    return View();
        //}
        public ActionResult RecibeParametroID(int? id)
        {
            ViewBag.id = id ?? 1;
            return View();
        }
        //https://localhost:44346/Razor/RecibeParametro/3/Jorge
        //https://localhost:44346/Razor/RecibeParametro/3?nombre=Jorge
        //https://localhost:44346/Razor/RecibeParametro?id=3&nombre=Jorge
        //https://localhost:44346/Razor/RecibeParametro?nombre=Jorge&id=3

        public ActionResult RecibeParametros(int? id, String nombre)
        {
            if (id == null || nombre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.id = id;
            ViewBag.nombre = nombre;
            return View();
        }

        public ActionResult RecibeEdad(int? id, String nombre, int edad)
        {
            if (id == null || nombre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.id = id;
            ViewBag.nombre = nombre;
            ViewBag.edad = edad;
            return View();
        }
        public ActionResult Formulario()
        {
            Alumno mAlumno = NAlumno.Consultar(3)[0];
            List<Estado> lstEstados = NAlumno.ConsultarEstados(-1);
            ViewBag.estados = lstEstados;
            return View(mAlumno);
        }
   
        public ActionResult Helpers()
        {
            Alumno oAlumnos = new Alumno { id = 1, nombre = "Antonio", idEstado = 1, idEstatus=1,activo=true};
            List<Estado> lstEstados = new List<Estado>
            {
                new Estado {id=1, nombre="Aguascalientes"},
                new Estado {id=2, nombre="Baja California"},
                new Estado {id=3, nombre="Baja California Sur"},
                new Estado {id=4, nombre="Campeche"}

            };
            List<Estatus> lstEstatus = new List<Estatus>
            {
                new Estatus {id=1, nombre="Prospecto"},
                new Estatus {id=2, nombre="En Capacitación"},
                new Estatus {id=3, nombre="En Inserción"}
            };
            ViewBag.idEstado = new SelectList(lstEstados, "id", "nombre");
            ViewBag.Estado = lstEstados;
            ViewData["Estatus"] = lstEstatus;
            return View(oAlumnos);
        }
        public ActionResult Estilos()
        {
            List<Alumno> lstAlumnos = NAlumno.Consultar(-1);
            return View(lstAlumnos);
        }
    }
}