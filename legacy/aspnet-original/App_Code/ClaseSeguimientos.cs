using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class ClaseSeguimientos
{
    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();


    public string Id_seguimientos { get; set; }
    public string Id_afiliado { get; set; }
    public string Celular { get; set; }
    public string Ciudad { get; set; }
    public string Direccion { get; set; }
    public string Entidad { get; set; }
    public string Extencion { get; set; }
    public string Fecha { get; set; }
    public string Hora { get; set; }
    public string Nombre_contacto { get; set; }
    public string Telefono { get; set; }



    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Seguimientos (Id_afiliado,Celular,Ciudad,Direccion,Entidad,Extencion,Fecha,Hora,Nombre_contacto,Telefono) VALUES (@1Id_afiliado,@1Celular,@1Ciudad,@1Direccion,@1Entidad,@1Extencion,@1Fecha,@1Hora,@1Nombre_contacto,@1Telefono)";


            sds.InsertParameters.Add("1Id_afiliado", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Celular", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ciudad", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Direccion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Entidad", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Extencion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Fecha", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Hora", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Nombre_contacto", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Telefono", System.Data.DbType.String, "defecto");




            sds.InsertParameters["1Id_afiliado"].DefaultValue = this.Id_afiliado;
            sds.InsertParameters["1Celular"].DefaultValue = this.Celular;
            sds.InsertParameters["1Ciudad"].DefaultValue = this.Ciudad;
            sds.InsertParameters["1Direccion"].DefaultValue = this.Direccion;
            sds.InsertParameters["1Entidad"].DefaultValue = this.Entidad;
            sds.InsertParameters["1Extencion"].DefaultValue = this.Extencion;
            sds.InsertParameters["1Fecha"].DefaultValue = this.Fecha;
            sds.InsertParameters["1Hora"].DefaultValue = this.Hora;
            sds.InsertParameters["1Nombre_contacto"].DefaultValue = this.Nombre_contacto;
            sds.InsertParameters["1Telefono"].DefaultValue = this.Telefono;
            


            sds.Insert();


            info_operacion = "Cita Creados Con Exito";

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
