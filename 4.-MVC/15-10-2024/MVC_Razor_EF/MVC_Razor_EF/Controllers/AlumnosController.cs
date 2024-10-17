using MVC_Razor_EF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_Razor_EF.Controllers
{
    public class AlumnosController : Controller
    {
        InstitutoTich _DBContext = new InstitutoTich();
        List<Alumnos> _listaAlumnos = new List<Alumnos>();
        Alumnos oAlumno = new Alumnos();
        
        
        // GET: Alumnos
        public ActionResult Index()
        {
            //Desactivando carga perezosa, solo traerá los datos de tabla solicitada
            _DBContext.Configuration.LazyLoadingEnabled = false;

            _listaAlumnos = _DBContext.Alumnos.Include("EstatusAlumnos").ToList();
            _listaAlumnos = _DBContext.Alumnos.Include("Estados").ToList();

            return View(_listaAlumnos);
        }

        // GET: Alumnos/Details/5
        public ActionResult Details(int id)
        {
            _DBContext.Configuration.LazyLoadingEnabled = false;  
            oAlumno = _DBContext.Alumnos.Include("Estados").Where(x=> x.id == id).FirstOrDefault();
            oAlumno = _DBContext.Alumnos.Include("EstatusAlumnos").Where(z => z.id == id).FirstOrDefault();
            return View(oAlumno);
        }

        // GET: Alumnos/Create
        public ActionResult Create()
        {
            ViewBag.Estados = new SelectList(_DBContext.Estados,"id", "nombre");
            ViewBag.Estatus = new SelectList(_DBContext.EstatusAlumnos, "id", "nombre");
            return View();
        }

        // POST: Alumnos/Create
        [HttpPost]
        public ActionResult Create(Alumnos alumno)
        {
            try
            {
                // TODO: Add insert logic here
                _DBContext.Alumnos.Add(alumno);
                _DBContext.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Alumnos/Edit/5
        public ActionResult Edit(int id)
        {
            Alumnos objAlumno = _DBContext.Alumnos.Find(id);
            ViewBag.Estados = new SelectList(_DBContext.Estados, "id", "nombre");
            ViewBag.Estatus = new SelectList(_DBContext.EstatusAlumnos, "id", "nombre");
            return View(objAlumno);
        }

        // POST: Alumnos/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Alumnos alumno)
        {
            try
            {
                // TODO: Add update logic here
                _DBContext.Entry(alumno).State = EntityState.Modified;
                _DBContext.SaveChanges();


                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Alumnos/Delete/5
        public ActionResult Delete(int id)
        {
            _DBContext.Configuration.LazyLoadingEnabled = false;
            oAlumno = _DBContext.Alumnos.Include("Estados").Where(x=>x.id == id).FirstOrDefault();
            oAlumno = _DBContext.Alumnos.Include("EstatusAlumnos").Where(x => x.id == id).FirstOrDefault();
            return View(oAlumno);
        }

        // POST: Alumnos/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Alumnos alumno)
        {
            try
            {
                // TODO: Add delete logic here
                alumno = _DBContext.Alumnos.Find(id);
                _DBContext.Alumnos.Remove(alumno);
                _DBContext.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
