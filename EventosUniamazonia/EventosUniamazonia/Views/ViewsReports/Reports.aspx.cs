using EventosUniamazonia.Controllers;
using EventosUniamazonia.Reportes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.ViewsReports
{
    public partial class Reports : System.Web.UI.Page
    {
        DataTable data;
        EventController evento;
        String opcion;
        //Boolean flag;
        public Reports()
        {

            data = new DataTable();
            evento = new EventController();
            // flag = false;



        }
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelDropDownEvents.Visible = false;
            panelLabelInfo.Visible = false;

        }

        public void GenerateReport_Click(object sender, EventArgs e)
        {


            if (checkEvents.Checked)
            {
                Response.Redirect("../../Views/ViewsReports/ViewCrystalReport.aspx?parametro=eventos");

            }

            if (checkInscripciones.Checked)
            {

                Response.Redirect("../../Views/ViewsReports/ViewCrystalReport.aspx?parametro=inscripciones&parametro2=" + Convert.ToInt32(DropDownEvents.SelectedValue) + "&parametro3=" + DropDownEvents.SelectedItem.ToString());
            }

            if (checkCronograma.Checked)
            {
                Response.Redirect("../../Views/ViewsReports/ViewCrystalReport.aspx?parametro=cronograma&parametro2=" + Convert.ToInt32(DropDownEvents.SelectedValue) + "&parametro3=" + DropDownEvents.SelectedItem.ToString());
            }
            if (checkAssistance.Checked)
            {
                Response.Redirect("../../Views/ViewsReports/ViewCrystalReport.aspx?parametro=asistencia&parametro2=" + Convert.ToInt32(DropDownEvents.SelectedValue) + "&parametro3=" + DropDownEvents.SelectedItem.ToString());
            }
            if (checkCertificate.Checked)
            {
                Response.Redirect("../../Views/ViewsReports/ViewCrystalReport.aspx?parametro=certificate&parametro2=" + Convert.ToInt32(DropDownEvents.SelectedValue) + "&parametro3=" + DropDownEvents.SelectedItem.ToString());
            }


        }

        protected void Visualize_Click(object sender, EventArgs e)
        {
            // flag =true;
            if (checkEvents.Checked)
            {
                opcion = "evento";
            }
            if (checkInscripciones.Checked)
            {
                opcion = "inscripciones";
            }
            if (checkCronograma.Checked)
            {
                opcion = "cronograma";
            }
            if (checkAssistance.Checked)
            {
                opcion = "asistencia";
            }

            if (checkCertificate.Checked)
            {
                opcion = "certificate";
            }

            switch (opcion)
            {
                case "evento":
                    PanelDropDownEvents.Visible = false;
                    panelLabelInfo.Visible = true;
                    break;

                case "inscripciones":
                    PanelDropDownEvents.Visible = true;
                    panelLabelInfo.Visible = false;
                    DropDownEvents.DataSource = evento.consultEvents();
                    DropDownEvents.DataTextField = ("nombre");
                    DropDownEvents.DataValueField = ("idEvento");
                    DropDownEvents.DataBind();
                    break;
                case "cronograma":
                    PanelDropDownEvents.Visible = true;
                    panelLabelInfo.Visible = false;
                    DropDownEvents.DataSource = evento.consultEvents();
                    DropDownEvents.DataTextField = ("nombre");
                    DropDownEvents.DataValueField = ("idEvento");
                    DropDownEvents.DataBind();
                    break;
                case "asistencia":
                    PanelDropDownEvents.Visible = true;
                    panelLabelInfo.Visible = false;
                    DropDownEvents.DataSource = evento.consultEvents();
                    DropDownEvents.DataTextField = ("nombre");
                    DropDownEvents.DataValueField = ("idEvento");
                    DropDownEvents.DataBind();
                    break;
                case "certificate":
                    PanelDropDownEvents.Visible = true;
                    panelLabelInfo.Visible = false;
                    DropDownEvents.DataSource = evento.consultEvents();
                    DropDownEvents.DataTextField = ("nombre");
                    DropDownEvents.DataValueField = ("idEvento");
                    DropDownEvents.DataBind();
                    break;

                default:
                    Response.Write("<script>alert('Seleccione una opción')</script>");
                    break;

            }

        }
    }
}