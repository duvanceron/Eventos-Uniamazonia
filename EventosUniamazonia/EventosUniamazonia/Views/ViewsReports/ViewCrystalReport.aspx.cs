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
    public partial class ViewCrystalReport : System.Web.UI.Page
    {

        DataTable data;
        ReportEvents reportEvents;
        ReportInscriptions reportInscriptions;
        EventController evento;
        reportCronogram ReportCronogram;
        reportAssistance assistance;
        reportCertificate certificate;
        string wordKey, title;
        int select;

        public ViewCrystalReport()
        {

            data = new DataTable();

            evento = new EventController();
            reportInscriptions = new ReportInscriptions();
            ReportCronogram = new reportCronogram();
            reportEvents = new ReportEvents();
            assistance = new reportAssistance();
            certificate = new reportCertificate();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["parametro"] != null)
            {
                wordKey = Request.Params["parametro"];
                select = Convert.ToInt32(Request.Params["parametro2"]);
                title = Request.Params["parametro3"];
                ShowReportsEvents();
            }
        }


        public void ShowReportsEvents()
        {
            switch (wordKey)

            {
                case "eventos":
                    data = evento.consultEvents();
                    reportEvents.SetDataSource(data);
                    reportEvents.SetParameterValue("titulo", "Eventos en la Universidad De La Amazonia.");
                    reportEvents.SetParameterValue("usuario", "Impreso por : " + Session["LoginUser"].ToString());
                    CrystalReportEvents.ReportSource = reportEvents;
                    CrystalReportEvents.Height = 200;
                    CrystalReportEvents.Width = 400;
                    break;
                case "inscripciones":
                    data = evento.consultPersonsByEventConcat(select);
                    reportInscriptions.SetDataSource(data);
                    reportInscriptions.SetParameterValue("titulo", title);
                    reportInscriptions.SetParameterValue("usuario", "Impreso por : " + Session["LoginUser"].ToString());
                    CrystalReportEvents.ReportSource = reportInscriptions;
                    CrystalReportEvents.Height = 200;
                    CrystalReportEvents.Width = 400;
                    break;
                case "cronograma":
                    data = evento.consultActivitiesbByEventConcat(select);
                    ReportCronogram.SetDataSource(data);
                    ReportCronogram.SetParameterValue("titulo", title);
                    CrystalReportEvents.ReportSource = ReportCronogram;
                    CrystalReportEvents.Height = 200;
                    CrystalReportEvents.Width = 400;
                    break;
                case "asistencia":
                    data = evento.consultPersonsByEventConcat(select);
                    assistance.SetDataSource(data);
                    assistance.SetParameterValue("titulo", title);
                    CrystalReportEvents.ReportSource = assistance;
                    CrystalReportEvents.Height = 200;
                    CrystalReportEvents.Width = 400;
                    break;
                case "certificate":
                    data = evento.consultPersonsByEventWithCertificate(select);
                    certificate.SetDataSource(data);
                    certificate.SetParameterValue("head", "Hace parte de la nueva generación de ciudadanos digitales competentes en:");
                    certificate.SetParameterValue("bodyText", "En atención a que superó satisfactoriamente las pruebas y demostró sus habilidades y conocimientos para obtener la certificación en la unidad de competencia:");
                    CrystalReportEvents.ReportSource = certificate;
                    CrystalReportEvents.Height = 200;
                    CrystalReportEvents.Width = 400;
                    break;

                default:
                    Response.Redirect("../../Views/ViewsReports/Reports.aspx");
                    break;

            }

        }

        public void showReports() { }
    }
}