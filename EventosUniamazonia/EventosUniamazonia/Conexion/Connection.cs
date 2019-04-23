using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace EventosUniamazonia.Conexion
{
    public class Connection
    {
        public String strConn { get; set; }
        public MySqlConnection connect { get; set; }
        public MySqlCommand cmd { get; set; }
        public String answer;
        public DataTable data;
        public MySqlDataAdapter mysqlAdap;
        int rowafectadas;
        public Connection()
        {
            strConn = ConfigurationManager.ConnectionStrings["connectionMysql"].ConnectionString;
            connect = new MySqlConnection(strConn);
            cmd = new MySqlCommand(); //Representa una instrucción SQL para ejecutar contra una base de datos MySQL.
            data = new DataTable();
        }
        public Boolean openConnection()
        {
            try
            {
                connect.Open();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public Boolean closeConnection()
        {
            try
            {
                connect.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public String insertData(String Query)
        {
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        cmd.ExecuteNonQuery();
                        closeConnection();
                    }
                    catch
                    {
                        answer = "Error en la ejecucion de la consulta";
                    }
                }
                catch
                {
                    answer = "error en la consulta";
                }
            }
            else
            {
                answer = "Error en la conexion";

            }
            return answer;
        }
        public DataTable QueryExecuteLogin(String Query)
        {

            if (openConnection())
            {
                cmd.Connection = connect;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = Query;
                mysqlAdap = new MySqlDataAdapter(cmd);
                mysqlAdap.Fill(data);
                /* if (data.Rows.Count >= 1)
                 {
                     answer = data.Rows[0][6].ToString();

                 }
                 else {
                     answer = "";
                 }*/

            }
            else
            {
                answer = "Error  en la conexion";
            }
            return data;
        }

        public DataTable executeConsult(string sentencia, CommandType TipoComando)
        {
            MySqlDataAdapter adaptador = new MySqlDataAdapter();
            adaptador.SelectCommand = new MySqlCommand(sentencia, connect);
            adaptador.SelectCommand.CommandType = TipoComando;

            DataSet resultado = new DataSet();
            adaptador.Fill(resultado);

            return resultado.Tables[0];
        }


        public String RemoveData(String Query)
        {
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        cmd.ExecuteNonQuery();
                        closeConnection();
                    }
                    catch
                    {
                        answer = "Error en la ejecucion de la consulta";
                    }
                }
                catch
                {
                    answer = "error en la consulta";
                }
            }
            else
            {
                answer = "Error en la conexion";

            }
            return answer;
        }



        public int updateData(String Query)
        {
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        rowafectadas= cmd.ExecuteNonQuery();
                        closeConnection();
                    }
                    catch
                    {
                        answer = "Error en la ejecucion de la consulta";
                    }
                }
                catch
                {
                    answer = "error en la consulta";
                }
            }
            else
            {
                answer = "Error en la conexion";

            }
            return rowafectadas;
        }



    }



}