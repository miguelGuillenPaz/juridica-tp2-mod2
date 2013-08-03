using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class EstimadoRapidoForm
    {
        public EstimadoRapidoForm() { }

        public IList<TipoProyecto> ListadoTipoProyecto { get; set; }

        public IList<Ubigeo> ListadoUbigeoDep { get; set; }

        public IList<Ubigeo> ListadoUbigeoProv { get; set; }

        public IList<Ubigeo> ListadoUbigeoDist { get; set; }

        public IList<ActividadHist> ListadoActividadHist { get; set; }

        public IList<ProyectoHist> ListadoProyectoHist { get; set; }

    }
}