using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EventosUniamazonia.Views.Person
{
    public partial class Login : System.Web.UI.Page
    {
        public PersonController personC;
        public String result;
        public DataTable information;

        public Login()
        {
            personC = new PersonController();
            information = new DataTable();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("LoginUser");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            information = personC.logear(this.TextUser.Text, this.TextPassword.Text);
            if (information.Rows.Count >= 1)
            {

                Session["LoginUser"] = information.Rows[0][1].ToString();//a la sesion llamada Login le corresponde el valor de ese textBox, si la sesion no existe la crea, sino la remplaza
                Session["idRol"] = information.Rows[0][0].ToString();
                String val = Session["idRol"].ToString();

                Response.Redirect("../../Views/Home/Index.aspx");

            }
            else
            {
                Response.Write("<script>alert(' Usuario y/o contraseña incorrecta.')</script>");
            }


        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Person/RegisterPerson.aspx");
        }
    }
}