using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EventosUniamazonia.Conexion;
using EventosUniamazonia.Models;
using System.Data;
using EventosUniamazonia.Views.Events;

namespace EventosUniamazonia.Controllers
{
    public class EventController
    {
        EventModel evento;
        Connection connect;
        SiteController site;
        String answer;
        DataTable result;



        public EventController()
        {
            evento = new EventModel();
            connect = new Connection();
            site = new SiteController();
            result = new DataTable();


        }

        public String addEvent(string name, string schedule, String date, String dateEnd, String director, String theme, Dictionary<int, String> sitesDictionary, String idUser)
        {
            evento.name = name;
            evento.horario = schedule;
            evento.director = director;
            evento.tema = theme;
            evento.fecha = date;
            evento.fechaFin = dateEnd;
            answer = connect.insertData("INSERT INTO evento (nombre,horario,fecha,fechaFin,director,tema,usuario) values( '" + evento.name + "','" + evento.horario + "','" + evento.fecha + "','" + evento.fechaFin + "','" + evento.director + "','" + evento.tema + "','" + idUser + "'); ");
            String nameTemp = name;
            int keyEvent = consultEvent(name);
            foreach (var key in sitesDictionary.Keys)
            {

                connect.insertData("INSERT INTO sitioevento(fkIdSitio,fkIdEvento)values('" + key + "','" + keyEvent + "')");
            }

            return answer;
        }

        public int consultEvent(String name)
        {
            result = connect.executeConsult("Select idEvento from evento where nombre='" + name + "';", CommandType.Text);
            int number = Convert.ToInt32(result.Rows[0][0].ToString());
            return number;
        }

        public DataTable consultEvents()
        {
            result = connect.executeConsult("Select idEvento,nombre,director,tema,fecha from evento order by fecha desc;", CommandType.Text);

            return result;
        }

        public DataTable consultEventsByPerson(int cedula)
        {
            result = connect.executeConsult(@"SELECT persona.primerNombre, persona.segundoNombre, persona.primerApellido, persona.segundoApellido, evento.nombre,evento.idEvento
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE persona.cedula = '" + cedula+"'; ", CommandType.Text);

            return result;
        }

        public DataTable consultPersonsByEvent(int idEvent)
        {
            result = connect.executeConsult(@"SELECT persona.primerNombre,persona.segundoNombre,persona.primerApellido,persona.segundoApellido,evento.nombre
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE idEvento = '" + idEvent+"'; ", CommandType.Text);

            return result;
        }


        public string InsertInscription(int fkEvent, int fkCedula)
        {
            answer = connect.insertData("Insert into inscripcion(fkCedulaPersona,fkIdEvento,fkIdCertificado) values('" + fkCedula + "','" + fkEvent + "','" + 1 + "') ");
            return answer;

        }

        public DataTable ConsultActivity()
        {
            result = connect.executeConsult("SELECT nombre,idTipoActividad FROM tipoActividad ORDER BY nombre ASC ;", CommandType.Text);
            return result;
        }

        public string insertActivities(int fkIdActividad, int fkcedula, int fkEvento, string hourData)
        {
            answer = connect.insertData("Insert into actividades(fkTipoActividad,fkCedula,fkEvento,horaFecha)values('" + fkIdActividad + "','" + fkcedula + "','" + fkEvento + "','" + hourData + "')");
            return answer;
        }

        public DataTable consultActivitiesbByEvent(int IdEvent)
        {
            result = connect.executeConsult(@"SELECT evento.nombre,persona.primerNombre,persona.segundoNombre,persona.primerApellido,persona.segundoApellido,tipoActividad.nombre as 'tipo actividad',actividades.horaFecha FROM persona 
                                             INNER JOIN actividades ON actividades.fkCedula = persona.cedula
                                             INNER JOIN tipoActividad ON tipoActividad.idTipoActividad = actividades.fkTipoActividad
                                             INNER JOIN evento ON actividades.fkEvento = evento.idEvento
                                             WHERE evento.idEvento = '" + IdEvent + "'; ", CommandType.Text);
            return result;
        }
    }
}