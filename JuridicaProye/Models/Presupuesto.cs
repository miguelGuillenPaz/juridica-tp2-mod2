using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class Presupuesto
    {
        public Presupuesto() 
        {
        }

	    public int codPre { get; set; }
	    public int codPro { get; set; }
	    public int codTipMon { get; set; }
	    public int verPre { get; set; }
	    public string fecPre { get; set; }
	    public double monPre { get; set; }
	    public double impPre { get; set; }
	    public string estPre { get; set; }
	    public int nroordejePre { get; set; }
        public double impconPre { get; set; }

    }
}