using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class Entregable
    {

        public Entregable() 
        { 
        
        }

	    public int codEnt { get; set; }
	    public int codPro { get; set; }
	    public string nomEnt { get; set; }
        public string desEnt { get; set; }

    }
}