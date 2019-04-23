using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventosUniamazonia.Controllers;

namespace EventosUniamazonia.Views.Events
{
    public partial class RegisterEvent : System.Web.UI.Page
    {
        public EventController NewEvent;
        public String answer;
        public Validations vdte;
        public SiteController site;
        Dictionary<int, string> sitesDic;
        public RegisterEvent()
        {
            NewEvent = new EventController();
            vdte = new Validations();
            site = new SiteController();
            sitesDic = new Dictionary<int, String>();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 getCities();

            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            int valor;
            String text;
           // IsEmptyCombo();
            foreach (ListItem valueItem in ListSites.Items) {
                valor= Convert.ToInt32(valueItem.Value);
                text = valueItem.Text;
                sitesDic.Add(valor,text);
            }
            
          
            if (isCorrectData())
            {
                answer = NewEvent.addEvent(name.Value, schedule.Value, date.Value, dateEnd.Value, director.Value, theme.Value,sitesDic, Session["LoginUser"].ToString());
         
                if (answer != null)
                {
                    //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "<script>alert('Error en la consulta " + result + ".')</script>", false);
                    Response.Write("<script>alert(' " + answer + ".')</script>");
                    emptyFields();
                }
                else
                {
                    Response.Write("<script>alert('Registro exitoso.')</script>");

                    emptyFields();
                }
            }
            else
            {
                Response.Write("<script>alert('Datos incorrectos')</script>");
                emptyFields();
            }



        }
        protected void Add_Click(object sender, EventArgs e)
        {
           int value= Convert.ToInt32(DropDown.SelectedValue);
            String text=DropDown.SelectedItem.ToString();
            
            ListSites.Items.Add(new ListItem(text, ""+value));
        
            sitesDic.Add(value, text);

        }

        protected void Remove_Click(object sender, EventArgs e) {
            int value= Convert.ToInt32(DropDown.SelectedValue);
            sitesDic.Remove(value);
            ListSites.Items.Remove(ListSites.SelectedItem);
        }


        public void emptyFields()
        {
            name.Value = ""; schedule.Value = ""; director.Value = ""; theme.Value = ""; date.Value = "";
        }

        public Boolean isCorrectData()
        {
            if (vdte.validateEmpty(name.Value) == true || vdte.validateEmpty(schedule.Value) == true || vdte.validateEmpty(director.Value) == true || vdte.validateEmpty(theme.Value) == true || vdte.validateEmpty(date.Value) == true
                )
            {
                return false;
            }
            return true;
        }


        public void getCities()
        {

            this.DropDown.DataSource = site.SearchSite();
            this.DropDown.DataTextField = "nombre";
            this.DropDown.DataValueField = "idSitio";
            DropDown.DataBind();
            this.DropDown.Items.Insert(0, new ListItem("--Por favor seleccione una sitio.--", "0"));
        }

        public Boolean IsEmptyCombo()
        {
            String state = DropDown.SelectedItem.ToString();

            if (state.Equals("0"))
            {
                return true;
            }
            return false;
        }

        protected void Search_Click(object sender, EventArgs e)
        {

            this.GridView1.DataSource = site.SearchSite2(WriteSite.Text);
            GridView1.DataBind();

        }

        protected void Save_Click(object sender, EventArgs e)
        {

         

        }

       
    }
}