using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

public class ClaseUsuario
{




    public void leeridusuario(string correousu, ref string id_usuariook,ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.SelectCommand = "Select UserId FROM  aspnet_Users  WHERE (UserName = @1UserName)";

                                  



            sds.SelectParameters.Add("1UserName", System.Data.DbType.String, "defecto");



            sds.SelectParameters["1UserName"].DefaultValue = correousu;
            



            sds.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registro = default(SqlDataReader);


            registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);
                        
           

            if (registro.Read())
            {

                id_usuariook = Convert.ToString(registro["UserId"]);
                
            }
            else
            {

                label_mensaje = "No existe usuario o pasword";

            }


        }
        catch (SqlException ex)
        {
            label_mensaje = ex.Message;
        }


    }

    




}
