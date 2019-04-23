using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventosUniamazonia.Controllers;
using System.Text.RegularExpressions;

namespace EventosUniamazonia.Views.Person
{
    public partial class RegisterPerson : System.Web.UI.Page
    {
        PersonController personC;
        String result;
        Regex regLetter;
        emailAplication email;
        public RegisterPerson()
        {
            regLetter = new Regex("^[A-Z & a-z]*$");
            personC = new PersonController();
            email = new emailAplication();

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (isCorrectData())
            {
                if (email.IsCorrectEmail(emailPerson.Text.ToString(), "Registro", "Usted se ha registrado en Eventos Uniamazonia, Gracias por hacer parte de la comunidad"))
                {
                    result = personC.addPerson(Convert.ToInt32(this.cc.Text), this.name.Text.ToUpper(), this.name2.Text.ToUpper(), this.lastName.Text.ToUpper(), this.lastName2.Text.ToUpper(), this.user.Text, this.password.Text,this.emailPerson.Text);

                    if (result != null)
                    {
                        //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "<script>alert('Error en la consulta " + result + ".')</script>", false);
                        Response.Write("<script>alert(' " + result + ".')</script>");
                        emptyFields();
                    }
                    else
                    {
                        Response.Redirect("../Person/Login.aspx");

                    }
                }
                else
                {
                    Response.Write("<script>alert('Correo electronico invalido')</script>");
                    emptyFields();

                }

            }
            else
            {
                Response.Write("<script>alert('Datos incorrectos')</script>");
                emptyFields();
            }
        }

        public Boolean validateEmpty(String word)
        {
            if (word == null || word.Equals(""))
            {
                return true;
            }
            return false;
        }


        public Boolean isCorrectData()
        {
            if (validateEmpty(this.cc.Text) == true || validateEmpty(this.name.Text) == true || validateEmpty(this.lastName.Text) == true ||
                 validateEmpty(this.password.Text) == true || validateEmpty(this.user.Text) == true || !IsNumber(this.cc.Text) ||
                 !isLetter(name.Text) || !isLetter(name2.Text) || !isLetter(lastName.Text) || !isLetter(lastName2.Text) || !equalPassword(password.Text, verifyPassword.Text))
            {
                return false;
            }
            return true;
        }

        public void emptyFields()
        {
            this.cc.Text = ""; this.name.Text = ""; this.name2.Text = "";
            this.lastName.Text = ""; this.lastName2.Text = ""; this.user.Text = "";
            this.password.Text = ""; this.verifyPassword.Text = "";

        }

        public Boolean IsNumber(String word)
        {
            int letter;
            try
            {
                letter = Convert.ToInt32(word);
                return true;

            }
            catch
            {
                return false;
            }

        }

        public Boolean isLetter(String word)
        {
            if (regLetter.IsMatch(word) || !validateEmpty(word))
            {
                return true;
            }
            return false;
        }

        public Boolean equalPassword(String word1, String word2)
        {
            if (word1.Equals(word2))
            {
                return true;
            }
            return false;
        }


    }
}