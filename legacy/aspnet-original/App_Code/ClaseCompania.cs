using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class ClaseCompania
{

    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();


    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();
        

    public int Id_compania
    {
        get;
        set;
    }

    public string Nombre
    {
        get;
        set;
    }


    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Compania(Nombre) VALUES (@nombre)";


            sds.InsertParameters.Add("nombre", System.Data.DbType.String, "defecto");


            sds.InsertParameters["nombre"].DefaultValue = Nombre;


            sds.Insert();

            info_operacion = "Cliente Creado Con Exito";


            if (Ejecutado_con_exito != null)
            {
                Ejecutado_con_exito();
            }

            
        }
        

        catch (SqlException ex)
        {
            info_operacion = ex.Message;


            if (Error_en_operacion != null)
            {
                Error_en_operacion();
            }

            
        }
        

    }


}
