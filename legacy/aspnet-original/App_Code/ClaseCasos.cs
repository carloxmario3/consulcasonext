using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI;

public class ClaseCasos
{



    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();

 public string Id_Numero_Caso { get; set; }
 public string Id_tipocaso { get; set; }
 public string Id_estado { get; set; }
 public string Id_analista { get; set; }
 public string Id_investigador { get; set; }
 public string Fecha_asignacion { get; set; }
 public string Fecha_posibleentrega { get; set; }
 public string Fecha_entregareal { get; set; }
 public string Ciudad { get; set; }
 public string Observaciones { get; set; }
 public string compania { get; set; }

 public string oficina { get; set; }


 public void actualizarasignado(string codigo, ref string label_mensaje)
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         sds.UpdateCommand = "UPDATE  Tabla_Casos SET Id_investigador = @1Id_investigador WHERE (Id_Numero_Caso = @1Id_Numero_Caso)";




         sds.UpdateParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");

         sds.UpdateParameters.Add("1Id_investigador", System.Data.DbType.String, "defecto");





         sds.UpdateParameters["1Id_Numero_Caso"].DefaultValue = codigo;

         sds.UpdateParameters["1Id_investigador"].DefaultValue = this.Id_investigador;


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

 public void actualizarestado(string codigo, ref string label_mensaje)
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         sds.UpdateCommand = "UPDATE  Tabla_Casos SET Id_estado = @1Id_estado WHERE (Id_Numero_Caso = @1Id_Numero_Caso)";




         sds.UpdateParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");

         sds.UpdateParameters.Add("1Id_estado", System.Data.DbType.String, "defecto");





         sds.UpdateParameters["1Id_Numero_Caso"].DefaultValue = codigo;

         sds.UpdateParameters["1Id_estado"].DefaultValue = this.Id_estado;


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

         sds.InsertCommand = "INSERT INTO Tabla_Casos(Id_tipocaso,Id_estado,Id_analista,Id_investigador,Fecha_asignacion,Fecha_posibleentrega,Fecha_entregareal,Observaciones,Ciudad) VALUES (@1Id_tipocaso,@1Id_estado,@1Id_analista,@1Id_investigador,@1Fecha_asignacion,@1Fecha_posibleentrega,@1Fecha_entregareal,@1Observaciones,@1Ciudad)";


