using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.Index
{
    public partial class index : System.Web.UI.Page
    {
        EventController evento;
        DataTable data;
        string first,second,third;
        public index() {
            evento = new EventController();
            data = new DataTable();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            data=evento.consultSlider();
            first= "~/Upload/" + data.Rows[0][0].ToString();
            firstImg.Src = first;
            second= "~/Upload/" + data.Rows[1][0].ToString();
            secondImg.Src = second;
            third = "~/Upload/" + data.Rows[2][0].ToString();
            thirdImg.Src = third;
        }
    }
}