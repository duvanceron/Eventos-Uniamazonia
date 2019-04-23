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
        Validations validation;
        public CronogramaEvent()
        {
            data = new DataTable();
            person = new PersonController();
            evento = new EventController();
            validation = new Validations();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadActivities();
                LoadEvents();

            }


        }

        protected void Search_Click(object sender, EventArgs e)
        {
            data = person.searchPersons(Convert.ToInt32(cedula.Value));
            nameFull = data.Rows[0][0].ToString() + " " + data.Rows[0][1].ToString() + " " + data.Rows[0][2].ToString() + " " + data.Rows[0][3].ToString(); ;
            this.name.Value = nameFull.ToUpper();
            this.Tema.Value = data.Rows[0][4].ToString().ToUpper();
        }

        public void loadActivities()
        {
            this.listActivities.DataSource = evento.ConsultActivity();
            this.listActivities.DataTextField = "nombre";
            this.listActivities.DataValueField = "idTipoActividad";
            this.listActivities.DataBind();
            this.listActivities.Items.Insert(0, new ListItem("--Por favor seleccione una Actividad.--", "0"));
        }

        public void LoadEvents()
        {
            this.DropDownEvent.DataSource = evento.consultEvents();
            this.DropDownEvent.DataTextField = "nombre";
            this.DropDownEvent.DataValueField = "idEvento";
            this.DropDownEvent.DataBind();
            this.DropDownEvent.Items.Insert(0, new ListItem("--Por favor seleccione un Evento.--", "0"));
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (IsCorrectWithoutCc())
            {
                evento.insertActivitiesWithoutCc(Convert.ToInt32(listActivities.SelectedValue), Convert.ToInt32(DropDownEvent.SelectedValue), date.Value);
                clearFields();
            }
            else if (IsCorrectWithCc())
            {
                evento.insertActivities(Convert.ToInt32(listActivities.SelectedValue), Convert.ToInt32(cedula.Value), Convert.ToInt32(DropDownEvent.SelectedValue), date.Value);
                clearFields();
            }
            else
            {
                Response.Write("<script> alert('Datos incorrectos')</script>");
                clearFields();
            }
        }

        protected void Search_Cronogram(object sender, EventArgs e)
        {
            ListView1.DataSource = evento.consultActivitiesbByEvent(Convert.ToInt32(DropDownEvent.SelectedValue));
            ListView1.DataBind();

        }

        public void clearFields()
        {
            cedula.Value = ""; name.Value = ""; Tema.Value = ""; listActivities.SelectedValue = "0"; date.Value = "";
        }

        public Boolean IsCorrectWithoutCc()
        {
            if (validation.validateEmpty(cedula.Value.Trim()) == false || validation.validateEmpty(name.Value.Trim()) == false || validation.validateEmpty(Tema.Value.Trim()) == false || listActivities.SelectedValue.Equals("0") || validation.validateEmpty(date.Value) == true || DropDownEvent.SelectedValue.Equals("0"))
            {
                return false;
            }

            return true;
        }

        public Boolean IsCorrectWithCc()
        {
            if (validation.validateEmpty(cedula.Value) == true || listActivities.SelectedValue.Equals("0") || DropDownEvent.SelectedValue.Equals("0") || validation.validateEmpty(date.Value) == true)
            {
                return false;
            }

            return true;
        }




    }
}