         sds.InsertParameters.Add("1Id_tipocaso", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Id_estado", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Id_analista", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Id_investigador", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Fecha_asignacion", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Fecha_posibleentrega", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Fecha_entregareal", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Ciudad", System.Data.DbType.String, "defecto");
         sds.InsertParameters.Add("1Observaciones", System.Data.DbType.String, "defecto");


         sds.InsertParameters["1Id_tipocaso"].DefaultValue = this.Id_tipocaso;
         
         
         sds.InsertParameters["1Id_estado"].DefaultValue = this.Id_estado;
         
         
         sds.InsertParameters["1Id_analista"].DefaultValue = this.Id_analista;
         
         sds.InsertParameters["1Id_investigador"].DefaultValue = this.Id_investigador;
         sds.InsertParameters["1Fecha_asignacion"].DefaultValue = this.Fecha_asignacion;
         sds.InsertParameters["1Fecha_posibleentrega"].DefaultValue = this.Fecha_posibleentrega;
         sds.InsertParameters["1Fecha_entregareal"].DefaultValue = this.Fecha_entregareal;
         sds.InsertParameters["1Ciudad"].DefaultValue = this.Ciudad;
         sds.InsertParameters["1Observaciones"].DefaultValue = this.Observaciones;
         


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



    

 public void traercaso(string numerodecasook, ref string label_mensaje)
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         //sds.SelectCommand = "Select * FROM  Tabla_Casos  WHERE (Id_Numero_Caso = @1Id_Numero_Caso)";

         sds.SelectCommand = "SELECT     Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal,  Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipocaso, Tabla_Estado.Nombre AS estado, Tabla_Analista.Nombres AS analistanombre, Tabla_Analista.Apellidos AS analistaapellido, Tabla_Investigador.Nombres AS investigadornombre, Tabla_Investigador.Apellidos AS investigadorapellido,  Tabla_Compania.Nombre, Tabla_oficina.Direccion, Tabla_Ciudades.Ciudad FROM Tabla_Casos INNER JOIN   Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN  Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN  Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania INNER JOIN  Tabla_Ciudades ON Tabla_oficina.Ubicacion = Tabla_Ciudades.Id_ciudad WHERE  (Tabla_Casos.Id_Numero_Caso = @1Id_Numero_Caso)";



         sds.SelectParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");



         sds.SelectParameters["1Id_Numero_Caso"].DefaultValue = numerodecasook;




         sds.DataSourceMode = SqlDataSourceMode.DataReader;

         SqlDataReader registro = default(SqlDataReader);


         registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



         if (registro.Read())
         {

             

             Id_Numero_Caso = Convert.ToString(registro["Id_Numero_Caso"]);
             
             Id_tipocaso = Convert.ToString(registro["tipocaso"]);

             compania = Convert.ToString(registro["Nombre"]);

             oficina = Convert.ToString(registro["Direccion"]) +"  "+ Convert.ToString(registro["Ciudad"]);

             Id_analista = Convert.ToString(registro["analistanombre"]) +"  "+ Convert.ToString(registro["analistaapellido"]);
             
             Id_estado = Convert.ToString(registro["estado"]);

             Fecha_asignacion = Convert.ToString(registro["Fecha_asignacion"]);
                         
             
            Id_investigador = Convert.ToString(registro["investigadornombre"]) +"  "+ Convert.ToString(registro["investigadorapellido"]); ;
                        
                         
             Fecha_posibleentrega = Convert.ToString(registro["Fecha_posibleentrega"]);
             
             Fecha_entregareal = Convert.ToString(registro["Fecha_entregareal"]);
             
             Observaciones = Convert.ToString(registro["Observaciones"]);
             
             
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





 public void traercasobasico(string numerodecasook, ref string label_mensaje)
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         sds.SelectCommand = "SELECT  Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Id_tipocaso, Tabla_Casos.Id_estado, Tabla_Casos.Id_analista, Tabla_Casos.Id_investigador, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones , Tabla_Casos.Ciudad , Tabla_oficina.Id_oficina,  Tabla_Compania.Id_compania FROM      Tabla_Casos INNER JOIN  Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN  Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania WHERE   (Tabla_Casos.Id_Numero_Caso = @1Id_Numero_Caso)";

        
         sds.SelectParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");



         sds.SelectParameters["1Id_Numero_Caso"].DefaultValue = numerodecasook;




         sds.DataSourceMode = SqlDataSourceMode.DataReader;

         SqlDataReader registro = default(SqlDataReader);


         registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



         if (registro.Read())
         {




             Id_tipocaso = Convert.ToString(registro["Id_tipocaso"]);

             compania = Convert.ToString(registro["Id_compania"]);

             oficina = Convert.ToString(registro["Id_oficina"]);

             Id_analista = Convert.ToString(registro["Id_analista"]);
                          
             Fecha_asignacion = Convert.ToString(registro["Fecha_asignacion"]);

             Fecha_posibleentrega = Convert.ToString(registro["Fecha_posibleentrega"]);
             
             Observaciones = Convert.ToString(registro["Observaciones"]);

             Ciudad = Convert.ToString(registro["Ciudad"]);

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

    

 public void actualizarcaso(string numerodecasook, ref string label_mensaje)
 
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         sds.UpdateCommand = "UPDATE Tabla_Casos SET Id_tipocaso = @1Id_tipocaso,Id_analista = @1Id_analista,Fecha_asignacion = @1Fecha_asignacion,Fecha_posibleentrega = @1Fecha_posibleentrega,Fecha_entregareal = @1Fecha_entregareal,Observaciones = @1Observaciones,Ciudad = @1Ciudad WHERE (Id_Numero_Caso = @1Id_Numero_Caso)";


         sds.UpdateParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Id_tipocaso", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Id_analista", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Fecha_asignacion", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Fecha_posibleentrega", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Fecha_entregareal", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Observaciones", System.Data.DbType.String, "defecto");
         sds.UpdateParameters.Add("1Ciudad", System.Data.DbType.String, "defecto");


         sds.UpdateParameters["1Id_Numero_Caso"].DefaultValue = numerodecasook;

         sds.UpdateParameters["1Id_tipocaso"].DefaultValue = this.Id_tipocaso;
         sds.UpdateParameters["1Id_analista"].DefaultValue = this.Id_analista;
         sds.UpdateParameters["1Fecha_asignacion"].DefaultValue = this.Fecha_asignacion;
         sds.UpdateParameters["1Fecha_posibleentrega"].DefaultValue = this.Fecha_posibleentrega;
         sds.UpdateParameters["1Fecha_entregareal"].DefaultValue = this.Fecha_entregareal;
         sds.UpdateParameters["1Observaciones"].DefaultValue = this.Observaciones;
         sds.UpdateParameters["1Ciudad"].DefaultValue = this.Ciudad;


         int cant ; 

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



 public void traerultimocaso(ref string casomasreciente)
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         sds.SelectCommand = "SELECT MAX(Id_Numero_Caso) AS numeromasalto FROM  Tabla_Casos";


         

         sds.DataSourceMode = SqlDataSourceMode.DataReader;

         SqlDataReader registro = default(SqlDataReader);


         registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



         if (registro.Read())
         {

             

             casomasreciente = Convert.ToString(registro["numeromasalto"]);

             
          }
         else
         {

             

         }


     }
     
     catch (SqlException ex)
     {
         
     }


 }



 public void traertipodecaso(string numerodecasook, ref string label_mensaje)
 {


     try
     {

         ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
         SqlDataSource sds = new SqlDataSource();


         sds.ConnectionString = cts.ConnectionString;

         sds.SelectCommand = "SELECT  Tabla_Tipodecaso.Nombre, Tabla_Casos.Id_Numero_Caso FROM  Tabla_Casos INNER JOIN  Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso WHERE   (Tabla_Casos.Id_Numero_Caso = @1Id_Numero_Caso)";


         sds.SelectParameters.Add("1Id_Numero_Caso", System.Data.DbType.String, "defecto");



         sds.SelectParameters["1Id_Numero_Caso"].DefaultValue = numerodecasook;




         sds.DataSourceMode = SqlDataSourceMode.DataReader;

         SqlDataReader registro = default(SqlDataReader);


         registro = (SqlDataReader)sds.Select(DataSourceSelectArguments.Empty);



         if (registro.Read())
         {




             Id_tipocaso = Convert.ToString(registro["Nombre"]);

            
             


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
