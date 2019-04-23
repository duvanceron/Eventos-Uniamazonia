using EventosUniamazonia.Conexion;
using EventosUniamazonia.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.HtmlControls;

namespace EventosUniamazonia.Controllers
{
    public class PersonController
    {
        PersonModel person;
        Connection connect;
        String answer;
        public Encryption encrypt;
        public DataTable dataMenu;
        public DataTable loginPerson;
        public DataTable data;
        public int rowAfectadas;
        public PersonController()
        {
            person = new PersonModel();
            connect = new Connection();
            encrypt = new Encryption();
            loginPerson = new DataTable();
            data = new DataTable();
        }

        public String addPerson(int identification, String name1, string name2, String lastName1, String lastname2, String user, String password,String email)
        {
            person.identification = identification;
            person.name1 = name1;
            person.name2 = name2;
            person.lastname1 = lastName1;
            person.lastname2 = lastname2;
            person.username = user;
            person.password = encrypt.encrypt(password);
            person.email = email;
            answer = connect.insertData("INSERT INTO persona(cedula,primerNombre,segundoNombre,primerApellido,segundoApellido,usuario,passwordUser,email) values( '" + person.identification + "','" + person.name1 + "','" + person.name2 + "','" + person.lastname1 + "','" + person.lastname2 + "','" + person.username + "','" + person.password + "','" + person.email + "'); ");
            if (answer == null)
            {
                connect.insertData("INSERT INTO rolPersona (fkIdRol,fkCedulaPersona) Values('" + 2 + "','" + person.identification + "');");
            }
            return answer;


        }


        public DataTable logear(String username, String password)
        {
            person.username = username;
            person.password = encrypt.encrypt(password);
            String query = @"select persona.cedula,persona.primerNombre,rolpersona.fkIdRol,rol.Rol FROM persona 
                            INNER JOIN rolpersona ON rolpersona.fkCedulaPersona=persona.cedula
                            INNER JOIN rol ON rolpersona.fkIdRol=rol.idRol
                            where usuario='" + person.username + "'and passwordUser='" + person.password + "';";

            loginPerson = connect.QueryExecuteLogin(query);

            return loginPerson;
        }
        public DataTable searchPersons(int cc)
        {
            data = connect.executeConsult("Select primerNombre, segundoNombre, primerApellido,SegundoApellido,tema from persona where cedula like'" + cc + "';", CommandType.Text);
            return data;
        }
        public DataTable searchInformationPerson(int cc)
        {
            data = connect.executeConsult("Select primerNombre, segundoNombre, primerApellido,SegundoApellido,tema,email from persona where cedula='" + cc + "';", CommandType.Text);
            return data;
        }


