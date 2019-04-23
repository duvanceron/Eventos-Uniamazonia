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
        public MyEvents()
        {
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listEvents.DataSource = evento.consultEventsByPerson(Convert.ToInt32(Session["idRol"].ToString()));
                listEvents.DataBind();
            }

        }

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Remove"))
            {
               
            }
        }
    }
}