using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventosUniamazonia.Models
{
    public class siteModel
    {
        public int idSitio { get; set; }
        public String nombre { get; set; }
        public int capacidad { get; set; }

        public String direccion { get; set; }
        public siteModel()
        {
        }
    }
}