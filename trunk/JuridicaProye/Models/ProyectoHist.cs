using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class ProyectoHist
    {

        public ProyectoHist() 
        { 
        
        }

	    public int codPro { get; set; }
	    public int codTipPro { get; set; }
	    public int codUbiDep { get; set; }
	    public int codFluCaj { get; set; }
	    public int codUbiProv { get; set; }
	    public int codUbiDist { get; set; }
	    public string nomPro { get; set; }
	    public string feciniplaPro { get; set; }
	    public string fecfinplaPro { get; set; }
	    public string fecinireaPro { get; set; }
	    public string fecfinreaPro { get; set; }
	    public int priPro { get; set; }
	    public string desPro { get; set; }
	    public string razsocfacPro { get; set; }
	    public string conpagPro { get; set; }
	    public string monfacPro { get; set; }
	    public int nrohojenvPro { get; set; }
	    public string fechojenvPro { get; set; }
	    public string estPro { get; set; }
	    public string rucfacPro { get; set; }
        public double presupuesto { get; set; }
        public string tipoProyecto { get; set; }
        public string nomUbiDep { get; set; }
        public string nomUbiDist { get; set; }
        public string nomUbiProv { get; set; }
    }
}