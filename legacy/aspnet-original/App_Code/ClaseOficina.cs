using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;


public class ClaseOficina
{

    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();

    public string Id_oficina { get; set; }

    public string Id_compania { get; set; }

    public string Direccion { get; set; }

    public string Telefono { get; set; }

    public string Ubicacion { get; set; }



    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_oficina(Id_compania,Direccion,Telefono,Ubicacion) VALUES (@1compania,@1Direccion,@1Telefono,@1Ubicacion)";


            sds.InsertParameters.Add("1compania", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Direccion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Telefono", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ubicacion", System.Data.DbType.String, "defecto");



            sds.InsertParameters["1compania"].DefaultValue = this.Id_compania;
            sds.InsertParameters["1Direccion"].DefaultValue = this.Direccion;
            sds.InsertParameters["1Telefono"].DefaultValue = this.Telefono;
            sds.InsertParameters["1Ubicacion"].DefaultValue = this.Ubicacion;


            sds.Insert();


            info_operacion = "Oficina Creada Con Exito";

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
