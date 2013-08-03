using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoMVC.Controllers
{
    //[HandleError]
    public class FinanzasController : Controller
    {
        //
        // GET: /Finanzas/

        //crear instancia del entity model (Base de datos
        //ModuloFinanciero.Models.PresupuestoEntities DB = new ModuloFinanciero.Models.PresupuestoEntities();

        public ActionResult Index()
        {
            //ViewData["Message"] = "Asignación de recursos";

            //var presupuesto = DB.Presupuesto;
            //return View(presupuesto.ToList());

            return View();

        }

     }
}
