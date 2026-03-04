using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for ClaseContaCaso
/// </summary>
public class ClaseContaCaso
{
	public ClaseContaCaso()
	{
		//
		// TODO: Add constructor logic here
		//
        
	}


    public string NUEVOCASO(string Id_tipocaso, string Id_estado, string Id_analista, string Id_investigador, string Fecha_asignacion, string Fecha_posibleentrega, string Fecha_entregareal, string Observaciones, string Ciudad)
    {



        string NumeroDecASO;
        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_NUEVOCASO";


        cmd.Parameters.Add("@1Id_tipocaso", SqlDbType.VarChar).Value = Id_tipocaso;
        cmd.Parameters.Add("@1Id_estado", SqlDbType.VarChar).Value = Id_estado;
        cmd.Parameters.Add("@1Id_analista", SqlDbType.VarChar).Value = Id_analista;
        cmd.Parameters.Add("@1Id_investigador", SqlDbType.VarChar).Value = Id_investigador;
        cmd.Parameters.Add("@1Fecha_asignacion", SqlDbType.VarChar).Value = Fecha_asignacion;
        cmd.Parameters.Add("@1Fecha_posibleentrega", SqlDbType.VarChar).Value = Fecha_posibleentrega;
        cmd.Parameters.Add("@1Fecha_entregareal", SqlDbType.VarChar).Value = Fecha_entregareal;
        cmd.Parameters.Add("@1Observaciones", SqlDbType.VarChar).Value = Observaciones;
        cmd.Parameters.Add("@1Ciudad", SqlDbType.VarChar).Value = Ciudad;
       




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt);
        cmd.Parameters["@NUMERODECASO"].Direction = ParameterDirection.Output;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            NumeroDecASO = cmd.Parameters["@NUMERODECASO"].Value.ToString();
            con.Dispose();
        }


        return NumeroDecASO;

    }







    public string NuevaLegalizacion(string NUMERODECASO)
    {



        string NumeroDeLegalizacion;
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_LEGALIZACION";


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NUMERODECASO;

        


        cmd.Parameters.Add("@NUMEROLEGALIZACION", SqlDbType.BigInt);
        cmd.Parameters["@NUMEROLEGALIZACION"].Direction = ParameterDirection.Output;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            NumeroDeLegalizacion = cmd.Parameters["@NUMEROLEGALIZACION"].Value.ToString();
            con.Dispose();
        }


        return NumeroDeLegalizacion;

    }




    public string NuevaFactura(string NUMERODECASO)
    {



        string NumeroDefACTURA;
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_FACTURA";


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NUMERODECASO;




        cmd.Parameters.Add("@NUMEROFACTURA", SqlDbType.BigInt);
        cmd.Parameters["@NUMEROFACTURA"].Direction = ParameterDirection.Output;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            NumeroDefACTURA = cmd.Parameters["@NUMEROFACTURA"].Value.ToString();
            con.Dispose();
        }


        return NumeroDefACTURA;

    }




    public string NuevaFacturaMultiple()
    {



        string NumeroDefACTURA;
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_FACTURA_MULTIPLE";


       


        cmd.Parameters.Add("@NUMEROFACTURA", SqlDbType.BigInt);
        cmd.Parameters["@NUMEROFACTURA"].Direction = ParameterDirection.Output;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            NumeroDefACTURA = cmd.Parameters["@NUMEROFACTURA"].Value.ToString();
            con.Dispose();
        }


        return NumeroDefACTURA;

    }




    public DataTable CargarInvestigadores()
    {


        
        DataTable Datatable_Investigadores = new DataTable();
        

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_INVESTIGADORES";
        cmd.Connection = con;
        try
        {
            con.Open();


            Datatable_Investigadores.Load(cmd.ExecuteReader());
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Investigadores;


    }




    public DataTable CargarInvestigadoresConsigna()
    {



        DataTable Datatable_Investigadores = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "[SP_CARGAR_INVESTIGADORES_CONSIGNA]";
        cmd.Connection = con;
        try
        {
            con.Open();


            Datatable_Investigadores.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Investigadores;


    }


    public DataTable CargarCasos(string Idinvestigador)
    {

        DataTable Datatable_Casos = new DataTable();

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOS";
        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.BigInt).Value = Idinvestigador;
        cmd.Connection = con;
        try
        {
            con.Open();


            Datatable_Casos.Load(cmd.ExecuteReader());

                     


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Casos;


    }

    
    public DataTable CargarConceptos()
    {


        DataTable Datatable_Conceptos = new DataTable();

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LEERCONSEPTOS";
        cmd.Connection = con;
        try
        {
            con.Open();



            Datatable_Conceptos.Load(cmd.ExecuteReader());

            

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Conceptos;


    }




    public DataTable CargarCompanias()
    {


        DataTable Datatable_Companias = new DataTable();

        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LEERCOMPANIADESEGUROS";
        cmd.Connection = con;
        try
        {
            con.Open();



            Datatable_Companias.Load(cmd.ExecuteReader());



        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Companias;


    }




    public DataTable CargarTiposDeCaso()
    {


        DataTable Datatable_Companias = new DataTable();

        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LEERTIPOSDECASO";
        cmd.Connection = con;
        try
        {
            con.Open();



            Datatable_Companias.Load(cmd.ExecuteReader());



        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Companias;


    }






    public DataTable CargarCasosCompletosFacturar(string IDCOMPANIA)
    {


        DataTable Datatable_Companias = new DataTable();

        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LEERCASOCOMPLETOS";
        cmd.Parameters.Add("@IDCOMPANIA", SqlDbType.BigInt).Value = IDCOMPANIA;

        cmd.Connection = con;
        try
        {
            con.Open();



            Datatable_Companias.Load(cmd.ExecuteReader());



        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Companias;


    }










    public DataTable CargarCiudades()
    {


        DataTable Datatable_Ciudades = new DataTable();

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CIUDADES";
        cmd.Connection = con;
        try
        {
            con.Open();



            Datatable_Ciudades.Load(cmd.ExecuteReader());

           

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Ciudades;



    }

    
    public void CargarValorConcepto(string String_IDConsepto,string string_Idciudad,out string VALOR,out String ValorFijo)
    {

               

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_VALOR_CONCEPTO";

        cmd.Parameters.Add("@CONCEPTOPADRE", SqlDbType.BigInt).Value = String_IDConsepto;
        cmd.Parameters.Add("@CIUDAD", SqlDbType.BigInt).Value = string_Idciudad;

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt);
        cmd.Parameters.Add("@VALORFIJO", SqlDbType.Bit);

        cmd.Parameters["@VALOR"].Direction = ParameterDirection.Output;
        cmd.Parameters["@VALORFIJO"].Direction = ParameterDirection.Output;

        cmd.Connection = con;
        try
        {
            con.Open();


            cmd.ExecuteReader();


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();



            ValorFijo = cmd.Parameters["@VALORFIJO"].Value.ToString();

            VALOR = cmd.Parameters["@VALOR"].Value.ToString();
                                  

        }

        con.Dispose();


    }

        
    public void InsertarGasto(string IdConsepto,string Idinvestigador,string Valor,string Caso,DateTime Fecha,string Legalizacion)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_GASTOS";


        cmd.Parameters.Add("@CONCEPTO", SqlDbType.BigInt).Value = IdConsepto;
        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.BigInt).Value = Idinvestigador;

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = Valor;

                
        cmd.Parameters.Add("@CASO", SqlDbType.BigInt).Value = Caso;

        cmd.Parameters.Add("@FECHA", SqlDbType.DateTime).Value = Fecha;

        cmd.Parameters.Add("@LEGALIZACION", SqlDbType.BigInt).Value = Legalizacion;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }


        


    }
        
    public DataTable CargarGastos(string NumeroLegalizacion)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_GASTOS";
        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = NumeroLegalizacion;
        cmd.Connection = con;
        try
        {
            con.Open();
            
            Datatable_Gastos.Load(cmd.ExecuteReader());
                        
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }
        
    public string SumatoriaGastos(string numerolegalizacion)
    {


        string sumatoria;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TOTAL_GASTOS";

        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = numerolegalizacion;

        cmd.Parameters.Add("@TOTALLEGALIZA", SqlDbType.BigInt);

        cmd.Parameters["@TOTALLEGALIZA"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            sumatoria = cmd.Parameters["@TOTALLEGALIZA"].Value.ToString();


            con.Dispose();
        }


        return sumatoria;


    }
        
    public string LoadCuentaInvestigador(string ID_INVESTIGADOR)
    {


        string CUENTA;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CUENTA_INVESTIGADOR";


        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = ID_INVESTIGADOR;


        cmd.Parameters.Add("@CUENTA", SqlDbType.BigInt);


        cmd.Parameters["@CUENTA"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            CUENTA = cmd.Parameters["@CUENTA"].Value.ToString();


            con.Dispose();
        }


        return CUENTA;



    }
        



    public string PendientePorLegalizar(string Cuenta)
    {



        string ValorPorlegalizar;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TOTAL_CUENTA";




        cmd.Parameters.Add("@CUENTA", SqlDbType.BigInt).Value = Cuenta;


        cmd.Parameters.Add("@TOTAL_EGRESOS_CUENTA", SqlDbType.BigInt);
        cmd.Parameters.Add("@TOTAL_INGRESOS_CUENTA", SqlDbType.BigInt);
        cmd.Parameters.Add("@VALOR_TOTAL_CUENTA", SqlDbType.BigInt);


        cmd.Parameters["@TOTAL_EGRESOS_CUENTA"].Direction = ParameterDirection.Output;
        cmd.Parameters["@TOTAL_INGRESOS_CUENTA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@VALOR_TOTAL_CUENTA"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            ValorPorlegalizar = cmd.Parameters["@VALOR_TOTAL_CUENTA"].Value.ToString();


            con.Dispose();
        }




        return ValorPorlegalizar;




    }






    public string TOTALLEGALIZACION(string INVESTIGADOR)
    {



        string Valor;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TOTAL_LEGALIZACIONES";




        cmd.Parameters.Add("@IDINVESTIGADORCO", SqlDbType.BigInt).Value = INVESTIGADOR;


        cmd.Parameters.Add("@VALOR_TOTAL_LEGALIZACION", SqlDbType.BigInt);
        


        cmd.Parameters["@VALOR_TOTAL_LEGALIZACION"].Direction = ParameterDirection.Output;
        


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            Valor = cmd.Parameters["@VALOR_TOTAL_LEGALIZACION"].Value.ToString();


            con.Dispose();
        }




        return Valor;




    }






    public string TOTALconsignaciones(string INVESTIGADOR)
    {



        string Valor;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TOTAL_CONSIGNACIONES";




        cmd.Parameters.Add("@IDINVESTIGADORCO", SqlDbType.BigInt).Value = INVESTIGADOR;


        cmd.Parameters.Add("@VALOR_TOTAL_CONSIGNACIONES", SqlDbType.BigInt);



        cmd.Parameters["@VALOR_TOTAL_CONSIGNACIONES"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            Valor = cmd.Parameters["@VALOR_TOTAL_CONSIGNACIONES"].Value.ToString();


            con.Dispose();
        }




        return Valor;




    }



    public string InsertarTransaccion(string CUENTAOK,string totallegalizacion)
    {


        string TransaccionNumero;
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_TRANSACCION";

       

        cmd.Parameters.Add("@CUENTA_ORIGEN", SqlDbType.BigInt).Value = CUENTAOK;

        cmd.Parameters.Add("@CUENTA_DESTINO", SqlDbType.BigInt).Value = 9685;

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = totallegalizacion;

        cmd.Parameters.Add("@METODO", SqlDbType.BigInt).Value = 2;

        cmd.Parameters.Add("@NUMEROTRANSACCION", SqlDbType.BigInt);

        cmd.Parameters["@NUMEROTRANSACCION"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            TransaccionNumero = cmd.Parameters["@NUMEROTRANSACCION"].Value.ToString();



            con.Dispose();
        }

        return TransaccionNumero;


    }

        
    public void ActualizarLegalizacion(string numerolegalizacion, string transaccionnumero)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_FINALIZAR_LEGALIZACION";

        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = numerolegalizacion;
        cmd.Parameters.Add("@TRANSACCION", SqlDbType.BigInt).Value = transaccionnumero;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }

    public void ActualizarCiudadLegalizacion(string numerolegalizacion, int Ciudad)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_ACTUALIZAR_CIUDAD_LEGALIZACION";

        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = numerolegalizacion;
        cmd.Parameters.Add("@CIUDAD", SqlDbType.BigInt).Value = Ciudad;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }




    public string obteneridinvestigador (string correo)
    {



        string idinvestigador;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_IDINVESTIGADOR";




        cmd.Parameters.Add("@CORREOINVESTIGADOR", SqlDbType.VarChar).Value = correo;
                
        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt);
        
        cmd.Parameters["@IDINVESTIGADOR"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            idinvestigador = cmd.Parameters["@IDINVESTIGADOR"].Value.ToString();


            con.Dispose();
        }




        return idinvestigador;




    }




    public string ObtenerCorreoInvestigador(string idinvestigador)
    {



        string CorreoInvestigador;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_CORREO_INVESTIGADOR";




        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;

        cmd.Parameters.Add("@CORREOINVESTIGADOR", SqlDbType.VarChar,50);

        cmd.Parameters["@CORREOINVESTIGADOR"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            CorreoInvestigador = cmd.Parameters["@CORREOINVESTIGADOR"].Value.ToString();


            con.Dispose();
        }




        return CorreoInvestigador;




    }





    public string OBTENERESTADOLEGALIZACION(string IDLEGALIZACION)
    {



        string EDITABLE;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_ESTADOLEGALIZACION";




        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = IDLEGALIZACION;

        cmd.Parameters.Add("@EDITABLE", SqlDbType.BigInt);

        cmd.Parameters["@EDITABLE"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            EDITABLE = cmd.Parameters["@EDITABLE"].Value.ToString();


            con.Dispose();
        }




        return EDITABLE;




    }





    public void QUITARGASTO(string numerogasto)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_QUITAR_GASTO";

        cmd.Parameters.Add("@IDGASTOS", SqlDbType.BigInt).Value = numerogasto;
        


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }






    public void AgregarGastoAfactura(string numerogasto,string numerofactura)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_AGREGAR_GASTO_FACTURA";

        cmd.Parameters.Add("@IDGASTO", SqlDbType.BigInt).Value = numerogasto;
        cmd.Parameters.Add("@IDFACTURA", SqlDbType.BigInt).Value = numerofactura;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }




    
    public void AgregarPrefacturaAfactura(string IDFACTURA, string IDFACTURAMULTIPLE)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_AGREGAR_PREFACTURA_FACTURA";

        cmd.Parameters.Add("@IDFACTURA", SqlDbType.BigInt).Value = IDFACTURA;

        cmd.Parameters.Add("@IDFACTURAMULTIPLE", SqlDbType.BigInt).Value = IDFACTURAMULTIPLE;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }






    public void FinalizarFactura(string numerofactura, string numerodefacturafisica, string SERVICIO_DE_INVESTIGACION, string GASTOS_DE_INVESTIGACION, string SUBTOTAL, string IVA, string VALOR_TOTAL)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_FINALIZARFACTURA";

        cmd.Parameters.Add("@IDFACTURAFISICA", SqlDbType.BigInt).Value = numerodefacturafisica;
        cmd.Parameters.Add("@IDFACTURA", SqlDbType.BigInt).Value = numerofactura;

        cmd.Parameters.Add("@SERVICIO_DE_INVESTIGACION", SqlDbType.BigInt).Value = SERVICIO_DE_INVESTIGACION;
        cmd.Parameters.Add("@GASTOS_DE_INVESTIGACION", SqlDbType.BigInt).Value = GASTOS_DE_INVESTIGACION;
        cmd.Parameters.Add("@SUBTOTAL", SqlDbType.BigInt).Value = SUBTOTAL;
        cmd.Parameters.Add("@IVA", SqlDbType.BigInt).Value = IVA;
        cmd.Parameters.Add("@VALOR_TOTAL", SqlDbType.BigInt).Value = VALOR_TOTAL;



       cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }





    public void ActualizarfechaFactura(string numerofactura, DateTime FechaFactura)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_ACTUALIZARFECHAFACTURA";


        cmd.Parameters.Add("@IDFACTURA", SqlDbType.BigInt).Value = numerofactura;

        cmd.Parameters.Add("@fechafactura", SqlDbType.DateTime).Value = FechaFactura;
       

       


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }





    public void FinalizarFacturaMultiple(string numerofactura, string FACTURAFISICA_SERVICIO, string FACTURAFISICA_GASTO,string FACTURAFISICA_GASTO_FIJO , string SERVICIO_DE_INVESTIGACION, string GASTOS_DE_INVESTIGACION, string SUBTOTAL, string IVA, string VALOR_TOTAL,string VALOR_GASTOS_FIJOS_INVESTIGACION)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_FINALIZARFACTURA_MUTIPLE";

        cmd.Parameters.Add("@IDFACTURAFISICA_SERVICIO", SqlDbType.BigInt).Value = FACTURAFISICA_SERVICIO;
        cmd.Parameters.Add("@IDFACTURAFISICA_GASTO", SqlDbType.BigInt).Value = FACTURAFISICA_GASTO;
        cmd.Parameters.Add("@IDFACTURAFISICA_GASTO_FIJO", SqlDbType.BigInt).Value = FACTURAFISICA_GASTO_FIJO;


        cmd.Parameters.Add("@VALOR_GASTOS_FIJOS_INVESTIGACION", SqlDbType.BigInt).Value = VALOR_GASTOS_FIJOS_INVESTIGACION;

        




        cmd.Parameters.Add("@IDFACTURA", SqlDbType.BigInt).Value = numerofactura;

        cmd.Parameters.Add("@SERVICIO_DE_INVESTIGACION", SqlDbType.BigInt).Value = SERVICIO_DE_INVESTIGACION;
        cmd.Parameters.Add("@GASTOS_DE_INVESTIGACION", SqlDbType.BigInt).Value = GASTOS_DE_INVESTIGACION;
        cmd.Parameters.Add("@SUBTOTAL", SqlDbType.BigInt).Value = SUBTOTAL;
        cmd.Parameters.Add("@IVA", SqlDbType.BigInt).Value = IVA;
        cmd.Parameters.Add("@VALOR_TOTAL", SqlDbType.BigInt).Value = VALOR_TOTAL;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }





    public void QuitarGastoAfactura(string numerogasto)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_QUITAR_GASTO_FACTURA";

        cmd.Parameters.Add("@IDGASTO", SqlDbType.BigInt).Value = numerogasto;
        

        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }





    public void QuitarGastoAfacturaMultiple(string NUMERODEFACTURA)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_QUITAR_FACTURA_A_FACTURA_MULTIPLE";

        cmd.Parameters.Add("@IDFACTURA", SqlDbType.BigInt).Value = NUMERODEFACTURA;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            con.Dispose();
        }









    }







    public void InsertarConcepto(string valor,string valorfijo, string nombre)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_CONSEPTO";


        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = valor;
        cmd.Parameters.Add("@VALORFIJO", SqlDbType.BigInt).Value = valorfijo;

        cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar, 50).Value = nombre;

        
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }








    public void obtenervalor(string idconcepto, out string valor, out string editable)
    {

        
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_VALOR_CONCEPTO_EDITAR";




        cmd.Parameters.Add("@N_ID_CONCEPTO", SqlDbType.BigInt).Value = idconcepto;

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt);

        cmd.Parameters["@VALOR"].Direction = ParameterDirection.Output;
        
        cmd.Parameters.Add("@EDITABLE", SqlDbType.BigInt);

        cmd.Parameters["@EDITABLE"].Direction = ParameterDirection.Output;


        



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            valor = cmd.Parameters["@VALOR"].Value.ToString();

            editable = cmd.Parameters["@EDITABLE"].Value.ToString();


            con.Dispose();
        }

        
    }






    public void obtenervalorCiudad(string idconceptopadre, string idciudad, out string valor, out string editable)
    {


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_VALOR_CONCEPTO_EDITAR_CIUDAD";




        cmd.Parameters.Add("@CONCEPTOPADRE", SqlDbType.BigInt).Value = idconceptopadre;

        cmd.Parameters.Add("@CIUDAD", SqlDbType.BigInt).Value = idciudad;


        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt);

        cmd.Parameters["@VALOR"].Direction = ParameterDirection.Output;

        cmd.Parameters.Add("@EDITABLE", SqlDbType.BigInt);

        cmd.Parameters["@EDITABLE"].Direction = ParameterDirection.Output;






        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            valor = cmd.Parameters["@VALOR"].Value.ToString();

            editable = cmd.Parameters["@EDITABLE"].Value.ToString();


            con.Dispose();
        }


    }







    public void ActualizarValorConcepto(string idconcepto, string valor,string editable)
    {

        
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_ACTUALIZAR_CONCEPTO";




        cmd.Parameters.Add("@N_ID_CONCEPTO", SqlDbType.BigInt).Value = idconcepto;


        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = valor;

        cmd.Parameters.Add("@EDITABLE", SqlDbType.BigInt).Value = editable;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
                        
            con.Dispose();
        }



    }









    public void ActualizarValorConceptoCiudad(string idconceptopadre, string idciudad, string valor, string editable)
    {


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_ACTUALIZAR_CONCEPTO_CIUDAD";



        cmd.Parameters.Add("@CONCEPTOPADRE", SqlDbType.BigInt).Value = idconceptopadre;

        cmd.Parameters.Add("@CIUDAD", SqlDbType.BigInt).Value = idciudad;


        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = valor;

        cmd.Parameters.Add("@EDITABLE", SqlDbType.BigInt).Value = editable;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }



    }






    public string InsertarViaticosInvestigador(string FECHAYHORA, string VALOR, string TRANSACCION ,string IDINVESTIGADOR)
    {


        string TransaccionNumero;
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_INGRESOVIATICOS";



        cmd.Parameters.Add("@FECHAYHORA", SqlDbType.DateTime).Value = FECHAYHORA;

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = VALOR;

        cmd.Parameters.Add("@TRANSACCION", SqlDbType.BigInt).Value = TRANSACCION;

        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = IDINVESTIGADOR;

        cmd.Parameters.Add("@NUMEROTRANSACCION", SqlDbType.BigInt);

        cmd.Parameters["@NUMEROTRANSACCION"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            TransaccionNumero = cmd.Parameters["@NUMEROTRANSACCION"].Value.ToString();



            con.Dispose();
        }

        return TransaccionNumero;


    }








    public string InsertarTransaccionViaticosInvestigador(string CUENTAOK, string ValorLegalizacion)
    {


        string TransaccionNumero;
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_TRANSACCION";



        cmd.Parameters.Add("@CUENTA_ORIGEN", SqlDbType.BigInt).Value = 158;

        cmd.Parameters.Add("@CUENTA_DESTINO", SqlDbType.BigInt).Value = CUENTAOK;

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = ValorLegalizacion;

        cmd.Parameters.Add("@METODO", SqlDbType.BigInt).Value = 1;

        cmd.Parameters.Add("@NUMEROTRANSACCION", SqlDbType.BigInt);

        cmd.Parameters["@NUMEROTRANSACCION"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            TransaccionNumero = cmd.Parameters["@NUMEROTRANSACCION"].Value.ToString();



            con.Dispose();
        }

        return TransaccionNumero;


    }









    public DataTable CargarGastosNumeroDeCaso(string NumeroDeCaso)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_GASTOS_POR_CASOS";
        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }





    public DataTable CargarPrefacturas()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_PREFACTURAS_FACTURA";
       
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }





    public DataTable CargarFacturasDeFacturaServicio(string NUMERODEFACTURAMULTIPLE)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_FACTURAS_DE_FACTURA";

        cmd.Parameters.Add("@NUMERODEFACTURAMULTIPLE", SqlDbType.BigInt).Value = NUMERODEFACTURAMULTIPLE;

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }





    public DataTable CargarFacturasDeFacturaGastos(string NUMERODEFACTURAMULTIPLE)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_FACTURAS_DE_FACTURA_GASTOS";

        cmd.Parameters.Add("@NUMERODEFACTURAMULTIPLE", SqlDbType.BigInt).Value = NUMERODEFACTURAMULTIPLE;

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }



    public DataTable CargarFacturasDeFacturaGastosFijos(string NUMERODEFACTURAMULTIPLE)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_FACTURAS_DE_FACTURA_GASTOS_FIJOS";

        cmd.Parameters.Add("@NUMERODEFACTURAMULTIPLE", SqlDbType.BigInt).Value = NUMERODEFACTURAMULTIPLE;

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }







    public DataTable CargarGastosFactura(string NumeroDeCaso,string NumeroFactura)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_GASTOS_FACTURA";
        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;
        cmd.Parameters.Add("@NUMEROFACTURA", SqlDbType.BigInt).Value = NumeroFactura;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }




    public DataTable CargaCasosNoAsignados()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSNOASIGANDOS";
        
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }





    public DataTable CargaCasosAsignados()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSASIGANDOS";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }




    public DataTable CargaCasosAsignadosInvestigaor(string correoinvestigadro,int Estado)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";

        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = Estado;
        cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = correoinvestigadro;

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }




    public DataTable CargaCasosPorRevisar()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSREVISAR";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }



    public DataTable CargaCasosCasoEnviar()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSENVIAR";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }



    public DataTable CargaCasosCompletos()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSCOMPLETOS";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }



    public DataTable CargaCasosFacturados()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSFACTURADOS";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }



    public DataTable CargaCasosPagados()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSPAGADOS";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }




    public DataTable CargaCasosSuspedidos()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSSUSPENDIDOS";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }



    public DataTable BuscarCasos(string bUSCAdATO)
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_BUCACASO";

        cmd.Parameters.Add("@BUCASDATO", SqlDbType.VarChar, 50).Value = bUSCAdATO;

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }






    public DataTable CargaCasosPendienteLaboral()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CASOSPENDIENTESLABORAL";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }





    public DataTable CargaSeguimientos()
    {


        DataTable Datatable_Gastos = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_SEGUIMIENTOS_ACTIVOS";

        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Gastos.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Gastos;


    }





    public DataTable CargarConsignacionesInvestigador(string idinvestigador)
    {


        DataTable Datatable_Consignaciones = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CONSIGNACIONES";
        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Consignaciones.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Consignaciones;


    }



    public DataTable CargarlegalizacionesInvestigador(string idinvestigador)
    {


        DataTable Datatable_Consignaciones = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_LEGALIZACIONES_INVESTIGADOR";
        cmd.Parameters.Add("@IDINVESTIGADORCO", SqlDbType.BigInt).Value = idinvestigador;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_Consignaciones.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Consignaciones;


    }







    public string TotalGastosCaso(string NumeroDeCaso)
    {



        string ValortOTALGASTO;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TOTAL_GASTOS_CASO";




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;



        cmd.Parameters.Add("@TOTAL_GASTOS", SqlDbType.BigInt);



        cmd.Parameters["@TOTAL_GASTOS"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            ValortOTALGASTO = cmd.Parameters["@TOTAL_GASTOS"].Value.ToString();


            con.Dispose();
        }




        return ValortOTALGASTO;




    }



    public string enletras(string num)
    {
        string res, dec = "";
        Int64 entero;
        int decimales;
        double nro;

        try

        {
            nro = Convert.ToDouble(num);
        }
        catch
        {
            return "";
        }

        entero = Convert.ToInt64(Math.Truncate(nro));
        decimales = Convert.ToInt32(Math.Round((nro - entero) * 100, 2));
        if (decimales > 0)
        {
            dec = " CON " + decimales.ToString() + "/100";
        }

        res = toText(Convert.ToDouble(entero)) + dec;
        return res;
    }

    private string toText(double value)
    {
        string Num2Text = "";
        value = Math.Truncate(value);
        if (value == 0) Num2Text = "CERO";
        else if (value == 1) Num2Text = "UNO";
        else if (value == 2) Num2Text = "DOS";
        else if (value == 3) Num2Text = "TRES";
        else if (value == 4) Num2Text = "CUATRO";
        else if (value == 5) Num2Text = "CINCO";
        else if (value == 6) Num2Text = "SEIS";
        else if (value == 7) Num2Text = "SIETE";
        else if (value == 8) Num2Text = "OCHO";
        else if (value == 9) Num2Text = "NUEVE";
        else if (value == 10) Num2Text = "DIEZ";
        else if (value == 11) Num2Text = "ONCE";
        else if (value == 12) Num2Text = "DOCE";
        else if (value == 13) Num2Text = "TRECE";
        else if (value == 14) Num2Text = "CATORCE";
        else if (value == 15) Num2Text = "QUINCE";
        else if (value < 20) Num2Text = "DIECI" + toText(value - 10);
        else if (value == 20) Num2Text = "VEINTE";
        else if (value < 30) Num2Text = "VEINTI" + toText(value - 20);
        else if (value == 30) Num2Text = "TREINTA";
        else if (value == 40) Num2Text = "CUARENTA";
        else if (value == 50) Num2Text = "CINCUENTA";
        else if (value == 60) Num2Text = "SESENTA";
        else if (value == 70) Num2Text = "SETENTA";
        else if (value == 80) Num2Text = "OCHENTA";
        else if (value == 90) Num2Text = "NOVENTA";
        else if (value < 100) Num2Text = toText(Math.Truncate(value / 10) * 10) + " Y " + toText(value % 10);
        else if (value == 100) Num2Text = "CIEN";
        else if (value < 200) Num2Text = "CIENTO " + toText(value - 100);
        else if ((value == 200) || (value == 300) || (value == 400) || (value == 600) || (value == 800)) Num2Text = toText(Math.Truncate(value / 100)) + "CIENTOS";
        else if (value == 500) Num2Text = "QUINIENTOS";
        else if (value == 700) Num2Text = "SETECIENTOS";
        else if (value == 900) Num2Text = "NOVECIENTOS";
        else if (value < 1000) Num2Text = toText(Math.Truncate(value / 100) * 100) + " " + toText(value % 100);
        else if (value == 1000) Num2Text = "MIL";
        else if (value < 2000) Num2Text = "MIL " + toText(value % 1000);
        else if (value < 1000000)
        {
            Num2Text = toText(Math.Truncate(value / 1000)) + " MIL";
            if ((value % 1000) > 0) Num2Text = Num2Text + " " + toText(value % 1000);
        }

        else if (value == 1000000) Num2Text = "UN MILLON";
        else if (value < 2000000) Num2Text = "UN MILLON " + toText(value % 1000000);
        else if (value < 1000000000000)
        {
            Num2Text = toText(Math.Truncate(value / 1000000)) + " MILLONES ";
            if ((value - Math.Truncate(value / 1000000) * 1000000) > 0) Num2Text = Num2Text + " " + toText(value - Math.Truncate(value / 1000000) * 1000000);
        }

        else if (value == 1000000000000) Num2Text = "UN BILLON";
        else if (value < 2000000000000) Num2Text = "UN BILLON " + toText(value - Math.Truncate(value / 1000000000000) * 1000000000000);

        else
        {
            Num2Text = toText(Math.Truncate(value / 1000000000000)) + " BILLONES";
            if ((value - Math.Truncate(value / 1000000000000) * 1000000000000) > 0) Num2Text = Num2Text + " " + toText(value - Math.Truncate(value / 1000000000000) * 1000000000000);
        }
        return Num2Text ;

    }





    public string TotalGastosFACTURA(string NumeroDeCaso, string Numerofactura)
    {



        string ValortOTALGASTO;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TOTAL_GASTOS_FACTURA";




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;

        cmd.Parameters.Add("@NUMEROFACTURA", SqlDbType.BigInt).Value = Numerofactura;



        cmd.Parameters.Add("@TOTAL_GASTOS_FACTURA", SqlDbType.BigInt);



        cmd.Parameters["@TOTAL_GASTOS_FACTURA"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            ValortOTALGASTO = cmd.Parameters["@TOTAL_GASTOS_FACTURA"].Value.ToString();


            con.Dispose();
        }




        return ValortOTALGASTO;




    }











    public void InsertarGastoCaso(string IdConsepto, string Valor, string Caso)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_GASTOS_INVESTIGACION";


        cmd.Parameters.Add("@CONCEPTO", SqlDbType.BigInt).Value = IdConsepto;
        

        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = Valor;


        cmd.Parameters.Add("@CASO", SqlDbType.BigInt).Value = Caso;

        

        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }







    public void InsertarViaticosTemporal(string IDINVESTIGADOR, string VALOR, string NOMBRE)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTARVIATICOS_TEMPORAL";


        cmd.Parameters.Add("@ID_INVESTIGADOR", SqlDbType.BigInt).Value = IDINVESTIGADOR;


        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = VALOR;

                
        cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar, 50).Value = NOMBRE;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }










    public void DevolverACajaMenor(string pagadoA, string concepto, string valor, string idinvestigador, string cuentaivestigador)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_CAJA_MENOR_INVESTIGADOR";


        cmd.Parameters.Add("@T_PAGADO_A", SqlDbType.VarChar,50).Value = pagadoA;

        cmd.Parameters.Add("@CONCEPTO", SqlDbType.VarChar, 50).Value = concepto;
                
        cmd.Parameters.Add("@VALOR", SqlDbType.BigInt).Value = valor;

        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;
        
        cmd.Parameters.Add("@CUENTAINVESTIGADOR", SqlDbType.BigInt).Value = cuentaivestigador;
                
        cmd.Parameters.Add("@NUMEROTRANSACCION", SqlDbType.BigInt);
        
        cmd.Parameters["@NUMEROTRANSACCION"].Direction = ParameterDirection.Output;
        


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }







    public string obtenerCasoAsignadoA(string Caso)
    {



        string idinvestigador;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_IDINVESTIGADOR_CASO";




        cmd.Parameters.Add("@CASO", SqlDbType.VarChar).Value = Caso;

        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt);

        cmd.Parameters["@IDINVESTIGADOR"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            idinvestigador = cmd.Parameters["@IDINVESTIGADOR"].Value.ToString();


            con.Dispose();
        }




        return idinvestigador;




    }







    public string obtenerEstadoDeCaso(string Caso)
    {



        string idTipodeCaso;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_ESTADO_CASO";




        cmd.Parameters.Add("@CASO", SqlDbType.VarChar).Value = Caso;

        cmd.Parameters.Add("@IDESTADOCASO", SqlDbType.BigInt);

        cmd.Parameters["@IDESTADOCASO"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            idTipodeCaso = cmd.Parameters["@IDESTADOCASO"].Value.ToString();


            con.Dispose();
        }




        return idTipodeCaso;




    }









    public void DatosDeCaso(string NumeroDeCaso,out string asegurado,out string compania,out string ciudad,out string fechadeasignacion)
    {



        
        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DATOSCASO";




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;


       
        cmd.Parameters.Add("@ASEGURADO", SqlDbType.VarChar,300);
        cmd.Parameters.Add("@COMPANIA", SqlDbType.VarChar,300);
        cmd.Parameters.Add("@CIUDAD", SqlDbType.VarChar,300);
        cmd.Parameters.Add("@FECHAASIGNACION", SqlDbType.VarChar,300);


        cmd.Parameters["@ASEGURADO"].Direction = ParameterDirection.Output;

        cmd.Parameters["@COMPANIA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@CIUDAD"].Direction = ParameterDirection.Output;

        cmd.Parameters["@FECHAASIGNACION"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            asegurado = cmd.Parameters["@ASEGURADO"].Value.ToString();
            compania = cmd.Parameters["@COMPANIA"].Value.ToString();
            ciudad = cmd.Parameters["@CIUDAD"].Value.ToString();
            fechadeasignacion = cmd.Parameters["@FECHAASIGNACION"].Value.ToString();


            con.Dispose();
        }


        
        


    }



    public void DatosDeCaso2(string NumeroDeLegalizacion, out string NumeroDeCaso, out string NombreDelAfiliado, out string Compania)
    {




        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DATOSCASO2";




        cmd.Parameters.Add("@NumeroDeLegalizacion", SqlDbType.BigInt).Value = NumeroDeLegalizacion;



        cmd.Parameters.Add("@NumeroDeCaso", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NombreDelAfiliado", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@Compania", SqlDbType.VarChar, 300);
       


        cmd.Parameters["@NumeroDeCaso"].Direction = ParameterDirection.Output;

        cmd.Parameters["@NombreDelAfiliado"].Direction = ParameterDirection.Output;

        cmd.Parameters["@Compania"].Direction = ParameterDirection.Output;

    



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            NumeroDeCaso = cmd.Parameters["@NumeroDeCaso"].Value.ToString();
            NombreDelAfiliado = cmd.Parameters["@NombreDelAfiliado"].Value.ToString();
            Compania = cmd.Parameters["@Compania"].Value.ToString();
          


            con.Dispose();
        }






    }





    public void fECHAcONSIGNACION(string NumeroDeConsignacion, out string Fecha)
    {




        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_GET_FECHADECONSIGNACION";




        cmd.Parameters.Add("@NumeroDeConsignacion", SqlDbType.BigInt).Value = NumeroDeConsignacion;



       
        cmd.Parameters.Add("@fechadeconsignacion", SqlDbType.VarChar, 300);


             

        cmd.Parameters["@fechadeconsignacion"].Direction = ParameterDirection.Output;





        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            Fecha = cmd.Parameters["@fechadeconsignacion"].Value.ToString();



            con.Dispose();
        }






    }




    public void CIUDADLEGALIZACION(string LEGALIZACION, out string CIUDAD)
    {




        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_GET_CIUDADDELEGALIZACION";




        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = LEGALIZACION;




        cmd.Parameters.Add("@CIUDAD", SqlDbType.VarChar, 300);




        cmd.Parameters["@CIUDAD"].Direction = ParameterDirection.Output;





        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();





            CIUDAD = cmd.Parameters["@CIUDAD"].Value.ToString();



            con.Dispose();
        }






    }






    public void DatosDeCasoMarcarpeta(string NumeroDeCaso, out string COMPANIA, out string NUMERODECASOTRAIDO, out string ASEGURADO, out string CIUDAD, out string TIPODECASO, out string INVESTIGADOR, out string FECHAASIGNACION, out string FECHAENTREGA, out string CIUDADDEPART, out string CEDULA)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DATOSCASO_MARCARPETA";




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;



        cmd.Parameters.Add("@COMPANIA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NUMERODECASOTRAIDO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@ASEGURADO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CIUDAD", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@TIPODECASO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@FECHAASIGNACION", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@FECHAENTREGA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CIUDADDEPART", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CEDULA", SqlDbType.VarChar, 300);


        
        cmd.Parameters["@COMPANIA"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NUMERODECASOTRAIDO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@ASEGURADO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CIUDAD"].Direction = ParameterDirection.Output;
        cmd.Parameters["@TIPODECASO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@INVESTIGADOR"].Direction = ParameterDirection.Output;
        cmd.Parameters["@FECHAASIGNACION"].Direction = ParameterDirection.Output;
        cmd.Parameters["@FECHAENTREGA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@CIUDADDEPART"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CEDULA"].Direction = ParameterDirection.Output;

       


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            

            COMPANIA = cmd.Parameters["@COMPANIA"].Value.ToString();
            NUMERODECASOTRAIDO = cmd.Parameters["@NUMERODECASOTRAIDO"].Value.ToString();
            ASEGURADO = cmd.Parameters["@ASEGURADO"].Value.ToString();
            CIUDAD = cmd.Parameters["@CIUDAD"].Value.ToString();
            TIPODECASO = cmd.Parameters["@TIPODECASO"].Value.ToString();
            INVESTIGADOR = cmd.Parameters["@INVESTIGADOR"].Value.ToString();
            FECHAASIGNACION = cmd.Parameters["@FECHAASIGNACION"].Value.ToString();
            FECHAENTREGA = cmd.Parameters["@FECHAENTREGA"].Value.ToString();


            CIUDADDEPART = cmd.Parameters["@CIUDADDEPART"].Value.ToString();
            CEDULA = cmd.Parameters["@CEDULA"].Value.ToString();




            con.Dispose();
        }






    }





    public void DatosDeCasoFactura(string NumeroDeCaso, out string COMPANIA, out string NUMERODECASOTRAIDO, out string ASEGURADO, out string CIUDAD, out string TIPODECASO, out string INVESTIGADOR, out string FECHAASIGNACION, out string FECHAENTREGA, out string CIUDADDEPART, out string CEDULA,  out string NOMBREANALISTACOMPANIA, out string NITCOMPANIA, out string IDTIPODECASO , out string IDCOMPANIA)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DATOSCASO_FACTURA";




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;



        cmd.Parameters.Add("@COMPANIA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NUMERODECASOTRAIDO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@ASEGURADO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CIUDAD", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@TIPODECASO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@FECHAASIGNACION", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@FECHAENTREGA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CIUDADDEPART", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CEDULA", SqlDbType.VarChar, 300);

        cmd.Parameters.Add("@NOMBREANALISTACOMPANIA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NITCOMPANIA", SqlDbType.VarChar, 300);

        cmd.Parameters.Add("@IDTIPODECASO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@IDCOMPANIA", SqlDbType.VarChar, 300);



        cmd.Parameters["@COMPANIA"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NUMERODECASOTRAIDO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@ASEGURADO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CIUDAD"].Direction = ParameterDirection.Output;
        cmd.Parameters["@TIPODECASO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@INVESTIGADOR"].Direction = ParameterDirection.Output;
        cmd.Parameters["@FECHAASIGNACION"].Direction = ParameterDirection.Output;
        cmd.Parameters["@FECHAENTREGA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@CIUDADDEPART"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CEDULA"].Direction = ParameterDirection.Output;





       
        cmd.Parameters["@NOMBREANALISTACOMPANIA"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NITCOMPANIA"].Direction = ParameterDirection.Output;


        cmd.Parameters["@IDTIPODECASO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@IDCOMPANIA"].Direction = ParameterDirection.Output;








        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            COMPANIA = cmd.Parameters["@COMPANIA"].Value.ToString();
            NUMERODECASOTRAIDO = cmd.Parameters["@NUMERODECASOTRAIDO"].Value.ToString();
            ASEGURADO = cmd.Parameters["@ASEGURADO"].Value.ToString();
            CIUDAD = cmd.Parameters["@CIUDAD"].Value.ToString();
            TIPODECASO = cmd.Parameters["@TIPODECASO"].Value.ToString();
            INVESTIGADOR = cmd.Parameters["@INVESTIGADOR"].Value.ToString();
            FECHAASIGNACION = cmd.Parameters["@FECHAASIGNACION"].Value.ToString();
            FECHAENTREGA = cmd.Parameters["@FECHAENTREGA"].Value.ToString();


            CIUDADDEPART = cmd.Parameters["@CIUDADDEPART"].Value.ToString();
            CEDULA = cmd.Parameters["@CEDULA"].Value.ToString();


            CIUDADDEPART = cmd.Parameters["@CIUDADDEPART"].Value.ToString();
            CEDULA = cmd.Parameters["@CEDULA"].Value.ToString();




            NOMBREANALISTACOMPANIA = cmd.Parameters["@NOMBREANALISTACOMPANIA"].Value.ToString();
            NITCOMPANIA = cmd.Parameters["@NITCOMPANIA"].Value.ToString();


            IDTIPODECASO = cmd.Parameters["@IDTIPODECASO"].Value.ToString();
            IDCOMPANIA = cmd.Parameters["@IDCOMPANIA"].Value.ToString();




            con.Dispose();
        }






    }






    public void Traerfechafactura(string numerodefactura, out string FECHAFACTURA, out string FINALIZADO, out string FACTURAFISICA)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TRERFECHA_FACTURA";




        cmd.Parameters.Add("@NUMERODEFACTURA", SqlDbType.BigInt).Value = numerodefactura;



     
        cmd.Parameters.Add("@FECHAFATURA", SqlDbType.VarChar, 300);

        cmd.Parameters.Add("@FINALIZADO", SqlDbType.VarChar, 300);

        cmd.Parameters.Add("@FACTURAFISICA", SqlDbType.VarChar, 300);




        cmd.Parameters["@FECHAFATURA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@FINALIZADO"].Direction = ParameterDirection.Output;

        cmd.Parameters["@FACTURAFISICA"].Direction = ParameterDirection.Output;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();



            FECHAFACTURA = cmd.Parameters["@FECHAFATURA"].Value.ToString();

            FINALIZADO = cmd.Parameters["@FINALIZADO"].Value.ToString();

            FACTURAFISICA = cmd.Parameters["@FACTURAFISICA"].Value.ToString();





            con.Dispose();
        }






    }




    public void TraerValorServicio(string IDCOMPANIA, string IDTIPODECASO, out string SERVICIODEINVESTIGACION)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TRAERVALORSERVICIO";




        cmd.Parameters.Add("@IDCOMPANIA", SqlDbType.BigInt).Value = IDCOMPANIA;
        cmd.Parameters.Add("@IDTIPODECASO", SqlDbType.BigInt).Value = IDTIPODECASO;

               
        cmd.Parameters.Add("@SERVICIODEINVESTIGACION", SqlDbType.VarChar, 300);

                       
        cmd.Parameters["@SERVICIODEINVESTIGACION"].Direction = ParameterDirection.Output;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();



            SERVICIODEINVESTIGACION = cmd.Parameters["@SERVICIODEINVESTIGACION"].Value.ToString();




            con.Dispose();
        }






    }




    public void TraerValorServicioFacturaMultiple(string NUMEROFACTURAMULTIPLE, out string SERVICIODEINVESTIGACION)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TRAERVALORSERVICIO_FACTURAMULTIPLE";




        cmd.Parameters.Add("@NUMEROFACTURAMULTIPLE", SqlDbType.BigInt).Value = NUMEROFACTURAMULTIPLE;
        


        cmd.Parameters.Add("@SERVICIODEINVESTIGACION", SqlDbType.VarChar, 300);


        cmd.Parameters["@SERVICIODEINVESTIGACION"].Direction = ParameterDirection.Output;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();



            SERVICIODEINVESTIGACION = cmd.Parameters["@SERVICIODEINVESTIGACION"].Value.ToString();




            con.Dispose();
        }






    }




    public void TraerValorGastosFacturaMultiple(string NUMEROFACTURAMULTIPLE, out string GASTOSDEINVESTIGACION)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TRAERVALORGASTOS_FACTURAMULTIPLE";




        cmd.Parameters.Add("@NUMEROFACTURAMULTIPLE", SqlDbType.BigInt).Value = NUMEROFACTURAMULTIPLE;



        cmd.Parameters.Add("@GASTOSDEINVESTIGACION", SqlDbType.VarChar, 300);


        cmd.Parameters["@GASTOSDEINVESTIGACION"].Direction = ParameterDirection.Output;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();



            GASTOSDEINVESTIGACION = cmd.Parameters["@GASTOSDEINVESTIGACION"].Value.ToString();




            con.Dispose();
        }






    }



    public void TraerValorGastosfIJOSFacturaMultiple(string NUMEROFACTURAMULTIPLE, out string GASTOSDEINVESTIGACION, out string GASTOSFIJOSDEINVESTIGACION)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_TRAERVALORGASTOS_FIJOS_FACTURAMULTIPLE";




        cmd.Parameters.Add("@NUMEROFACTURAMULTIPLE", SqlDbType.BigInt).Value = NUMEROFACTURAMULTIPLE;



        cmd.Parameters.Add("@GASTOSDEINVESTIGACION", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@GASTOSFIJOSDEINVESTIGACION", SqlDbType.VarChar, 300);


        cmd.Parameters["@GASTOSDEINVESTIGACION"].Direction = ParameterDirection.Output;
        cmd.Parameters["@GASTOSFIJOSDEINVESTIGACION"].Direction = ParameterDirection.Output;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();



            GASTOSDEINVESTIGACION = cmd.Parameters["@GASTOSDEINVESTIGACION"].Value.ToString();

            GASTOSFIJOSDEINVESTIGACION = cmd.Parameters["@GASTOSFIJOSDEINVESTIGACION"].Value.ToString();


            con.Dispose();
        }






    }






    public void DatosbANCOiNVESTIGADOR(string ID, out string ID_INVESTIGADOR, out string CUENTAORIGEN, out string NUMEROCUENTAORIGEN, out string PRODUCTODESTINO, out string NUMEROPRODUCTODESTINO, out string NOMBREINVESTIGADOR, out string CEDULA, out string ACTIVO)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DATOS_BANCO";




        cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = ID;



        cmd.Parameters.Add("@ID_INVESTIGADOR", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CUENTAORIGEN", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NUMEROCUENTAORIGEN", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@PRODUCTODESTINO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NUMEROPRODUCTODESTINO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NOMBREINVESTIGADOR", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CEDULA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@ACTIVO", SqlDbType.VarChar, 300);
       



        cmd.Parameters["@ID_INVESTIGADOR"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CUENTAORIGEN"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NUMEROCUENTAORIGEN"].Direction = ParameterDirection.Output;
        cmd.Parameters["@PRODUCTODESTINO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NUMEROPRODUCTODESTINO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NOMBREINVESTIGADOR"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CEDULA"].Direction = ParameterDirection.Output;
        cmd.Parameters["@ACTIVO"].Direction = ParameterDirection.Output;

       


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            ID_INVESTIGADOR = cmd.Parameters["@ID_INVESTIGADOR"].Value.ToString();
            CUENTAORIGEN = cmd.Parameters["@CUENTAORIGEN"].Value.ToString();
            NUMEROCUENTAORIGEN = cmd.Parameters["@NUMEROCUENTAORIGEN"].Value.ToString();
            PRODUCTODESTINO = cmd.Parameters["@PRODUCTODESTINO"].Value.ToString();
            NUMEROPRODUCTODESTINO = cmd.Parameters["@NUMEROPRODUCTODESTINO"].Value.ToString();
            NOMBREINVESTIGADOR = cmd.Parameters["@NOMBREINVESTIGADOR"].Value.ToString();
            CEDULA = cmd.Parameters["@CEDULA"].Value.ToString();
            ACTIVO = cmd.Parameters["@ACTIVO"].Value.ToString();


         



            con.Dispose();
        }






    }











    public void DatosDeCasoEnvioCorreo(string NumeroDeCaso, out string COMPANIA, out string NUMERODECASOTRAIDO, out string ASEGURADO, out string CIUDAD, out string TIPODECASO, out string INVESTIGADOR, out string FECHAASIGNACION, out string FECHAENTREGA, out string CIUDADDEPART, out string CEDULA, out string CORREOANALISTA)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DATOSCASO_ENVIOCORREO";




        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;



        cmd.Parameters.Add("@COMPANIA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@NUMERODECASOTRAIDO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@ASEGURADO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CIUDAD", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@TIPODECASO", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@FECHAASIGNACION", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@FECHAENTREGA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CIUDADDEPART", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CEDULA", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@CORREOANALISTA", SqlDbType.VarChar, 300);



        cmd.Parameters["@COMPANIA"].Direction = ParameterDirection.Output;
        cmd.Parameters["@NUMERODECASOTRAIDO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@ASEGURADO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CIUDAD"].Direction = ParameterDirection.Output;
        cmd.Parameters["@TIPODECASO"].Direction = ParameterDirection.Output;
        cmd.Parameters["@INVESTIGADOR"].Direction = ParameterDirection.Output;
        cmd.Parameters["@FECHAASIGNACION"].Direction = ParameterDirection.Output;
        cmd.Parameters["@FECHAENTREGA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@CIUDADDEPART"].Direction = ParameterDirection.Output;
        cmd.Parameters["@CEDULA"].Direction = ParameterDirection.Output;

        cmd.Parameters["@CORREOANALISTA"].Direction = ParameterDirection.Output;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            COMPANIA = cmd.Parameters["@COMPANIA"].Value.ToString();
            NUMERODECASOTRAIDO = cmd.Parameters["@NUMERODECASOTRAIDO"].Value.ToString();
            ASEGURADO = cmd.Parameters["@ASEGURADO"].Value.ToString();
            CIUDAD = cmd.Parameters["@CIUDAD"].Value.ToString();
            TIPODECASO = cmd.Parameters["@TIPODECASO"].Value.ToString();
            INVESTIGADOR = cmd.Parameters["@INVESTIGADOR"].Value.ToString();
            FECHAASIGNACION = cmd.Parameters["@FECHAASIGNACION"].Value.ToString();
            FECHAENTREGA = cmd.Parameters["@FECHAENTREGA"].Value.ToString();


            CIUDADDEPART = cmd.Parameters["@CIUDADDEPART"].Value.ToString();
            CEDULA = cmd.Parameters["@CEDULA"].Value.ToString();


            CORREOANALISTA = cmd.Parameters["@CORREOANALISTA"].Value.ToString();



            con.Dispose();
        }






    }



    public void ACTUALZAR_OBSERVACION(string numerodecaso, String observacion)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "ACTUALZAR_OBSERVACION";


        cmd.Parameters.Add("@NUMEROCASO", SqlDbType.BigInt).Value = numerodecaso;

        cmd.Parameters.Add("@OBSERVACION", SqlDbType.VarChar).Value = observacion;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }


    public string TraerObservaciones(string NumeroDeCaso)
    {

        string OBSERVACIONOK;

        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "CARGAR_OBSERVACION";




        cmd.Parameters.Add("@NUMEROCASO", SqlDbType.BigInt).Value = NumeroDeCaso;



      
        cmd.Parameters.Add("@OBSERVACION", SqlDbType.VarChar, 300);



      

        cmd.Parameters["@OBSERVACION"].Direction = ParameterDirection.Output;




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();


            OBSERVACIONOK = cmd.Parameters["@OBSERVACION"].Value.ToString();


            

            con.Dispose();
        }


        return OBSERVACIONOK;





    }





    public string FechaLegalizacion(string idlegalizacion)
    {



        string FECHA;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_FECHALEGALIZACION";




        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = idlegalizacion;

        cmd.Parameters.Add("@FECHA", SqlDbType.VarChar,300);

        

        cmd.Parameters["@FECHA"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            FECHA = cmd.Parameters["@FECHA"].Value.ToString();


            con.Dispose();
        }




        return FECHA;




    }






    public string obteneridinvestigadorPorLegalizacion(string Legalizacion)
    {



        string idinvestigador;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_IDINVESTIGADOR_LEGALIZACION";




        cmd.Parameters.Add("@LEGALIZACIONID", SqlDbType.BigInt).Value = Legalizacion;

        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt);

        cmd.Parameters["@IDINVESTIGADOR"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            idinvestigador = cmd.Parameters["@IDINVESTIGADOR"].Value.ToString();


            con.Dispose();
        }




        return idinvestigador;




    }



    public string obtenerNombreinvestigador(string idinvestigador)
    {



        string nombreinvestigador;

        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGARNOMBREINVESTIGADOR";




        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;

        cmd.Parameters.Add("@NOMBREINVESTIGADOR", SqlDbType.VarChar, 300);

        cmd.Parameters["@NOMBREINVESTIGADOR"].Direction = ParameterDirection.Output;



        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();




            nombreinvestigador = cmd.Parameters["@NOMBREINVESTIGADOR"].Value.ToString();


            con.Dispose();
        }




        return nombreinvestigador;




    }




     public string ConsolidarCuentas88889(int idinvestigador)
    {



        string resultado;


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CONSOLIDAR_CONSIGNACIONES";

        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;

        cmd.Connection = con;
        try
        {
            con.Open();


            SqlDataReader Reader = default(SqlDataReader);

            int RecordCount = 0;

            Reader = cmd.ExecuteReader();

            string Records = null;
            



            int ColumnaNumero = 0;
            string ValorCelda = "";



            DataTable dt = new DataTable();
            dt.Load(Reader);

                        
            foreach (DataRow row in dt.Rows)
            {
                foreach (DataColumn column in dt.Columns)
                {
                    if (row[column] != null) // This will check the null values also (if you want to check).
                    {
                        // Do whatever you want.

                        var field1 = row[column].ToString();

                    }
                }
            }





            string[] Consignaciones = new string[dt.Rows.Count];

            

            

            while (Reader.Read())
            {
                                
                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {

                                        
                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));



                    if (ColumnaNumero == 0)
                    {
                        Records += Reader.GetValue(i);

                    }


                    if (ColumnaNumero == 1)
                    {
                        Records += Reader.GetValue(i);

                    }

                    if (ColumnaNumero == 2)
                    {
                        
                        Consignaciones[i] = Reader.GetValue(i).ToString();



                    }
                    if (ColumnaNumero == 3)
                    {
                        Records += Reader.GetValue(i);

                    }

                    

                    

                }


                                

                RecordCount += 1;
            }


            resultado = Records;

            


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }



        return resultado;


    }


    
    public void porfinloga()
    {


        int[] legalizaciones = new int[3];
        legalizaciones[0] = 200;
        legalizaciones[1] = 100;
        legalizaciones[2] = 100;


        int[] Consignaciones = new int[2];
        Consignaciones[0] = 100;
        Consignaciones[1] = 100;






        int LegalizacionNumero = 1;
        int SiguienteConsignacion = 0;
        int ResultadoUltimaTrans = 0;

        for (int i = 0; i < legalizaciones.Length; i++)
        {





            int ConsignacionNumero = 1;


            Console.WriteLine("legaliza numero  " + LegalizacionNumero + " Valor = " + legalizaciones[i]);

            Console.WriteLine("");

            for (int ii = 0; ii < Consignaciones.Length; ii++)
            {



                if (ii >= SiguienteConsignacion)
                {





                    int ResultadoLegaliConsig = 0;
                    int ConsignacionActual = 0;
                    int LegalizacionActual = 0;





                    if (ResultadoUltimaTrans == 0)
                    {


                        ConsignacionActual = Consignaciones[ii];

                        ResultadoLegaliConsig = ConsignacionActual - legalizaciones[i];

                    }


                    if (ResultadoUltimaTrans > 0)
                    {

                        ConsignacionActual = ResultadoUltimaTrans;

                        ResultadoLegaliConsig = ConsignacionActual - legalizaciones[i];



                    }

                    if (ResultadoUltimaTrans < 0)
                    {


                        ConsignacionActual = Consignaciones[ii];

                        LegalizacionActual = ResultadoUltimaTrans * -1;

                        ResultadoLegaliConsig = Consignaciones[ii] - LegalizacionActual;



                    }



                    Console.WriteLine("Consignacion numero  " + ConsignacionNumero + " Valor = " + ConsignacionActual);
                    Console.WriteLine("");





                    if (ResultadoLegaliConsig == 0)
                    {


                        SiguienteConsignacion = ConsignacionNumero;
                        ResultadoUltimaTrans = ResultadoLegaliConsig;
                        break;

                    }


                    if (ResultadoLegaliConsig > 0)
                    {



                        ResultadoUltimaTrans = ResultadoLegaliConsig;
                        break;


                    }

                    if (ResultadoLegaliConsig < 0)
                    {

                        ResultadoUltimaTrans = ResultadoLegaliConsig;

                    }



                }











                ConsignacionNumero = ConsignacionNumero + 1;










            }




            LegalizacionNumero = LegalizacionNumero + 1;


        }









        Console.ReadKey(true);

    }





    public string ConsolidarCuentas(int idinvestigador)
    {

        BorrarTablaViaticosLegalizacion();

        int LegalizacionNumero = 1;
        int SiguienteConsignacion = 0;
        int ResultadoUltimaTrans = 0;
        


        
        for (int i = 0; i < CargarLegalizaciones(idinvestigador).Rows.Count; i++)
        {



            int ConsignacionNumero = -1;


            //Console.WriteLine("legaliza numero  " + LegalizacionNumero + " Valor = " + legalizaciones[i]);
            //Console.WriteLine("");

            

            for (int ii = 0; ii < CargarConsignaciones(idinvestigador).Rows.Count; ii++)
            {


                ConsignacionNumero = ConsignacionNumero + 1;



                if (ii == SiguienteConsignacion  )
                {




                    int ResultadoLegaliConsig = 0;



                    if (ResultadoUltimaTrans == 0)
                    {

                       int IdconsignacionActual = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[ii]["N_ID_INGRESO_VIATICOS"]);
                       int Idlegalizacion = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["FK_ID_LEGALIZACION"]);

                       int ConsignacionActual = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[ii]["N_VALOR"]);
                       int LegalizacionActual = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["VALORTOTAL"]);
                        
                       ResultadoLegaliConsig = ConsignacionActual - LegalizacionActual;



                       InsertarRelacionLegalizacionConsignacion(Idlegalizacion, IdconsignacionActual, ResultadoLegaliConsig, ConsignacionActual, LegalizacionActual, idinvestigador);


                       if (ResultadoLegaliConsig == 0)
                       {
                           SiguienteConsignacion = ConsignacionNumero + 1;
                           ResultadoUltimaTrans = ResultadoLegaliConsig;
                           break;                       
                       }


                       if (ResultadoLegaliConsig > 0)
                       {
                           SiguienteConsignacion = ConsignacionNumero;
                           ResultadoUltimaTrans = ResultadoLegaliConsig;
                           break;
                       }


                       if (ResultadoLegaliConsig < 0)
                       {
                           SiguienteConsignacion = ConsignacionNumero + 1;
                           
                                                                                 
                           
                       }





                       
                        
                    }


                    if (ResultadoUltimaTrans > 0)
                    {

                        int IdconsignacionActual = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[ii]["N_ID_INGRESO_VIATICOS"]);
                        int Idlegalizacion = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["FK_ID_LEGALIZACION"]);                       
                        
                        
                        int ConsignacionActual = ResultadoUltimaTrans;
                        int LegalizacionActual = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["VALORTOTAL"]);
                                                
                        ResultadoLegaliConsig = ConsignacionActual - LegalizacionActual;




                        InsertarRelacionLegalizacionConsignacion(Idlegalizacion, IdconsignacionActual, ResultadoLegaliConsig, ConsignacionActual, LegalizacionActual, idinvestigador);




                        if (ResultadoLegaliConsig == 0)
                        {
                            SiguienteConsignacion = ConsignacionNumero + 1;
                            ResultadoUltimaTrans = ResultadoLegaliConsig;
                            break;
                        }


                        if (ResultadoLegaliConsig > 0)
                        {
                            SiguienteConsignacion = ConsignacionNumero;
                            ResultadoUltimaTrans = ResultadoLegaliConsig;
                            break;
                        }


                        if (ResultadoLegaliConsig < 0)
                        {
                            SiguienteConsignacion = ConsignacionNumero + 1;
                            
                            
                        }





                    }

                    if (ResultadoUltimaTrans < 0)
                    {

                        int IdconsignacionActual = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[ii]["N_ID_INGRESO_VIATICOS"]);
                        int Idlegalizacion = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["FK_ID_LEGALIZACION"]);   

                        int ConsignacionActual = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[ii]["N_VALOR"]);
                        int LegalizacionActual = ResultadoUltimaTrans * -1;

                                                
                        ResultadoLegaliConsig = ConsignacionActual - LegalizacionActual;




                        InsertarRelacionLegalizacionConsignacion(Idlegalizacion, IdconsignacionActual, ResultadoLegaliConsig, ConsignacionActual, LegalizacionActual, idinvestigador);



                        if (ResultadoLegaliConsig == 0)
                        {
                            SiguienteConsignacion = ConsignacionNumero + 1;
                            ResultadoUltimaTrans = ResultadoLegaliConsig;
                            break;
                        }


                        if (ResultadoLegaliConsig > 0)
                        {
                            SiguienteConsignacion = ConsignacionNumero;
                            ResultadoUltimaTrans = ResultadoLegaliConsig;
                            break;
                        }


                        if (ResultadoLegaliConsig < 0)
                        {
                            SiguienteConsignacion = ConsignacionNumero + 1;
                            
                            
                        }



                        


                    }


                    ResultadoUltimaTrans = ResultadoLegaliConsig;
                    

                }

                


                


            }




            LegalizacionNumero = LegalizacionNumero + 1;


        }





        








        /*



        for (int i = 0; i < CargarLegalizaciones(idinvestigador).Rows.Count; i++)
        {
            var field1 = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["N_ID_INGRESO_VIATICOS"]);

            var field2 = Convert.ToInt32(CargarLegalizaciones(idinvestigador).Rows[i]["N_VALOR"]);
              
        }





          for (int i = 0; i < CargarConsignaciones(idinvestigador).Rows.Count; i++)
        {
            var field1 = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[i]["N_ID_INGRESO_VIATICOS"]);

            var field2 = Convert.ToInt32(CargarConsignaciones(idinvestigador).Rows[i]["N_VALOR"]);
              
        }


        */



        return "noting";


    
    }







    public DataTable CargarConsignaciones(int idinvestigador)
    {



        DataTable Datatable_Consignaciones = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CONSOLIDAR_CONSIGNACIONES";
        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;        
        cmd.Connection = con;
        try
        {
            con.Open();


            Datatable_Consignaciones.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Consignaciones;


    }






    public DataTable CargarLegalizaciones(int idinvestigador)
    {



        DataTable Datatable_Legalizaciones = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_CONSOLIDAR_LEGALIZACIONES";
        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;
        cmd.Connection = con;
        try
        {
            con.Open();


            Datatable_Legalizaciones.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_Legalizaciones;


    }











                               

                        
        




public DataTable CargarViatcosTemporales()
    {



        DataTable Datatable_vIATICONES = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_VIATICOSTEMPORAL";
        
        cmd.Connection = con;
        try
        {
            con.Open();


            Datatable_vIATICONES.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_vIATICONES;


    }












    public void InsertarRelacionLegalizacionConsignacion(int legalizacionid, int ConsignacionId, int saldo, int viaticosvalor, int legalizacionvalor, int idinvestigador)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_VIATICOSLEGALIZACION";


        cmd.Parameters.Add("@LEGALIZACION", SqlDbType.BigInt).Value = legalizacionid;


        cmd.Parameters.Add("@VIATICOS", SqlDbType.BigInt).Value = ConsignacionId;


        cmd.Parameters.Add("@SALDO", SqlDbType.BigInt).Value = saldo;


        cmd.Parameters.Add("@VIATICOSVALOR", SqlDbType.BigInt).Value = viaticosvalor;

        cmd.Parameters.Add("@LEGALIZACIONVALOR", SqlDbType.BigInt).Value = legalizacionvalor;

        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;

        


        

        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }











    public void BorrarTablaViaticosLegalizacion()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DELETE_TBL_VIATICOSLEGALIZACION";




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }





    public void BorrarTablaViaticosTemporal()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_DELETE_TBL_INGRESO_DE_VIATICOS_TEMPORAL";




        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }









    public DataTable REPORTE_CASOS_COMPANIA(string IDCOMPANIA)
    {


        DataTable Datatable_REPORTE = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_REPORTE_CASOS_COMPANIA";
        cmd.Parameters.Add("@IDCOMPANIA", SqlDbType.BigInt).Value = IDCOMPANIA;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_REPORTE.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_REPORTE;


    }












    public DataTable REPORTE_CONSIGNACIONES_VS_LEGALIZACIONES()
    {


        DataTable Datatable_REPORTE = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_REPORTE_CONSIGNACIONES_VS_LEGALIZACIONES";
        //cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = idinvestigador;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_REPORTE.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_REPORTE;


    }






    public DataTable BitacoraDeCaso(string NumeoDeCaso)
    {


        DataTable Datatable_REPORTE = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_BITACORADECASO";
        cmd.Parameters.Add("@NUMEROCASO", SqlDbType.BigInt).Value = NumeoDeCaso;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_REPORTE.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_REPORTE;


    }




    public DataTable BitacoraDeCasoInvestigador(int Investigador)
    {


        DataTable Datatable_REPORTE = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_BITACORADEINVESTIGADOR";
        cmd.Parameters.Add("@IDINVESTIGADOR", SqlDbType.BigInt).Value = Investigador;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_REPORTE.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_REPORTE;


    }






    public void InsertarBitacora(string numerodecaso ,string Texto,int Investigador)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_BITACORA";


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = numerodecaso;


        cmd.Parameters.Add("@TEXT", SqlDbType.VarChar).Value = Texto;

        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.BigInt).Value = Investigador;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }



    public void InsertarBitacoraInvestigador(string Texto, int Investigador)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_INSERTAR_BITACORA_INVESTIGADOR";


       


        cmd.Parameters.Add("@TEXT", SqlDbType.VarChar).Value = Texto;

        cmd.Parameters.Add("@INVESTIGADOR", SqlDbType.BigInt).Value = Investigador;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }






    public void ActualzarEstado(string numerodecaso, int Estado)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CAMBIODEESTADOCASO";


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = numerodecaso;


        cmd.Parameters.Add("@Estado", SqlDbType.BigInt).Value = Estado;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }




    public void ActualzarLaborales(string numerodecaso, int Estado)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CAMBIODEESTADOCASOLABORALES";


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = numerodecaso;


        cmd.Parameters.Add("@Estado", SqlDbType.BigInt).Value = Estado;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }




    public void ActualizarAsignacionInvestigador(string numerodecaso, String Estado)
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CAMBIODEINVESTIGACION";


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = numerodecaso;


        cmd.Parameters.Add("@Estado", SqlDbType.BigInt).Value = Estado;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            con.Dispose();
        }





    }








    public DataTable CONSIGNACIONCORESPONDIENTE(string idlegalizacion)
    {


        DataTable Datatable_REPORTE = new DataTable();


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CONSIGNACIONCORESPONDIENTE_LEGALIZACION";
        cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = idlegalizacion;
        cmd.Connection = con;
        try
        {
            con.Open();

            Datatable_REPORTE.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }


        return Datatable_REPORTE;


    }






}