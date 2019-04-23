using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventosUniamazonia.Models
{
    public class EventModel
    {
        public String name { get; set; }
        public String horario { get; set; }
        public String director { get; set; }
        public String tema { get; set; }
        public String fecha { get; set; }
        public String fechaFin { get; set; }
        public String foto { get; set; }
        public EventModel()
        {
        }

    }
}