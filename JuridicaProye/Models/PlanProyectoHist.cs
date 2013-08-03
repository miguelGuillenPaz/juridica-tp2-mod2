using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class PlanProyectoHist
    {

        public PlanProyectoHist() 
        { 
        
        }

	    public int codPro { get; set; }
	    public int codEnt { get; set; }
	    public int codFluCaj { get; set; }
	    public string desPlaPro { get; set; }
        public int codPlaPro { get; set; }

    }
}