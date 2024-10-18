using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entidades;


namespace Presentacion.Controllers
{
    public class AlumnosController : Controller
    {
        NAlumno _nAlumnos = new NAlumno();
        List<Estados> _listaEstado = new List<Estados>();
        List<EstatusAlumnos> _listaEstatus = new List<EstatusAlumnos>();
        // GET: Alumnos
        public ActionResult Index()
        {
            List<Alumnos> listaAlumnos = _nAlumnos.Consultar();
            return View(listaAlumnos);
        }

        // GET: Alumnos/Details/5
        public ActionResult Details(int id)
        {
            Alumnos objAlumnos = _nAlumnos.Consultar(id);
            return View(objAlumnos);
        }

        // GET: Alumnos/Create
        public ActionResult Create()
        {
            CargarViewBags();
            return View();
        }

        // POST: Alumnos/Create
        [HttpPost]
        public ActionResult Create(Alumnos alumno)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    // TODO: Add insert logic here
                    _nAlumnos.Agregar(alumno);
                    return RedirectToAction("Index");
                }

            }
            catch
            {  
            }
            CargarViewBags();
            return View();
        }

        // GET: Alumnos/Edit/5
        public ActionResult Edit(int id)
        {
            Alumnos objAlumno = _nAlumnos.Consultar(id);
            CargarViewBags();
            return View(objAlumno);
        }

        // POST: Alumnos/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Alumnos alumno)
        {
            try
            {
                if (ModelState.IsValid)
                {
                     // TODO: Add update logic here
                    _nAlumnos.Actualizar(alumno);
                    return RedirectToAction("Index");
                }
               
            }
            catch
            {
                
            }
            CargarViewBags();
            return View(alumno);
        }

        // GET: Alumnos/Delete/5
        public ActionResult Delete(int id)
        {
            Alumnos objAlumno = _nAlumnos.Consultar(id);
            return View(objAlumno);
        }

        // POST: Alumnos/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Alumnos alumno)
        {
            try
            {
                // TODO: Add delete logic here
                _nAlumnos.Eliminar(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public void CargarViewBags()
        {
            NEstatus NobjetoEstatus = new NEstatus();
            _listaEstatus = NobjetoEstatus.Consultar();
            NEstado NobjetoEstado = new NEstado();
            _listaEstado = NobjetoEstado.Consultar();
            ViewBag.Estados = new SelectList(_listaEstado, "id", "nombre");
            ViewBag.Estatus = new SelectList(_listaEstatus, "id", "nombre");
        }
    }
}
