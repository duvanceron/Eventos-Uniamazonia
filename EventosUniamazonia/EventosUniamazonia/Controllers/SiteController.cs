using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EventosUniamazonia.Models;
using EventosUniamazonia.Conexion;
using System.Data;

namespace EventosUniamazonia.Controllers
{
    public class SiteController
    {
        public Connection connect;
        public siteModel site;
        public String answer;
        public DataTable dataSite;
        public SiteController()
        {
            connect = new Connection();
            site = new siteModel();
            dataSite = new DataTable();
        }

        public String addSite(String name, int capacity, String address)
        {
            site.nombre = name;
            site.capacidad = capacity;
            site.direccion = address;
            answer = connect.insertData(" INSERT INTO  sitio (nombre,capacidad,direccion) values('" + site.nombre + "','" + site.capacidad + "','" + site.direccion + "')");

            if (answer != null)
            {
                return answer;
            }

            return answer;

        }

        public DataTable SearchSite()
        {
            dataSite = connect.executeConsult("SELECT nombre,idSitio FROM sitio ORDER BY nombre ASC ;", CommandType.Text);
            return dataSite;
        }

        public DataTable SearchSite2(String site)
        {
            dataSite = connect.executeConsult(" SELECT nombre FROM sitio where nombre like'" + site + "%'", CommandType.Text);
            return dataSite;
        }
    }


}