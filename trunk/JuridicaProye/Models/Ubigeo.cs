using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoMVC.Models
{
    public class Ubigeo
    {

        public Ubigeo() 
        { 
        
        }

        public int codUbigeo { get; set; }
        public int codUbiProv { get; set; }
        public int codUbiDist { get; set; }
        public int codUbiDep { get; set; }
        public string nomUbiDep { get; set; }
        public string nomUbiProv { get; set; }
        public string nomUbiDist { get; set; }
        public string codposUbi { get; set; }
        public string selected { get; set; }

    }
}