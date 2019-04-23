using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.Events
{
    public partial class MyEvents : System.Web.UI.Page
    {
        EventController evento;
        String answer;
        public MyEvents()
        {
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    loadListEvents();
            //}
            loadListEvents();
        }

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Remove"))
            {
                answer = evento.RemoveInscription(Convert.ToInt32(Session["idRol"].ToString()), Convert.ToInt32(e.CommandArgument.ToString()));
                if (answer == null)
                {
                    Response.Write("<script>alert('Usted se ha eliminado del evento.')</script>");
                    loadListEvents();
                }
            }
        }

        public void loadListEvents()
        {
            listEvents.DataSource = evento.consultEventsByPerson(Convert.ToInt32(Session["idRol"].ToString()));
            listEvents.DataBind();
        }
    }
}