using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.Events
{
    public partial class InscripcionEvents : System.Web.UI.Page
    {
        public DataTable data;
        EventController evento;
        PersonController person;
        public DataRow rowEvent;
        String answer,emailPerson;
        emailAplication email;
        public InscripcionEvents()
        {
            data = new DataTable();
            evento = new EventController();
            email = new emailAplication();
            person = new PersonController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView1.DataSource = evento.consultEvents();
                ListView1.DataBind();
            }
        }



        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Registro"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument.ToString());
                    int id2 = Convert.ToInt32(Session["idRol"].ToString());
                    answer = evento.InsertInscription(id, id2);
                    if (answer != null)
                    {
                        Response.Write("<script>alert('Usted ya se encuentra registrado en el evento')</script>");
                    }
                    else
                    {
                        data=evento.consultEventsByPerson(Convert.ToInt32(Session["idRol"].ToString()));
                        rowEvent = data.Rows[0];
                        emailPerson = rowEvent["email"].ToString();
                        rowEvent["nombre"].ToString();
                        email.IsCorrectEmail(emailPerson, "Registro", "Usted se ha registrado el evento '" + rowEvent["nombre"].ToString()+"', Gracias por hacer parte de la comunidad");
                        Response.Write("<script>alert('Registro exitoso')</script>");
                    }
                }
                catch
                {

                }
            }
        }
    }
}