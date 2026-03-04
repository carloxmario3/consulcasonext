using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class ClaseInformes
{

    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();


    public string Id_informe { get; set; }
    public string Id_tipoinforme { get; set; }
    public string Id_numero_de_Caso { get; set; }
    public string Ruta_Pdf { get; set; }
    public string Ruta_word { get; set; }
    public string Id_estadodocus { get; set; }


    public void actualizarruta(string codigo, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.UpdateCommand = "UPDATE  Tabla_informes SET Ruta_word = @1Ruta WHERE (Id_informe = @codigo)";




            sds.UpdateParameters.Add("codigo", System.Data.DbType.String, "defecto");

            sds.UpdateParameters.Add("1Ruta", System.Data.DbType.String, "defecto");





            sds.UpdateParameters["codigo"].DefaultValue = codigo;

            sds.UpdateParameters["1Ruta"].DefaultValue = this.Ruta_word;


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




    public void actualizarestado(string codigoinforme, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.UpdateCommand = "UPDATE  Tabla_Informes SET Id_estadodocus = @estadodocus WHERE (Id_informe = @informe)";




            sds.UpdateParameters.Add("informe", System.Data.DbType.String, "defecto");

            sds.UpdateParameters.Add("estadodocus", System.Data.DbType.String, "defecto");





            sds.UpdateParameters["informe"].DefaultValue = codigoinforme;

            sds.UpdateParameters["estadodocus"].DefaultValue = this.Id_estadodocus;


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

            sds.InsertCommand = "INSERT INTO Tabla_Informes (Id_tipoinforme,Id_numero_de_Caso,Ruta_Pdf,Ruta_word,Id_estadodocus) VALUES (@1Id_tipoinforme,@1Id_numero_de_Caso,@1Ruta_Pdf,@1Ruta_word,@1Id_estadodocus)";


            sds.InsertParameters.Add("1Id_tipoinforme", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_numero_de_Caso", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ruta_Pdf", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ruta_word", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_estadodocus", System.Data.DbType.String, "defecto");

                        
            sds.InsertParameters["1Id_tipoinforme"].DefaultValue = this.Id_tipoinforme;
            sds.InsertParameters["1Id_numero_de_Caso"].DefaultValue = this.Id_numero_de_Caso;
            sds.InsertParameters["1Ruta_Pdf"].DefaultValue = this.Ruta_Pdf;
            sds.InsertParameters["1Ruta_word"].DefaultValue = this.Ruta_word;
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
