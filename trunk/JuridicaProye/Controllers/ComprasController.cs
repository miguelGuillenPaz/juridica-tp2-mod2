using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using appGYM.Models;

namespace appGYM.Controllers
{
    public class ComprasController : Controller
    {
        //
        // GET: /Compras/

        // -----------------------
        // PLAN DE ABASTECIMIENTO
        // -----------------------

        // call "mainPlanAba"
        public ActionResult mainPlanAba()
        {
           // var data = new facade();
            //ViewData["listaPlan"] = data.listarPlan();
            return View();
        }

        // call "infoPlanAba"
        public ActionResult infoPlanAba()
        {
            return View();
        }

        // -----------------------
        // SOLICITUD DE AQUISICION
        // -----------------------

        // call "mainSolAdq"
        public ActionResult mainSolAdq()
        {
            return View();
        }

        // call "mainItemsSolAdq"
        public ActionResult mainItemsSolAdq()
        {
            return View();
        }

        // call "infoItemSolAdq"
        public ActionResult infoItemSolAdq()
        {
            return View();
        }



    }
}
