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
    public partial class CronogramaEvent : System.Web.UI.Page
    {
        DataTable data;
        PersonController person;
        EventController evento;
        String nameFull;
        public CronogramaEvent() {
            data = new DataTable();
            person = new PersonController();
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                loadActivities();
                LoadEvents();
                
            }
            ListView1.DataSource = evento.consultActivitiesbByEvent(39);
            ListView1.DataBind();


        }

        protected void Search_Click(object sender, EventArgs e)
        {
            data = person.searchPersons(Convert.ToInt32(cedula.Value));
            nameFull=data.Rows[0][0].ToString() + " " + data.Rows[0][1].ToString() + " " + data.Rows[0][2].ToString() + " " + data.Rows[0][3].ToString(); ;
            this.name.Value = nameFull.ToUpper();
            this.Tema.Value = data.Rows[0][4].ToString().ToUpper();
        }

        public void loadActivities() {
            this.listActivities.DataSource = evento.ConsultActivity();
            this.listActivities.DataTextField = "nombre";
            this.listActivities.DataValueField = "idTipoActividad";
            this.listActivities.DataBind();
            this.listActivities.Items.Insert(0, new ListItem("--Por favor seleccione una Actividad.--", "0"));
        }

        public void LoadEvents() {
            this.DropDownEvent.DataSource = evento.consultEvents();
            this.DropDownEvent.DataTextField = "nombre";
            this.DropDownEvent.DataValueField = "idEvento";
            this.DropDownEvent.DataBind();
            this.DropDownEvent.Items.Insert(0, new ListItem("--Por favor seleccione un Evento.--", "0"));
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            evento.insertActivities(Convert.ToInt32(listActivities.SelectedValue),Convert.ToInt32(cedula.Value), Convert.ToInt32(DropDownEvent.SelectedValue),date.Value);
        }


    }
}