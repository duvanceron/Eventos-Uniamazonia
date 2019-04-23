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
    public partial class InscripcionEvents : System.Web.UI.Page
    {
        public DataTable data;
        EventController evento;
        public DataRow rowEvent;
        public InscripcionEvents()
        {
            data = new DataTable();
            evento = new EventController();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView1.DataSource = evento.consultEvents();
                ListView1.DataBind();
            }
        }

     

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("Registro"))
            {
                int id = Convert.ToInt32 (e.CommandArgument.ToString());
                int id2 = Convert.ToInt32( Session["idRol"].ToString());
                evento.InsertInscription(id,id2);
            }
        }
    }
}