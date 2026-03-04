using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public class ClaseInvestigador
{


    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();

    public string Id_Investigador { get; set; }
    public string Id_usuario { get; set; }
    public string Barrio { get; set; }
    public string Cedula { get; set; }
    public string Celular { get; set; }
    public string Ubicacion { get; set; }
    public string Apellidos { get; set; }
    public string Nombres { get; set; }
    public string Direccion { get; set; }
    public string Telefono_fijo { get; set; }
    public string Correo { get; set; }
    public string Id_usernuevo { get; set; }



    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Investigador(Id_usuario,Barrio,Cedula,Celular,Ubicacion,Apellidos,Nombres,Direccion,Telefono_fijo,Correo,Id_usernuevo) VALUES (@1Id_usuario,@1Barrio,@1Cedula,@1Celular,@1Ubicacion,@1Apellidos,@1Nombres,@1Direcion,@1Telefono_fijo,@1Correo,@1Id_usernuevo)";

          

            sds.InsertParameters.Add("1Id_usuario", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Barrio", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Cedula", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Celular", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ubicacion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Apellidos", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Nombres", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Direcion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Telefono_fijo", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Correo", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_usernuevo", System.Data.DbType.Guid, "6b87ab38-93e9-4266-a94d-7d9ae8007e83");



            sds.InsertParameters["1Id_usuario"].DefaultValue = this.Id_usuario;
            sds.InsertParameters["1Barrio"].DefaultValue = this.Barrio;
            sds.InsertParameters["1Cedula"].DefaultValue = this.Cedula;
            sds.InsertParameters["1Celular"].DefaultValue = this.Celular;
            sds.InsertParameters["1Ubicacion"].DefaultValue = this.Ubicacion;
            sds.InsertParameters["1Apellidos"].DefaultValue = this.Apellidos;
            sds.InsertParameters["1Nombres"].DefaultValue = this.Nombres;
            sds.InsertParameters["1Direcion"].DefaultValue = this.Direccion;
            sds.InsertParameters["1Telefono_fijo"].DefaultValue = this.Telefono_fijo;
            sds.InsertParameters["1Correo"].DefaultValue = this.Correo;
            sds.InsertParameters["1Id_usernuevo"].DefaultValue = this.Id_usernuevo;


            sds.Insert();


            info_operacion = "investigador Creado Con Exito";

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
