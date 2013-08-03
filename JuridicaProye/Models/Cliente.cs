using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class Cliente
    {

        public Cliente() 
        {
        
        }
        
        public int IDCliente { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }


    }
}