        public DataTable consultUsers()
        {
            data = connect.executeConsult(@" SELECT person.cedula,person.primerNombre,person.segundoNombre,
                    person.primerApellido, person.segundoApellido,person.email,rol.Rol from persona as person
                    INNER JOIN rolpersona as rolP ON rolP.fkCedulaPersona=person.cedula
                    INNER JOIN rol ON rolP.fkIdRol=rol.idRol;", CommandType.Text);
            return data;
        }

        public DataTable consultRolByPerson(int cedula)
        {
            data = connect.executeConsult(@" SELECT person.cedula,person.primerNombre,person.segundoNombre,
                    person.primerApellido, person.segundoApellido,rol.Rol from persona as person
                    INNER JOIN rolpersona as rolP ON rolP.fkCedulaPersona=person.cedula
                    INNER JOIN rol ON rolP.fkIdRol=rol.idRol WHERE cedula='" + cedula + "';", CommandType.Text);
            return data;
        }

        public DataTable consultRoles()
        {
            data = connect.executeConsult(@"SELECT idRol,Rol from rol;", CommandType.Text);
            return data;
        }


        public int modifyRol(int cedula, int idRol)
        {

            person.identification = Convert.ToInt32(cedula);
            rowAfectadas = connect.updateData("UPDATE rolPersona SET fkIdRol = '" + idRol + "' WHERE fkCedulaPersona='" + person.identification + "' ");
            return rowAfectadas;
        }


        public List<PersonModel> GetUser(int cedula)
        {
            DataTable newData = connect.executeConsult("Select cedula,primerNombre, segundoNombre, primerApellido,SegundoApellido,tema from persona where cedula like'" + cedula + "%';", CommandType.Text);
            List<PersonModel> list = new List<PersonModel>();
            foreach (DataRow data in newData.Rows)
            {
                PersonModel x = new PersonModel();
                x.identification = Convert.ToInt32(data["cedula"]);
                x.name1 = data["primerNombre"].ToString();
                x.name2 = data["segundoNombre"].ToString();
                x.lastname1 = data["primerApellido"].ToString();
                x.lastname2 = data["segundoApellido"].ToString();
                x.theme = data["tema"].ToString();
                list.Add(x);
            }
            return list;
        }

        public String ModifyPerson(String theme, String ccSpeaker)
        {
            person.theme = theme;
            person.identification = Convert.ToInt32(ccSpeaker);
            answer = connect.insertData("UPDATE persona SET tema='" + person.theme + "' WHERE cedula='" + person.identification + "' ");
            if (answer == null)
            {
                answer = connect.insertData("UPDATE rolPersona SET fkIdRol = '" + 4 + "' WHERE fkCedulaPersona='" + person.identification + "' ");
            }
            return answer;
        }
        public DataTable consultMenu(String Rol)
        {

            String query = @"SELECT vista.idVista,vista.url,vista.estado,vista.descripcion,vista.IdMaster,vista.icono,persona.cedula FROM vista 
                            INNER JOIN rolvista ON rolvista.FkIdVista=vista.idVista
                            INNER JOIN rol ON rolvista.FkIdRol=rol.idRol
                            INNER JOIN rolpersona ON rolpersona.fkIdRol=rol.idRol
                            INNER JOIN persona ON rolpersona.fkCedulaPersona=persona.cedula
                            WHERE persona.cedula='" + Rol + "';";
            return connect.executeConsult(query, CommandType.Text);

        }
        public void loadMenu(String Rol, HtmlGenericControl divMenu)
        {
            dataMenu = consultMenu(Rol);
            List<Menu> levelMenu = new List<Menu>();

            //AsEnumerable devuelve un objeto enumerador  IEnumerable <T> (T es un datarow) 
            // el select Obtiene una matriz de todos los objetos DataRow que coinciden con los criterios de filtro.

            /* DataTable levelOne = dataMenu.AsEnumerable().Select(fila => {
                 DataRow row = dataMenu.NewRow();// crea un nuevo  datarow con el mismo esquema de la tabla
                 row["idVista"] = row.Field<String>("idVista");//field proporciona acceso a cada uno de los valores de la columna especificada
                 row["descripcion"] = row.Field<String>("descripcion");
                 row["idMaster"] = row.Field<Int32>("idMaster");
                 row["estado"] = row.Field<String>("descripcion");
                 row["icono"] = row.Field<String>("icono");
                 return row;
               }).Distinct(DataRowComparer.Default).CopyToDataTable();  //Distinct:  devuelve elementos utilizando el comparador de igual predeterminado
               */
            //Crear menu
            foreach (DataRow dataR in dataMenu.Rows)
            {
                if (Convert.ToInt32(dataR[0]) == Convert.ToInt32(dataR[4]))
                {
                    levelMenu.Add(new Menu(dataR));
                }
            }

            //Asignar vistas al menu.

            int index = 0;

            foreach (DataRow data in dataMenu.Rows)
            {
                int index2 = 0;
                foreach (Menu itemsM in levelMenu)
                {
                    if (Convert.ToString(data[4]) == Convert.ToString(levelMenu[index2].id) && Convert.ToInt32(data[0]) != Convert.ToInt32(data[4]))
                    {
                        levelMenu[index2].listView.Add(new vista(data));
                        index++;
                    }
                    index2++;
                }


            }

            HtmlGenericControl ulM = new HtmlGenericControl("ul");
            ulM.Attributes.Add("class", "nav navbar-nav");
            divMenu.Controls.Add(ulM);

            foreach (Menu it in levelMenu)
            {
                ulM.Controls.Add(it.createMenu());
            }

        }





    }

    public class Menu
    {
        public int id, parent;
        public String title, icon, state;
        public List<vista> listView = new List<vista>();
        public HtmlGenericControl ul, li, a;

        public Menu(DataRow row)
        {
            this.id = Convert.ToInt32(row["idVista"]);
            this.title = row["descripcion"].ToString();
            this.parent = Convert.ToInt32(row["idMaster"]);
            this.icon = row["icono"].ToString();
            this.state = row["estado"].ToString();
            ul = new HtmlGenericControl("ul");
            li = new HtmlGenericControl("li");
            a = new HtmlGenericControl("a");

        }

        public HtmlGenericControl createMenu()
        {
            a.InnerHtml = "<i class='" + icon + "'></i>  " + title;
            a.Attributes.Add("class", "dropdown-toggle");
            a.Attributes.Add("href ", "#");
            a.Attributes.Add("data-toggle ", "dropdown");
            a.Attributes.Add("aria-haspopup ", "true");
            a.Attributes.Add("aria-expanded ", "false");

            ul.Attributes.Add("class", "sub-menu children dropdown-menu");

            foreach (vista view in listView)
            {
                ul.Controls.Add(view.createView());
            }

            li.Controls.Add(a);
            li.Controls.Add(ul);
            li.Attributes.Add("class", "menu-item-has-children dropdown");

            return li;
        }


    }

    public class vista
    {
        public String title, icon, url, state;
        public int parent;
        HtmlGenericControl li, a;
        public vista(DataRow row)
        { //Represents a row of data in a DataTable.
            this.title = row["descripcion"].ToString();
            this.parent = Convert.ToInt32(row["idMaster"]);
            this.icon = row["icono"].ToString();
            this.state = row["estado"].ToString();
            this.url = row["url"].ToString();
            li = new HtmlGenericControl("li");//initializes a new instance of htmlGenericControl con la etiqueta li.
            a = new HtmlGenericControl("a");
        }

        public HtmlGenericControl createView()
        { //para representar un elemento de control de servidor HTML 
            a.InnerHtml = "<i class='" + icon + "'></i>" + title; //obtiene o establece el contenido que se encuentra dentro de la etiqueta.
            a.Attributes.Add("href", url);
            li.Controls.Add(a);//obtiene un objeto que representa los controles secundarios
            return li;

        }


    }
}