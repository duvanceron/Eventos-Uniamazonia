using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.Events
{
    public partial class ConsultInscripciones : System.Web.UI.Page
    {
        public EventController evento;
        public ConsultInscripciones()
        {
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownEvents.DataSource = evento.consultEvents();
                DropDownEvents.DataTextField = ("nombre");
                DropDownEvents.DataValueField = ("idEvento");
                DropDownEvents.DataBind();

            }

        }

        protected void Search_Click(object sender, EventArgs e)
        {
            listEvents.DataSource = evento.consultPersonsByEvent(Convert.ToInt32(DropDownEvents.SelectedValue));
            listEvents.DataBind();

        }
    }
}