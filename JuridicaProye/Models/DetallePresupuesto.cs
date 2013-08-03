using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class DetallePresupuesto
    {

        public DetallePresupuesto() 
        { 
        
        }

	    public int codDetPre { get; set; }
        public int codPre { get; set; }	    
	    public string desDetPre { get; set; }
	    public double porDetPre { get; set; }
        public double valDetPre { get; set; }	    
        public int codVarPre { get; set; }

    }
}