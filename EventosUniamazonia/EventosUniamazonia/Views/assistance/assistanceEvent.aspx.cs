using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EventosUniamazonia.Views.assistance
{
    public partial class assistanceEvent : System.Web.UI.Page
    {
        public EventController evento;
        string answer;
        DataTable data;
        public assistanceEvent()
        {
            evento = new EventController();
            data = new DataTable(); 
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
            data = evento.consultPersonsByEvent(Convert.ToInt32(DropDownEvents.SelectedValue));
            listEvents.DataSource = evento.consultPersonsByEvent(Convert.ToInt32(DropDownEvents.SelectedValue));
            listEvents.DataBind();
           
            LabelDuracion.Text = "El evento se realiza durante las fechas "+data.Rows[0][7].ToString()+"/"+ data.Rows[0][8].ToString();
            LabelInfo.Text = "Se registrara la asistencia del dia " + DateTime.Now.ToString("yyyy-MM-dd");

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Registro"))
            {
                int cedula = Convert.ToInt32(e.CommandArgument.ToString());
                int idEvento = Convert.ToInt32(DropDownEvents.SelectedValue);
                string time = DateTime.Now.ToString("yyyy-MM-dd");

                answer = evento.VerifyInsert(cedula, idEvento, time,DropDownOpcions.SelectedValue);
                Response.Write("<script>alert('" + answer + "')</script>");
            }
        }
    }
}