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
    public partial class MassiveMail : System.Web.UI.Page
    {
        public EventController evento;
        public DataTable data;
        public PersonController person;
        emailAplication email;
        String chainMails;
        public MassiveMail()
        {
            evento = new EventController();
            data = new DataTable();
            person = new PersonController();
            email = new emailAplication();
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
            ListEmail.DataSource = evento.consultPersonsByEvent(Convert.ToInt32(DropDownEvents.SelectedValue));
            ListEmail.DataTextField = ("email");
            ListEmail.DataValueField = ("cedula");
            ListEmail.DataBind();

        }

        public void Remove_Click(object sender, EventArgs e)
        {

            ListEmail.Items.Remove(ListEmail.SelectedItem);
        }

        public void Send_Click(object sender, EventArgs e) {
            foreach (ListItem valueItem in ListEmail.Items)
            {
                chainMails += valueItem.Text + ",";
               
               
            }
            chainMails = chainMails.TrimEnd(',');
            email.IsCorrectEmail(chainMails, affair.Value, bodyEmail.Value);
            clearFields();

        }

        public void clearFields() {
            to.Value = ""; affair.Value = ""; bodyEmail.Value = ""; ListEmail.Items.Clear(); 
        }
    }
}