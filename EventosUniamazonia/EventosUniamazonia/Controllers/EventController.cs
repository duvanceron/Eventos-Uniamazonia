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
        String answer, answer2, temporary;
        DataTable result, result2;
        int rows;


        public EventController()
        {
            evento = new EventModel();
            connect = new Connection();
            site = new SiteController();
            result = new DataTable();


        }

        public String addEvent(string name, string schedule, String date, String dateEnd, String director, String theme, Dictionary<int, String> sitesDictionary, String photo)
        {
            evento.name = name;
            evento.horario = schedule;
            evento.director = director;
            evento.tema = theme;
            evento.fecha = date;
            evento.fechaFin = dateEnd;
            evento.foto = photo;
            answer = connect.insertData("INSERT INTO evento (nombre,fecha,fechaFin,director,tema,foto) values( '" + evento.name + "','" + evento.fecha + "','" + evento.fechaFin + "','" + evento.director + "','" + evento.tema + "','" + evento.foto + "'); ");
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
            result = connect.executeConsult("Select idEvento,nombre,director,tema,date_format(fecha,'%Y-%m-%d')as fecha,date_format(fechaFin,'%Y-%m-%d')as fechaFin from evento WHERE fecha >= CURDATE()  order by fecha asc;", CommandType.Text);

            return result;
        }

        public DataTable consultEventsInThisMoment()
        {
            result = connect.executeConsult("Select idEvento,nombre,director,tema,date_format(fecha,'%Y-%m-%d')as fecha,date_format(fechaFin,'%Y-%m-%d')as fechaFin from evento WHERE fecha<=CURDATE() AND fechaFin>=CURDATE()  order by fecha asc;;", CommandType.Text);

            return result;
        }
        public String RemoveInscription(int fkcedula, int fkEvent)
        {
            answer = connect.RemoveData("DELETE FROM inscripcion WHERE fkCedulaPersona = '" + fkcedula + "' and fkIdEvento = '" + fkEvent + "';");
            return answer;
        }
        public DataTable consultEventsByPerson(int cedula)
        {
            result = connect.executeConsult(@"SELECT persona.primerNombre, persona.segundoNombre, persona.primerApellido, persona.segundoApellido,persona.email, evento.nombre,evento.idEvento,
                                            date_format(evento.fecha,'%Y-%m-%d')as fecha,date_format(evento.fechaFin,'%Y-%m-%d')as fechaFin
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE persona.cedula = '" + cedula + "'; ", CommandType.Text);

            return result;
        }
        public DataTable consultEventsToMyCertificate(int cedula)
        {
            result = connect.executeConsult(@"SELECT persona.primerNombre, persona.segundoNombre, persona.primerApellido, persona.segundoApellido, evento.nombre,evento.idEvento,
                                            date_format(evento.fecha,'%Y-%m-%d')as fecha,date_format(evento.fechaFin,'%Y-%m-%d')as fechaFin
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE persona.cedula = '" + cedula + "' AND inscripcion.certificado='si'; ", CommandType.Text);

            return result;
        }


        public DataTable consultEventsToMyCertificate2(int cedula)
        {
            result = connect.executeConsult(@"SELECT persona.primerNombre, persona.segundoNombre, persona.primerApellido, persona.segundoApellido, evento.nombre,evento.idEvento,
                                            date_format(evento.fecha,'%Y-%m-%d')as fecha,date_format(evento.fechaFin,'%Y-%m-%d')as fechaFin
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE persona.cedula = '" + cedula + "' AND inscripcion.certificado='si'; ", CommandType.Text);

            return result;
        }


        public DataTable consultPersonsByEvent(int idEvent)
        {
            result = connect.executeConsult(@"SELECT persona.cedula,persona.primerNombre,persona.segundoNombre,persona.primerApellido,persona.segundoApellido,
                                            persona.email,evento.nombre, date_format(evento.fecha,'%Y-%m-%d')as fecha,date_format(evento.fechaFin,'%Y-%m-%d')as fechaFin,inscripcion.nroAsistencias
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE idEvento = '" + idEvent + "'; ", CommandType.Text);

            return result;
        }

        public DataTable consultPersonsByEventConcat(int idEvent)
        {
            result = connect.executeConsult(@"SELECT persona.cedula,  CONCAT(persona.primerNombre, ' ',persona.segundoNombre,' ',
                                            persona.primerApellido,' ',persona.segundoApellido) As primerNombre,
                                            persona.email,evento.nombre,inscripcion.nroAsistencias
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE idEvento = '" + idEvent + "'; ", CommandType.Text);

            return result;
        }

        public DataTable consultPersonsByEventWithCertificate(int idEvent)
        {
            result = connect.executeConsult(@"SELECT persona.cedula,  CONCAT(persona.primerNombre, ' ',persona.segundoNombre,' ',
                                            persona.primerApellido,' ',persona.segundoApellido) As primerNombre,
                                            persona.email,evento.nombre,inscripcion.nroAsistencias
                                            FROM persona
                                            INNER JOIN inscripcion ON inscripcion.fkCedulaPersona = persona.cedula
                                            INNER JOIN evento ON inscripcion.fkIdEvento = evento.idEvento
                                            WHERE idEvento = '" + idEvent + "'AND inscripcion.certificado='si'; ", CommandType.Text);

            return result;
        }


        public string InsertInscription(int fkEvent, int fkCedula)
        {
            answer = connect.insertData("Insert into inscripcion(fkCedulaPersona,fkIdEvento,nroAsistencias,nroRefrigerios) values('" + fkCedula + "','" + fkEvent + "','" + 0 + "','" + 0 + "') ");
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

        public string insertActivitiesWithoutCc(int fkIdActividad, int fkEvento, string hourData)
        {
            answer = connect.insertData("Insert into actividades(fkTipoActividad,fkEvento,horaFecha)values('" + fkIdActividad + "','" + fkEvento + "','" + hourData + "')");
            return answer;
        }

        public DataTable consultActivitiesbByEvent(int IdEvent)
        {
            result = connect.executeConsult(@"SELECT evento.nombre,persona.primerNombre,persona.segundoNombre,persona.primerApellido,persona.segundoApellido,tipoActividad.nombre as 'tipo actividad',
                                             DATE_FORMAT(actividades.horaFecha, '%d/%m/%Y %h:%i %p')as horaFecha,persona.tema,DATE_FORMAT(actividades.horaFechaFin, '%h:%i %p') as horaFechaFin  FROM evento 
                                             INNER JOIN actividades ON actividades.fkEvento = evento.idEvento                                             
                                             INNER JOIN tipoActividad ON tipoActividad.idTipoActividad = actividades.fkTipoActividad
                                             LEFT JOIN persona ON actividades.fkCedula = persona.cedula
                                             WHERE actividades.fkEvento = '" + IdEvent + "';", CommandType.Text);
            return result;
        }
        public DataTable consultActivitiesbByEventConcat(int IdEvent)
        {
            result = connect.executeConsult(@"SELECT evento.nombre,CONCAT(persona.primerNombre, '',persona.segundoNombre,'',
                                             persona.primerApellido,'',persona.segundoApellido) As primerNombre,tipoActividad.nombre as 'tipo actividad',
                                             DATE_FORMAT(actividades.horaFecha, '%d/%m/%Y %h:%i %p')as horaFecha,persona.tema,DATE_FORMAT(actividades.horaFechaFin, '%h:%i %p') as horaFechaFin  FROM evento 
                                             INNER JOIN actividades ON actividades.fkEvento = evento.idEvento                                             
                                             INNER JOIN tipoActividad ON tipoActividad.idTipoActividad = actividades.fkTipoActividad
                                             LEFT JOIN persona ON actividades.fkCedula = persona.cedula
                                             WHERE actividades.fkEvento = '" + IdEvent + "';", CommandType.Text);
            return result;
        }

        public String VerifyInsert(int person, int evento, String date, String jornada)
        {
            result = connect.executeConsult(@"SELECT nroAsistencias FROM inscripcion  WHERE fkCedulaPersona='" + person + "' AND fkIdEvento='" + evento + "';", CommandType.Text);
            answer = result.Rows[0][0].ToString();
            result2 = connect.executeConsult(@"SELECT duracion FROM evento  WHERE idEvento='" + evento + "'", CommandType.Text);
            answer2 = result2.Rows[0][0].ToString();
            if (answer.Equals(answer2))
            {
                answer = "La persona ha asistido al evento satisfactoriamente.";
            }
            else
            {
                answer = ConsultExistence(person, evento, date, jornada);
                //rows = connect.updateData(@"UPDATE inscripcion SET asiste='si'  WHERE fkCedulaPersona='" + person + "' AND fkIdEvento='" + evento + "';");

                //answer = "Asistencia del dia de hoy registrada exitosamente";
            }
            return answer;
        }

        public void insertAssistance(int person, int evento, String date, String jornada)
        {
            connect.insertData("INSERT INTO asistencia(fkCedulaPersonaTwo,fkIdEventoTwo,fecha,jornada) VALUES('" + person + "','" + evento + "','" + date + "','" + jornada + "')");
        }
        public String ConsultExistence(int person, int evento, String date, String jornada)
        {
            result = connect.executeConsult("SELECT fecha,jornada FROM asistencia where fkCedulaPersonaTwo ='" + person + "' and fkIdEventoTwo='" + evento + "'and fecha= CURDATE() ;", CommandType.Text);

            if (result.Rows.Count < 2)
            {
                if (result.Rows.Count >= 1)
                {
                    temporary = result.Rows[0][1].ToString();
                    if (jornada.Equals(temporary))
                    {

                        answer = "La persona esta inscrita en la jornada";
                    }
                    else
                    {
                        insertAssistance(person, evento, date, jornada);
                        answer = "La persona quedo inscrita su asistencia de manera satisfactoria";
                    }
                }
                else
                {
                    insertAssistance(person, evento, date, jornada);
                    answer = "La persona quedo inscrita su asistencia de manera satisfactoria";
                }

            }
            else
            {
                answer = "La persona esta inscrita en las 2 jornadas del dia de hoy";
            }
            return answer;


        }
        public String VerifyInsertRefreshments(int person, int evento, String date, String jornada)
        {
            result = connect.executeConsult(@"SELECT nroAsistencias FROM inscripcion  WHERE fkCedulaPersona='" + person + "' AND fkIdEvento='" + evento + "';", CommandType.Text);
            answer = result.Rows[0][0].ToString();
            result2 = connect.executeConsult(@"SELECT duracion FROM evento  WHERE idEvento='" + evento + "'", CommandType.Text);
            answer2 = result2.Rows[0][0].ToString();
            if (answer == "si")
            {
                answer = "La persona ha reclamado todos los refrigerios de manera satisfactoria.";
            }
            else
            {
                answer = ConsultExistenceRefreshments(person, evento, date, jornada);
                //rows = connect.updateData(@"UPDATE inscripcion SET asiste='si'  WHERE fkCedulaPersona='" + person + "' AND fkIdEvento='" + evento + "';");

                //answer = "Asistencia del dia de hoy registrada exitosamente";
            }
            return answer;
        }


        public void insertRefreshments(int person, int evento, String date, String jornada)
        {
            connect.insertData("INSERT INTO Refrigerios(fkCedulaPersonaTwo,fkIdEventoTwo,fecha,jornada) VALUES('" + person + "','" + evento + "','" + date + "','" + jornada + "')");
        }

        public String ConsultExistenceRefreshments(int person, int evento, String date, String jornada)
        {
            result = connect.executeConsult("SELECT fecha,jornada FROM Refrigerios where fkCedulaPersonaTwo ='" + person + "' and fkIdEventoTwo='" + evento + "'and fecha= CURDATE() ;", CommandType.Text);

            if (result.Rows.Count < 2)
            {
                if (result.Rows.Count >= 1)
                {
                    temporary = result.Rows[0][1].ToString();
                    if (jornada.Equals(temporary))
                    {

                        answer = "La persona ya reclamo el refrigerio de esta jornada.";
                    }
                    else
                    {
                        insertRefreshments(person, evento, date, jornada);
                        answer = "Se registro satisfactoriamente la entrega del refrigerio.";
                    }
                }
                else
                {
                    insertRefreshments(person, evento, date, jornada);
                    answer = "Se registro satisfactoriamente la entrega del refrigerio.";
                }

            }
            else
            {
                answer = "La persona reclamo los dos refrigerios del dia de hoy.";
            }
            return answer;


        }
        public DataTable consultTotalRefreshments(int evento)
        {
            result = connect.executeConsult("SELECT COUNT(*) FROM refrigerios  WHERE  fkIdeventoTwo='" + evento + "';", CommandType.Text);
            return result;
        }

        public DataTable consultSlider()
        {
            result = connect.executeConsult("SELECT foto,nombre FROM evento ORDER BY idEvento DESC LIMIT 4;", CommandType.Text);
            return result;
        }
    }
}