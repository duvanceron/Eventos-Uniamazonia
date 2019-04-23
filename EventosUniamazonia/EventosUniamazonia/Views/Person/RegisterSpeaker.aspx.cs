using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventosUniamazonia.Controllers;
using System.Data;
using System.Web.UI.HtmlControls;

namespace EventosUniamazonia.Views.Person
{
    public partial class RegisterSpeaker : System.Web.UI.Page
    {
        PersonController person;
        DataTable data;
        String nameFulll;
        Validations validate;
        String answer;

        public RegisterSpeaker()
        {
            person = new PersonController();
            data = new DataTable();
            validate = new Validations();
            

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void SearchPerson(object sender, EventArgs e)
        {
            try
            {
                if (IsCorrectTheField(this.ccSpeaker.Text) == true)
                {
                    data = person.searchPersons(Convert.ToInt32(this.ccSpeaker.Text));
                    nameFulll = data.Rows[0][0].ToString() + " " + data.Rows[0][1].ToString() + " " + data.Rows[0][2].ToString() + " " + data.Rows[0][3].ToString();
                    name.Text = nameFulll.ToUpper();
                }
                else {
                    Response.Write("<script>alert('Verificar los datos ingresados.')</script>");
                }

            }
            catch
            {
                Response.Write("<script>alert('Verificar los datos ingresados.')</script>");

            }
        }

        protected void btnRegisterSpeaaker_Click(object sender, EventArgs e)
        {
            if (isCorrectAllTheFields()==true) {
                try {
                    answer=person.ModifyPerson(theme.Text, ccSpeaker.Text);
                    if (answer == null)
                    {
                        Response.Write("<script>alert('Registro exitoso.')</script>");
                        clearFields();
                    }
                    else {
                        Response.Write("<script>alert('Error en la consulta.')</script>");
                        clearFields();
                    }
                }
                catch { 
                    Response.Write("<script>alert('Verificar los datos ingresados.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Verificar los datos ingresados.')</script>");
            }
           
        }


        public Boolean IsCorrectTheField(String field) {
            if (validate.validateEmpty(field)==true || validate.IsNumber(field)==false){
                return false;
            }
            return true;

        }

        public Boolean isCorrectAllTheFields() {
            if (validate.validateEmpty(ccSpeaker.Text) == true || validate.IsNumber(ccSpeaker.Text) == false || validate.validateEmpty(theme.Text)==true || validate.isLetter(theme.Text)==false) {
                return false;
            }
            return true;
        }

        public void clearFields() {
            ccSpeaker.Text = "";
            name.Text = "";
            theme.Text = "";
        }
    }
}