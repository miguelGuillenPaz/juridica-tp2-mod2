using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Web.Mvc;
using System.Linq;
using DemoMVC.Models;

namespace DemoMVC.Controllers
{
    public class PersonaController : Controller
    {
        //
        // GET: /Persona/
        private GRH_Entities _entities;
        private readonly string[] _seleccione = new[] {"0", "--Seleccione--"};

        public ActionResult RegistrarPostulante(int? id)
        {
            _entities= new GRH_Entities();

            ViewData["EstadoCivil"] = EstadoCivil();
            ViewData["Pais"] = Pais();
            var persona = (from r in _entities.GRH_Persona where r.idPersona == id select r).FirstOrDefault();
            return View(persona);
        }

        private IEnumerable EstadoCivil()
        {
           
            var resultado = new List<SelectListItem>();

            var lista = (from r in _entities.GRH_EstadoCivil select r);

            resultado.Add(new SelectListItem
                {
                    Value = _seleccione[0],
                    Text = _seleccione[1]
                });

            foreach (var item in lista)
            {
                var selListItem = new SelectListItem { Value = item.idEstadoCivil.ToString(CultureInfo.InvariantCulture), Text = item.descripcion };
                resultado.Add(selListItem);
            }

            return resultado;
        }

        private IEnumerable Pais()
        {

            var resultado = new List<SelectListItem>();

            var lista = (from r in _entities.GRH_Pais select r);

            resultado.Add(new SelectListItem
            {
                Value = _seleccione[0],
                Text = _seleccione[1]
            });

            foreach (var item in lista)
            {
                var selListItem = new SelectListItem { Value = item.idPais.ToString(CultureInfo.InvariantCulture), Text = item.descripcion };
                resultado.Add(selListItem);
            }

            return resultado;
        }
    }
}
