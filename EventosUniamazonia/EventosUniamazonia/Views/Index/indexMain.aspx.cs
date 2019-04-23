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
    public partial class indexMain : System.Web.UI.Page
    {
        EventController evento;
        DataTable data;
        string first, second, third, fourth;
        public indexMain()
        {
            evento = new EventController();
            data = new DataTable();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string aux="";
            data = evento.consultSlider();
            first = "~/Upload/" + data.Rows[0][0].ToString();
            firstImg.Src = first;
            firstText.InnerText = data.Rows[0][1].ToString();
            imgSmallOne.Src = first;
            aux= data.Rows[0][1].ToString();
            if (aux.Length>56)
            {
                var chars = aux.ToCharArray();
                aux = "";
                for (int i = 0; i < 56; i++)
                {
                    aux = aux + chars[i];
                }
                firstSmall.InnerText = aux;
            }
            else
            {
            firstSmall.InnerText = data.Rows[0][1].ToString();
            }
            
            //firstSmall.InnerText = data.Rows[0][1].ToString();

            second = "~/Upload/" + data.Rows[1][0].ToString();
            secondImg.Src = second;
            secondText.InnerText = data.Rows[1][1].ToString();
            imgSmallTwo.Src = second;
            secondSmall.InnerText = data.Rows[1][1].ToString();
            aux = data.Rows[0][1].ToString();
            
            third = "~/Upload/" + data.Rows[2][0].ToString();
            thirdImg.Src = third;
            thirdText.InnerText = data.Rows[2][1].ToString();
            imgSmallthird.Src = third;
            thirdSmall.InnerText = data.Rows[2][1].ToString();

            fourth = "~/Upload/" + data.Rows[3][0].ToString();
            imgSmallFourth.Src = fourth;
            fourtSmall.InnerText = data.Rows[3][1].ToString();


        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            
            data = evento.consultEvents();
            
            foreach (DataRow dtRow in data.Rows)
            {
                
                if (e.Day.Date ==Convert.ToDateTime(dtRow["fecha"]))
                {
                    Label labelito = new Label();
                    labelito.Text = "<br>" + dtRow["nombre"].ToString();
                    e.Cell.Controls.Add(labelito);
                }
            }



        }
    }
}