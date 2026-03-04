using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI;

public class ClaseResumenes
{

    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();


    public string Id_resumenes { get; set; }
    public string Id_numero_de_Caso { get; set; }
    public string Fecha { get; set; }
    public string Informe { get; set; }
    public string Id_estadodocus { get; set; }



    public void traercaso(string numeroderesumen, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.SelectCommand = "Select * FROM  Tabla_Resumenes  WHERE (Id_resumenes = @1Id_resumenes)";




            sds.SelectParameters.Add("1Id_resumenes", System.Data.DbType.String, "defecto");



            sds.SelectParameters["1Id_resumenes"].DefaultValue = numeroderesumen;




            sds.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registro = default(SqlDataReader);


            registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



            if (registro.Read())
            {

                Informe = Convert.ToString(registro["Informe"]);

            }
            else
            {

                label_mensaje = "el caso no existe";

            }


        }
        catch (SqlException ex)
        {
            label_mensaje = ex.Message;
        }


    }




    public void actualizarestado(string codigoanexo, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.UpdateCommand = "UPDATE  Tabla_Resumenes SET Id_estadodocus = @estadodocus WHERE (Id_resumenes = @informe)";




            sds.UpdateParameters.Add("informe", System.Data.DbType.String, "defecto");

            sds.UpdateParameters.Add("estadodocus", System.Data.DbType.String, "defecto");





            sds.UpdateParameters["informe"].DefaultValue = codigoanexo;

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



    public void actualizarinforme(string codigoanexo, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.UpdateCommand = "UPDATE  Tabla_Resumenes SET Informe = @1Informe WHERE (Id_resumenes = @1Id_resumenes)";




            sds.UpdateParameters.Add("1Informe", System.Data.DbType.String, "defecto");

            sds.UpdateParameters.Add("1Id_resumenes", System.Data.DbType.String, "defecto");





            sds.UpdateParameters["1Id_resumenes"].DefaultValue = codigoanexo;

            sds.UpdateParameters["1Informe"].DefaultValue = this.Informe;


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

            sds.InsertCommand = "INSERT INTO Tabla_Resumenes (Id_numero_de_Caso,Fecha,Informe,Id_estadodocus) VALUES (@1Id_numero_de_Caso,@1Fecha,@1Informe,@1Id_estadodocus)";


            sds.InsertParameters.Add("1Id_numero_de_Caso", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Fecha", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Informe", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_estadodocus", System.Data.DbType.String, "defecto");




            sds.InsertParameters["1Id_numero_de_Caso"].DefaultValue = this.Id_numero_de_Caso;
            sds.InsertParameters["1Fecha"].DefaultValue = this.Fecha;
            sds.InsertParameters["1Informe"].DefaultValue = this.Informe;
            sds.InsertParameters["1Id_estadodocus"].DefaultValue = this.Id_estadodocus;
            
           


            sds.Insert();


            info_operacion = "Resumen Creado con Exito";

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
