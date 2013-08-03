using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class Actividad
    {
        public Actividad() 
        { 
        
        }

	    public int codAct { get; set; }
	    public int corAct { get; set; }
        public int codEnt { get; set; }
        public int codPlaPro { get; set; }
	    public string desAct { get; set; }
	    public string feciniAct { get; set; }
	    public string fecfinAct { get; set; }
	    public string preAct { get; set; }
	    public string tipAct { get; set; }

    }
}