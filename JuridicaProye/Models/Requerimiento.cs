using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class Requerimiento
    {
        public Requerimiento(){
   
    }

        public int idReq { get; set; }
        public Int16 idTipoRequerimiento { get; set; }
        public string descripcion { get; set; }
        public int idProyecto { get; set; }
        public string desProyecto { get; set; }
        public DateTime fecha { get; set; }
        public string idEstado { get; set; }
        public string desEstado { get; set; }
    }
}