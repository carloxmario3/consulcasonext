using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class ClaseMuerte
{


    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();

    public string Id_fallecimiento { get; set; }
    public string Id_afiliado { get; set; }
    public string Causa_muerte { get; set; }
    public string Circustancias { get; set; }
    public string Fecha { get; set; }
    public string Hora { get; set; }
    public string Lugar { get; set; }


    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Muerte (Id_afiliado,Causa_muerte,Circustancias,Fecha,Hora,Lugar) VALUES (@1Id_afiliado,@1Causa_muerte,@1Circustancias,@1Fecha,@1Hora,@1Lugar)";



            sds.InsertParameters.Add("1Id_afiliado", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Causa_muerte", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Circustancias", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Fecha", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Hora", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Lugar", System.Data.DbType.String, "defecto");




            sds.InsertParameters["1Id_afiliado"].DefaultValue = this.Id_afiliado;
            sds.InsertParameters["1Causa_muerte"].DefaultValue = this.Causa_muerte;
            sds.InsertParameters["1Circustancias"].DefaultValue = this.Circustancias;
            sds.InsertParameters["1Fecha"].DefaultValue = this.Fecha;
            sds.InsertParameters["1Hora"].DefaultValue = this.Hora;
            sds.InsertParameters["1Lugar"].DefaultValue = this.Lugar;
            



            sds.Insert();


            info_operacion = "informacion Creada Con Exito";

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
