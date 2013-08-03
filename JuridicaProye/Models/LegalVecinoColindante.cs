using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class LegalVecinoColindante
    {
        public LegalVecinoColindante()
        {
        }

        public int idReqLegal { get; set; }
        public int idVecino { get; set; }
        public string cNombres { get; set; }
        public string cDni { get; set; }
        public string cApellidos { get; set; }
        public string cTipoEdificacion { get; set; } //char(3) --> 'CAS', 'CON' (casa, condominio)
        public string cNombreCondominio { get; set; }
        public string cDireccion { get; set; }
        public int codUbiDep { get; set; }
        public int codUbiProv { get; set; }
        public int codUbiDist { get; set; }
        public bool bVisitado { get; set; }
        public string dFechaVisita { get; set; }

        //Carta Notarial
        public string dFechaRecepcion { get; set; }
        public string dFechaRespuesta { get; set; }

    }
}