using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI;


public class ClaseAnalista
{


    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();



    public string Id_analista { get; set; }


    public string Id_usuario { get; set; }


    public string Id_oficina { get; set; }


    public string Celular { get; set; }


    public string Extencion { get; set; }


    public string Nombres { get; set; }


    public string Apellidos { get; set; }


    public string Telefono { get; set; }


    public string Correo { get; set; }

    public string Id_usernuevo { get; set; }


    public string correodelanalista { get; set; }


    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Analista(Id_usuario,Id_oficina,Celular,Extencion,Nombres,Apellidos,Telefono,Correo,Id_usernuevo) VALUES (@1Id_usuario,@1Id_oficina,@1Celular,@1Extencion,@1Nombres,@1Apellidos,@1Telefono,@1Correo,@1Id_usernuevo)";




            sds.InsertParameters.Add("1Id_usuario", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_oficina", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Celular", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Extencion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Nombres", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Apellidos", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Telefono", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Correo", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_usernuevo", System.Data.DbType.Guid, "defecto");


            sds.InsertParameters["1Id_usuario"].DefaultValue = this.Id_usuario;
            sds.InsertParameters["1Id_oficina"].DefaultValue = this.Id_oficina;
            sds.InsertParameters["1Celular"].DefaultValue = this.Celular;
            sds.InsertParameters["1Extencion"].DefaultValue = this.Extencion;
            sds.InsertParameters["1Nombres"].DefaultValue = this.Nombres;
            sds.InsertParameters["1Apellidos"].DefaultValue = this.Apellidos;
            sds.InsertParameters["1Telefono"].DefaultValue = this.Telefono;
            sds.InsertParameters["1Correo"].DefaultValue = this.Correo;
            sds.InsertParameters["1Id_usernuevo"].DefaultValue = this.Id_usernuevo;

            sds.Insert();


            info_operacion = "Analista Creado Con Exito";

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




    public void traeriddeanalista(string correoanalista, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.SelectCommand = "SELECT  Id_analista, Correo FROM  Tabla_Analista WHERE   (Correo = @1Correo)";





            sds.SelectParameters.Add("1Correo", System.Data.DbType.String, "defecto");



            sds.SelectParameters["1Correo"].DefaultValue = correoanalista;




            sds.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registro = default(SqlDataReader);


            registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



            if (registro.Read())
            {

                
                Id_analista = Convert.ToString(registro["Id_analista"]);
                                                

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



    public void traercorreodelanalista(string idanalista, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.SelectCommand = "SELECT   Correo FROM  Tabla_Analista WHERE   (Id_analista = @1Id_analista)";


            sds.SelectParameters.Add("1Id_analista", System.Data.DbType.String, "defecto");



            sds.SelectParameters["1Id_analista"].DefaultValue = idanalista;




            sds.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registro = default(SqlDataReader);


            registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



            if (registro.Read())
            {


                correodelanalista = Convert.ToString(registro["Correo"]);


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




}
