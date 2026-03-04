using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI;

public class ClaseAfiliado
{


    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();


    public string Id_afiliado { get; set; }
    public string Id_laborales { get; set; }
    public string Id_Numero_Caso { get; set; }
    public string Apellido { get; set; }
    public string Barrio { get; set; }
    public string Cedula { get; set; }
    public string Celular { get; set; }
    public string Ciudad { get; set; }
    public string Direccion { get; set; }
    public string Nombre { get; set; }
    public string Telefono { get; set; }



    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_Afiliado (Id_laborales,Id_Numero_Caso,Apellido,Barrio,Cedula,Celular,Ciudad,Direccion,Nombre,Telefono) VALUES (@1Id_laborales,@1Id_Numero_Caso,@1Apellido,@1Barrio,@1Cedula,@1Celular,@1Ciudad,@1Direccion,@1Nombre,@1Telefono)";



            sds.InsertParameters.Add("1Id_laborales", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Apellido", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Barrio", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Cedula", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Celular", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ciudad", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Direccion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Nombre", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Telefono", System.Data.DbType.String, "defecto");



            sds.InsertParameters["1Id_laborales"].DefaultValue = this.Id_laborales;
            sds.InsertParameters["1Id_Numero_Caso"].DefaultValue = this.Id_Numero_Caso;
            sds.InsertParameters["1Apellido"].DefaultValue = this.Apellido;
            sds.InsertParameters["1Barrio"].DefaultValue = this.Barrio;
            sds.InsertParameters["1Cedula"].DefaultValue = this.Cedula;
            sds.InsertParameters["1Celular"].DefaultValue = this.Celular;
            sds.InsertParameters["1Ciudad"].DefaultValue = this.Ciudad;
            sds.InsertParameters["1Direccion"].DefaultValue = this.Direccion;
            sds.InsertParameters["1Nombre"].DefaultValue = this.Nombre;
            sds.InsertParameters["1Telefono"].DefaultValue = this.Telefono;
            


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



    public void leeridafiliado(string caso, ref string id_afiliado, ref string label_mensaje)
    {


        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.SelectCommand = "Select Id_afiliado FROM  Tabla_Afiliado  WHERE (Id_Numero_Caso = @1Id_Numero_Caso)";





            sds.SelectParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");



            sds.SelectParameters["1Id_Numero_Caso"].DefaultValue = caso;




            sds.DataSourceMode = SqlDataSourceMode.DataReader;

            SqlDataReader registro = default(SqlDataReader);


            registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



            if (registro.Read())
            {

                id_afiliado = Convert.ToString(registro["Id_afiliado"]);

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
