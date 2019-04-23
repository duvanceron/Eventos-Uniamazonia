using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventosUniamazonia.Controllers;



namespace EventosUniamazonia.Views.Sitios
{
    public partial class RegisterSite : System.Web.UI.Page
    {
        SiteController site;
        String result;
        Validations vdte;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public RegisterSite()
        {
            PersonController person = new PersonController();
            site = new SiteController();
            vdte = new Validations();
        }


        protected void Register_Click(object sender, EventArgs e)
        {
            if (IsCorrectDate())
            {
                result = site.addSite(this.name.Text, Convert.ToInt32(this.capacity.Text), this.direccion.Text);
                if (result != null)
                {
                    //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "<script>alert('Error en la consulta " + result + ".')</script>", false);
                    Response.Write("<script>alert(' " + result + ".')</script>");

                }
                else
                {
                    Response.Write("<script>alert('Registro exitoso.')</script>");

                    emptyFields();
                }

            }
            else
            {
                Response.Write("<script>alert('Datos  incorrectos')</script>");
                emptyFields();
            }

        }

        protected Boolean IsCorrectDate()
        {
            if (vdte.validateEmpty(name.Text) == true || vdte.validateEmpty(capacity.Text) == true || vdte.validateEmpty(direccion.Text) == true || !vdte.IsNumber(capacity.Text))
            {
                return false;
            }
            return true;
        }

        public void emptyFields()
        {
            name.Text = ""; capacity.Text = "";
            direccion.Text = "";
        }


    }
}