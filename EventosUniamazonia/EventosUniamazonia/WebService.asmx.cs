using EventosUniamazonia.Controllers;
using EventosUniamazonia.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace EventosUniamazonia
{
    /// <summary>
    /// Descripción breve de WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        PersonController person = new PersonController();
       

        [WebMethod]
        public List<PersonModel> GetUser(int id)
        {
            return person.GetUser(id);
        }
    }
}
