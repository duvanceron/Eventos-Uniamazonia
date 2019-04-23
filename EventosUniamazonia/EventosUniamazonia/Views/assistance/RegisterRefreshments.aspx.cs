using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.assistance
{
    public partial class RegisterRefreshments : System.Web.UI.Page
    {
        public EventController evento;
        string answer;
        public RegisterRefreshments()
        {
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DropDownEvents.DataSource = evento.consultEventsInThisMoment();
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

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Registro"))
            {
                int cedula = Convert.ToInt32(e.CommandArgument.ToString());
                int idEvento = Convert.ToInt32(DropDownEvents.SelectedValue);
                string time = DateTime.Now.ToString("yyyy-MM-dd");

                answer = evento.VerifyInsertRefreshments(cedula, idEvento, time, DropDownOpcions.SelectedValue);
                Response.Write("<script>alert('" + answer + "')</script>");
            }
         }

    }
}