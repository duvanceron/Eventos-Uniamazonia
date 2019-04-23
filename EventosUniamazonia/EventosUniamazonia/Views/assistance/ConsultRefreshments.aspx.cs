using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.assistance
{
    public partial class ConsultRefreshments : System.Web.UI.Page
    {

        public EventController evento;
        string answer;
        public DataTable temporal;
        public ConsultRefreshments()
        {
            evento = new EventController();
            temporal = new DataTable();
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
            temporal = evento.consultTotalRefreshments(Convert.ToInt32(DropDownEvents.SelectedValue)); ;
            LabelTotal.Text = "  "+temporal.Rows[0][0].ToString();
        }
    }
}