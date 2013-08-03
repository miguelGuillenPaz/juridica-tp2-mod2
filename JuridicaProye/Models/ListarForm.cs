using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class ListarForm
    {

        public ListarForm() { }

        public IList<Cliente> ListadoClientesTipo1 { get; set; }

        public IList<Cliente> ListadoClientesTipo2 { get; set; }


        

    }
}