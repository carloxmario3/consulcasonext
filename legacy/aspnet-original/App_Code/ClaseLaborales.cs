using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public class ClaseLaborales
{


    public event Ejecutado_con_exitoEventHandler Ejecutado_con_exito;
    public delegate void Ejecutado_con_exitoEventHandler();

    public event Error_en_operacionEventHandler Error_en_operacion;
    public delegate void Error_en_operacionEventHandler();

public string Id_laborales { get; set; }

public string Id_afiliado { get; set; }
public string Id_reclamantes { get; set; }

public string Barrio { get; set; }
public string Cargo { get; set; }
public string Celular { get; set; }
public string Ciudad { get; set; }
public string Direccion { get; set; }
public string Email_contacto { get; set; }
public string Email_empresa { get; set; }
public string Extencion { get; set; }
public string Fax { get; set; }
public string Nombre_empresa { get; set; }
public string Persona_Contacto { get; set; }
public string Telefono { get; set; }



    public void nuevo(ref string info_operacion)
    {

        try
        {

            ConnectionStringSettings cts = ConfigurationManager.ConnectionStrings["OkConexionBase"];
            SqlDataSource sds = new SqlDataSource();


            sds.ConnectionString = cts.ConnectionString;

            sds.InsertCommand = "INSERT INTO Tabla_laborales (Id_afiliado,Id_reclamantes,Barrio,Cargo,Celular,Ciudad,Direccion,Email_contacto,Email_empresa,Extencion,Fax,Nombre_empresa,Persona_Contacto,Telefono) VALUES (@1Id_afiliado,@1Id_reclamantes,@1Barrio,@1Cargo,@1Celular,@1Ciudad,@1Direccion,@1Email_contacto,@1Email_empresa,@1Extencion,@1Fax,@1Nombre_empresa,@1Persona_Contacto,@1Telefono)";


            sds.InsertParameters.Add("1Id_afiliado", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Id_reclamantes", System.Data.DbType.String, "defecto");
        
            sds.InsertParameters.Add("1Barrio", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Cargo", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Celular", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Ciudad", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Direccion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Email_contacto", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Email_empresa", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Extencion", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Fax", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Nombre_empresa", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Persona_Contacto", System.Data.DbType.String, "defecto");
            sds.InsertParameters.Add("1Telefono", System.Data.DbType.String, "defecto");




            sds.InsertParameters["1Id_afiliado"].DefaultValue = this.Id_afiliado;
            sds.InsertParameters["1Id_reclamantes"].DefaultValue = this.Id_reclamantes;
            sds.InsertParameters["1Barrio"].DefaultValue = this.Barrio;
            sds.InsertParameters["1Cargo"].DefaultValue = this.Cargo;
            sds.InsertParameters["1Celular"].DefaultValue = this.Celular;
            sds.InsertParameters["1Ciudad"].DefaultValue = this.Ciudad;
            sds.InsertParameters["1Direccion"].DefaultValue = this.Direccion;
            sds.InsertParameters["1Email_contacto"].DefaultValue = this.Email_contacto;
            sds.InsertParameters["1Email_empresa"].DefaultValue = this.Email_empresa;
            sds.InsertParameters["1Extencion"].DefaultValue = this.Extencion;
            sds.InsertParameters["1Fax"].DefaultValue = this.Fax;
            sds.InsertParameters["1Nombre_empresa"].DefaultValue = this.Nombre_empresa;
            sds.InsertParameters["1Persona_Contacto"].DefaultValue = this.Persona_Contacto;
            sds.InsertParameters["1Telefono"].DefaultValue = this.Telefono;

            sds.Insert();


            info_operacion = "Laborales Creados Con Exito";

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
