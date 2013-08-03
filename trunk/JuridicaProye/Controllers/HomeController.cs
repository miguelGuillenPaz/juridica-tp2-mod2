using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DemoMVC.Models;

namespace DemoMVC.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult Index2()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult Prueba()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult Listar()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            IList<Cliente> listadoClienteT1 = new List<Cliente>();
            listadoClienteT1.Add(new Cliente { IDCliente = 1, Nombre = "Karen", Edad = 20 });
            listadoClienteT1.Add(new Cliente { IDCliente = 2, Nombre = "Juan Jose", Edad = 21 });
            listadoClienteT1.Add(new Cliente { IDCliente = 3, Nombre = "Paola", Edad = 22 });


            IList<Cliente> listadoClienteT2 = new List<Cliente>();
            listadoClienteT2.Add(new Cliente { IDCliente = 1, Nombre = "KAREN", Edad = 20 });
            listadoClienteT2.Add(new Cliente { IDCliente = 2, Nombre = "JUAN JOSE", Edad = 21 });
            listadoClienteT2.Add(new Cliente { IDCliente = 3, Nombre = "PAOLA", Edad = 22 });

            ListarForm parametros = new ListarForm() ;
            parametros.ListadoClientesTipo1 = listadoClienteT1;
            parametros.ListadoClientesTipo2 = listadoClienteT2;

            return View(parametros);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
