using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventosUniamazonia.Models
{
    public class PersonModel
    {
        public int identification { get; set; }
        public String name1 { get; set; }
        public String name2 { get; set; }
        public String lastname1 { get; set; }
        public String lastname2 { get; set; }
        public String username { get; set; }
        public String password { get; set; }
        public String theme { get; set; }
        public String email { get; set; }

        public PersonModel()
        {

        }
    }
}