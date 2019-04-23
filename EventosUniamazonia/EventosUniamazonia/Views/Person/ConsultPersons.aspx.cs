using EventosUniamazonia.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Views.Person
{
    public partial class ConsultPersons : System.Web.UI.Page
    {
        PersonController person;
        DataTable data;
        String nameFull;
        Validations validate;
        public ConsultPersons()
        {
            person = new PersonController();
            data = new DataTable();
            validate = new Validations();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListPersons.DataSource = person.consultUsers();
                ListPersons.DataBind();
                loadRoles();
            }

        }

        protected void Search_Click(object sender, EventArgs e)
        {
            if (isCorrectTheCedula())
            {
                data = person.consultRolByPerson(Convert.ToInt32(cedula.Value));
                nameFull = data.Rows[0][1].ToString() + " " + data.Rows[0][2].ToString() + " " + data.Rows[0][3].ToString() + " " + data.Rows[0][4].ToString(); ;
                this.name.Value = nameFull.ToUpper();
                this.rolActual.Value = data.Rows[0][5].ToString().ToUpper();
            }
            else {
                Response.Write("<script>alert('Verificar los datos.')</script>");
            }

        }
        protected void Save_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(listRoles.SelectedValue) != 0)
            {

                if (isCorrectTheCedula())
                {
                    person.modifyRol(Convert.ToInt32(cedula.Value), Convert.ToInt32(listRoles.SelectedValue));
                    clearFields();
                }
                else
                {
                    Response.Write("<script>alert('Vefificar los datos.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Seleccione un rol.')</script>");
            }

        }

        public void loadRoles()
        {
            listRoles.DataSource = person.consultRoles();
            listRoles.DataTextField = "Rol";
            listRoles.DataValueField = "idRol";
            listRoles.DataBind();
            listRoles.Items.Insert(0, new ListItem("--Por favor seleccione un Rol.--", "0"));
        }

        public void clearFields()
        {
            cedula.Value = ""; name.Value = ""; rolActual.Value = ""; listRoles.SelectedValue = "0";

        }

        public Boolean isCorrectTheCedula()
        {
            if (validate.validateEmpty(cedula.Value) == true || validate.IsNumber(cedula.Value) == false)
            {
                return false;
            }

            return true;
        }


    }
}