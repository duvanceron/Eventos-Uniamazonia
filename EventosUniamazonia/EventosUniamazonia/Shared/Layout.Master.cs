using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventosUniamazonia.Conexion;
using MySql.Data.MySqlClient;
using System.Data;
using EventosUniamazonia.Controllers;

namespace EventosUniamazonia.Shared
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        public Connection conexion { get; set; }
        public MySqlCommand cmd;
        public MySqlDataAdapter mysqlAdap;
        public DataTable DTable;//son tablas
        public DataSet DSet;//conjunto de tablas que estan relacionadas(DB)
        public MenuItem myMenuItem;
        public MenuItem MenuSon;
        PersonController person;
        public Layout()
        {
            conexion = new Connection();
            cmd = new MySqlCommand();//Representa una instrucción SQL para ejecutar contra una base de datos MySQL.
            DSet = new DataSet();
            DTable = null;
            person = new PersonController();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            // { } indica si la pagina se carga por primera vez
            if (Session["LoginUser"] == null)//no existe la sesion    
            {
                Response.Redirect("../../Views/Person/Login");//asi obligamos que debe pasar por el login     
            }

            labelUser.InnerHtml = Session["LoginUser"].ToString().ToUpper();
            person.loadMenu(Session["idRol"].ToString(), menu);
            String val = Session["idRol"].ToString();


        }

        protected void exit_Click(object sender, EventArgs e)
        {
        }

        public void buildMenu()
        {
            cmd.Connection = conexion.connect;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select *from vista";
            mysqlAdap = new MySqlDataAdapter(cmd);

            if (conexion.openConnection())
            {
                mysqlAdap.Fill(DSet);//lleno mi dataSet con la consulta.
                DTable = DSet.Tables[0]; //Obtiene el objeto dataTable en el indice es especificado.
                if (DTable != null && DTable.Rows.Count > 0)
                {
                    foreach (DataRow data in DTable.Rows)
                    {
                        if (Convert.ToInt32(data[0]) == Convert.ToInt32(data[4]))
                        {
                            // myMenuItem = new MenuItem(Convert.ToString(data[3]), Convert.ToString(data[0]), Convert.ToString(data[5]), Convert.ToString(data[1]));//representa un elemento de menu mostrado en el control
                            //this.menuView.Items.Add(myMenuItem); //obtiene un objeto menu item que contiene todos los elementos del menu(items), y agrega mis items a mi menu
                            //  AddSonsItem();
                        }
                    }
                }
            }
        }
        public void AddSonsItem()
        {
            foreach (DataRow data in DTable.Rows)
            {
                if (Convert.ToString(data[4]) == myMenuItem.Value && Convert.ToInt32(data[0]) != Convert.ToInt32(data[4]))
                {
                    MenuSon = new MenuItem(Convert.ToString(data[3]), Convert.ToString(data[0]), Convert.ToString(data[5]), Convert.ToString(data[1]));// texto del menú, el valor, la URL de la imagen y la URL de navegación especificados.
                    myMenuItem.ChildItems.Add(MenuSon);
                    //Funcion recursiva que cada vez que inserte un subItem al item padre se vuelve a ejecutar para revisar si existe un subitem del subitem

                }
            }
        }


    }
}