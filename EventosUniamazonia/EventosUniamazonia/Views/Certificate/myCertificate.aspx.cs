using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.Certificate
{
    public partial class myCertificate : System.Web.UI.Page
    {
        DataTable data;
        EventController evento;
        String opcion;
        public myCertificate()
        {
            data = new DataTable();
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelDropDownEvents.Visible = false;
            panelLabelInfo.Visible = false;

        }

        protected void Visualize_Click(object sender, EventArgs e)
        {
            // flag =true;


            if (checkCertificate.Checked)
            {
                opcion = "certificate";
            }

            switch (opcion)
            {

                case "certificate":
                    PanelDropDownEvents.Visible = true;
                    panelLabelInfo.Visible = false;
                    DropDownEvents.DataSource = evento.consultEventsToMyCertificate(Convert.ToInt32(Session["idRol"].ToString()));
                    DropDownEvents.DataTextField = ("nombre");
                    DropDownEvents.DataValueField = ("idEvento");
                    DropDownEvents.DataBind();
                    break;

                default:
                    Response.Write("<script>alert('Seleccione una opción')</script>");
                    break;

            }

        }
        public void GenerateReport_Click(object sender, EventArgs e)
        {

            if (checkCertificate.Checked)
            {
                Response.Redirect("../../Views/ViewsReports/ViewCrystalReport.aspx?parametro=certificate&parametro2=" + Convert.ToInt32(DropDownEvents.SelectedValue) + "&parametro3=" + DropDownEvents.SelectedItem.ToString());
            }


        }
    }
}