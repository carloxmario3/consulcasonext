using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class ClaseAnexos
{

    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();


    public string Id_anexos { get; set; }
    public string Id_informe { get; set; }
    public string Tipodedocumento { get; set; }
    public string Ruta { get; set; }
    public string Id_estadodocus { get; set; }



   





    public void actualizarruta(string codigoanexo, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.UpdateCommand = "UPDATE  Tabla_Anexos SET Ruta = @1Ruta WHERE (Id_anexos = @anexos)";




            sds.UpdateParameters.Add("anexos", System.Data.DbType.String, "defecto");

            sds.UpdateParameters.Add("1Ruta", System.Data.DbType.String, "defecto");
          


           

            sds.UpdateParameters["anexos"].DefaultValue = codigoanexo;

            sds.UpdateParameters["1Ruta"].DefaultValue = this.Ruta;
            
            
            int cant;

            cant = sds.Update();


            if (cant == 1)
            {
                label_mensaje = "Se modificaron los datos";
            }

            else
            {

                label_mensaje = "No existe dicho usuario";
            }


        }
        catch (SqlException ex)
        {
            label_mensaje = ex.Message;

        }





    }





    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Anexos (Id_informe,Tipodedocumento,Ruta,Id_estadodocus) VALUES (@1Id_informe,@1Tipodedocumento,@1Ruta,@1Id_estadodocus)";


            sds.InsertParameters.Add("1Id_informe", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Tipodedocumento", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ruta", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_estadodocus", System.Data.DbType.String, "defecto");




            sds.InsertParameters["1Id_informe"].DefaultValue = this.Id_informe;
            sds.InsertParameters["1Tipodedocumento"].DefaultValue = this.Tipodedocumento;
            sds.InsertParameters["1Ruta"].DefaultValue = this.Ruta;
            sds.InsertParameters["1Id_estadodocus"].DefaultValue = this.Id_estadodocus;




            sds.Insert();


            info_operacion = "Recurso Creado Con Exito";

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
