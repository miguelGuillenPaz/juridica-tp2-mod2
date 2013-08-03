using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoMVC.Controllers
{
    public class GestionProyController : Controller
    {
        //
        // GET: /GestionProy/

        public ActionResult Index()
        {
            return View();
        }

        // Muestra Proyectos
        public ActionResult Gestion()
        {
            return View();
        }

        //Muestra Presupuesto
        [HttpPost]
        public ActionResult Gestion(string returnUrl)
        {
            return RedirectToAction("Presupuesto", "GestionProy");
        }

        //Muestra Modificación de Presupuesto
        public ActionResult Presupuesto()
        {
            return View();
        }

        //Post
        [HttpPost]
        public ActionResult Presupuesto(string returnUrl)
        {
            return RedirectToAction("ModPresupuesto", "GestionProy");
        }

        //Listado de detalle de Presupuesto
        public ActionResult ModPresupuesto()
        {
            return View();
        }

    }
}
