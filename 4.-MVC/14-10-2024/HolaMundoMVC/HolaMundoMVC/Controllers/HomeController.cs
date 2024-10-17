using HolaMundoMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HolaMundoMVC.Controllers
{
    public class HomeController : Controller
    {
        List<Estado> _listaEstados = new List<Estado>
            {
               new Estado(1, "Puebla"),
               new Estado(2, "Campeche")
            };
        public ActionResult Index() //Métodos de acción
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.Saludo = "Hola, sean bienvenidos";
            ViewData["Mensaje"] = "Este es un objeto de tipo Diccionario";

            ViewBag.ListaEstados = _listaEstados;
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}