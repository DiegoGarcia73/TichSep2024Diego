using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Negocio;
using Entidades;

namespace Presentacion.Controllers
{
    public class EstatusAlumnosController : Controller
    {
        // GET: EstatusAlumnos
        NEstatusAlumnos _estatusAlumnos = new NEstatusAlumnos();
        public ActionResult Index()
        {
            List<EstatusAlumnos> estatus = _estatusAlumnos.Consultar();
            return View(estatus);
        }

        // GET: EstatusAlumnos/Details/5
        public ActionResult Details(int id)
        {
            EstatusAlumnos estatus = _estatusAlumnos.Consultar(id);
            return View(estatus);
        }

        // GET: EstatusAlumnos/Create
        public ActionResult Create()
        {
            
            return View();
        }

        // POST: EstatusAlumnos/Create
        [HttpPost]
        public ActionResult Create(EstatusAlumnos estatus)
        {
            try
            {
                // TODO: Add insert logic here
                _estatusAlumnos.Agregar(estatus);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: EstatusAlumnos/Edit/5
        public ActionResult Edit(int id)
        {
            EstatusAlumnos estatus = _estatusAlumnos.Consultar(id);
            return View(estatus);
        }

        // POST: EstatusAlumnos/Edit/5
        [HttpPost]
        public ActionResult Edit(EstatusAlumnos estatus)
        {
            try
            {
                // TODO: Add update logic here
                _estatusAlumnos.Actualizar(estatus);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: EstatusAlumnos/Delete/5
        public ActionResult Delete(int id)
        {
            EstatusAlumnos estatus = _estatusAlumnos.Consultar(id);
            return View(estatus);
        }

        // POST: EstatusAlumnos/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                _estatusAlumnos.Eliminar(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
