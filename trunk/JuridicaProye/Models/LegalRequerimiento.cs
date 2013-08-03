using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class LegalRequerimiento
    {
        public LegalRequerimiento()
        {
        }

        public int idReqLegal { get; set; }
        public int codPro { get; set; }
        public string nomPro { get; set; }
        public short idTipoReqLegal { get; set; }
        public int codUsuario { get; set; }
        public string cDescripcion { get; set; }
        public string dFechaRegistro { get; set; }
        public string dFechaAsignacion { get; set; }
        public string cPrioridadAtencion { get; set; } //char(3) --> 'ALT', 'MED', 'BAJ' (alta, media, baja)

        //Tipo Requerimiento
        public string cDescripcionTipo { get; set; }
        public bool bActivo { get; set; }

    }
}