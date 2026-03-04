using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_GastosInvestigacion : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    string NumeroDeCaso;
    protected void Page_Load(object sender, EventArgs e)
    {


        //NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoGastos"];

        //NumeroDeCaso = "5496";

        //LabelTotalGastos.Text =  ContaCasoObject.TotalGastosCaso(NumeroDeCaso);


        if (IsPostBack)
        {
        }
            
        else
        {



            DropDownListInvestigador.DataSource = ContaCasoObject.CargarInvestigadores();
            DropDownListInvestigador.DataValueField = "Id_Investigador";
            DropDownListInvestigador.DataTextField = "Investigador";
            DropDownListInvestigador.DataBind();


            //MonstrarNuevo();






        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

    }
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {



        GridViewLegalizaciones.EmptyDataText = "No Records Found";
        GridViewLegalizaciones.DataSource = ContaCasoObject.CargarlegalizacionesInvestigador(DropDownListInvestigador.SelectedValue);
        GridViewLegalizaciones.DataBind();




        GridViewGastos.EmptyDataText = "No Records Found";
        GridViewGastos.DataSource = ContaCasoObject.CargarConsignacionesInvestigador(DropDownListInvestigador.SelectedValue);
        GridViewGastos.DataBind();




        LabeLPendientePorLegalizar.Text = Convert.ToInt32(ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue))).ToString("N0"); 

        LabelTotalConsignaciones.Text = Convert.ToInt32(ContaCasoObject.TOTALconsignaciones(DropDownListInvestigador.SelectedValue)).ToString("N0");

        LabelTotalLegalizaciones.Text = Convert.ToInt32(ContaCasoObject.TOTALLEGALIZACION(DropDownListInvestigador.SelectedValue)).ToString("N0");






     




    }
    protected void GridViewGastos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewGastos.SelectedRow;

        //Server.Transfer("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");

        Page.Response.Redirect("~/Condata/Consignaciones/" + row.Cells[0].Text + ".pdf");


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridViewLegalizaciones_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewLegalizaciones.SelectedRow;

        Page.Response.Redirect("~/ContaCaso/NuevaLegalizacion.aspx" + row.Cells[1].Text + "y" + row.Cells[4].Text);


    }

    
    void MonstrarReporte()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_REPORTE_CONSIGNACIONES_VS_LEGALIZACIONES";

       
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

            int NumeroLegalizacionEncurso = 0;
            int NumeroUltimaConsignacion = 0;


            string UltimoCasoNumeroA = "";
            string UltimoCasoNumeroB = "";

            bool REPETIDO = false;
            bool CONSIGNACIONREPETIDO = false;


            while (Reader.Read())
            {







                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {

                    
                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));

                    
             

                    if (ColumnaNumero == 0)
                    {

                        if (Convert.ToInt32(ValorCelda) == NumeroLegalizacionEncurso)
                        {


                            //Records += "repetidooooooo" + Reader.GetValue(i) + "---";

                            REPETIDO = true;

                        }
                        else
                        {



                            REPETIDO = false;
                            Records += "<br/>**************************************************************************************************************************************************************************************<br/>";
                            Records += "LEGALIZACION DE GASTOS ORDEN NUMERO:<br/>LEGALIZACION NUMERO:<br/>INVESTIGADOR:<br/><br/>ASEGURADO:<br/>COMPAÑIA:<br/>CIUDAD:<br/>FECHA DE ASIGNACION :<br/>FECHA DE VISITA :<br/><br/><br/>"+MonstrarGastos(Convert.ToInt32(ValorCelda)) +"<br/><br/>";
                               

                            


                            Records += "LEGALIZACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;";

                        }                      

                        
                      
                        NumeroLegalizacionEncurso = Convert.ToInt32(ValorCelda);

                    }





                    if (REPETIDO)
                    {

                        if (ColumnaNumero == 8)
                        {

                            if (Convert.ToInt32(ValorCelda) == NumeroUltimaConsignacion)
                            {


                                Records += "<br/><br/>VIENE-MISION:" + UltimoCasoNumeroB + "&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";


                            }
                            else
                            {



                                Records += "<br/>&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp;#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                            }


                            NumeroUltimaConsignacion = Convert.ToInt32(ValorCelda);


                        }
                        if (ColumnaNumero == 9)
                        {
                            Records += "VALOR:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 10)
                        {
                            Records += "FECHA:&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 11)
                        {
                            Records += "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;SALDO&nbsp;:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";

                            //Records += "<br/>***************FINAL****************";

                        }




                    }
                    else
                    {


                        if (ColumnaNumero == 1)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 2)
                        {
                            Records += "<br/>CASO:" + Reader.GetValue(i) + "---------------------";

                            UltimoCasoNumeroA = ValorCelda;

                        }
                        if (ColumnaNumero == 3)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 4)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 5)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 6)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 7)
                        {
                            Records += "VALOR:&nbsp;($" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + ")&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 8)
                        {




                            if (Convert.ToInt32(ValorCelda) == NumeroUltimaConsignacion)
                            {


                                Records += "<br/><br/>VIENE-MISION:"+ UltimoCasoNumeroB + "&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";


                            }
                            else
                            {
                                


                                Records += "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                            }

                                                       

                            NumeroUltimaConsignacion = Convert.ToInt32(ValorCelda);






                        }
                        if (ColumnaNumero == 9)
                        {
                            Records += "VALOR:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 10)
                        {
                            Records += "FECHA:&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 11)
                        {
                            Records += "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;SALDO&nbsp;:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";
                           


                        }






                    }














                }





                UltimoCasoNumeroB = UltimoCasoNumeroA;


                        Records += " <br/> ";



                






                RecordCount += 1;
            }



           





            Panel1.Controls.Add(new LiteralControl(Records));


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

    
    void MonstrarReporteNuevo()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_REPORTE_CONSIGNACIONES_VS_LEGALIZACIONES";


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

            int NumeroLegalizacionEncurso = 0;
            int NumeroUltimaConsignacion = 0;


            string UltimoCasoNumeroA = "";
            string UltimoCasoNumeroB = "";

            bool REPETIDO = false;
            bool CONSIGNACIONREPETIDO = false;


            while (Reader.Read())
            {







                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {


                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));




                    if (ColumnaNumero == 0)
                    {

                        if (Convert.ToInt32(ValorCelda) == NumeroLegalizacionEncurso)
                        {


                            //Records += "repetidooooooo" + Reader.GetValue(i) + "---";

                            REPETIDO = true;

                        }
                        else
                        {



                            REPETIDO = false;
                            Records += "<br/>**************************************************************************************************************************************************************************************<br/>";
                            Records += "LEGALIZACION DE GASTOS ORDEN NUMERO:<br/>LEGALIZACION NUMERO:<br/>INVESTIGADOR:<br/><br/>ASEGURADO:<br/>COMPAÑIA:<br/>CIUDAD:<br/>FECHA DE ASIGNACION :<br/>FECHA DE VISITA :<br/><br/><br/>" + MonstrarGastos(Convert.ToInt32(ValorCelda)) + "<br/><br/>";





                            Records += "LEGALIZACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;";

                        }



                        NumeroLegalizacionEncurso = Convert.ToInt32(ValorCelda);

                    }





                    if (REPETIDO)
                    {

                        if (ColumnaNumero == 8)
                        {

                            if (Convert.ToInt32(ValorCelda) == NumeroUltimaConsignacion)
                            {


                                Records += "<br/><br/>VIENE-MISION:" + UltimoCasoNumeroB + "&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";


                            }
                            else
                            {



                                Records += "<br/>&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp;#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                            }


                            NumeroUltimaConsignacion = Convert.ToInt32(ValorCelda);


                        }
                        if (ColumnaNumero == 9)
                        {
                            Records += "VALOR:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 10)
                        {
                            Records += "FECHA:&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 11)
                        {
                            Records += "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;SALDO&nbsp;:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";

                            //Records += "<br/>***************FINAL****************";

                        }




                    }
                    else
                    {


                        if (ColumnaNumero == 1)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 2)
                        {
                            Records += "<br/>CASO:" + Reader.GetValue(i) + "---------------------";

                            UltimoCasoNumeroA = ValorCelda;

                        }
                        if (ColumnaNumero == 3)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 4)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 5)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 6)
                        {
                            //Records += "&nbsp;&nbsp;&nbsp;&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 7)
                        {
                            Records += "VALOR:&nbsp;($" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + ")&nbsp;&nbsp;&nbsp;&nbsp;";

                        }
                        if (ColumnaNumero == 8)
                        {




                            if (Convert.ToInt32(ValorCelda) == NumeroUltimaConsignacion)
                            {


                                Records += "<br/><br/>VIENE-MISION:" + UltimoCasoNumeroB + "&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";


                            }
                            else
                            {



                                Records += "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;CONSIGNACION&nbsp#&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                            }



                            NumeroUltimaConsignacion = Convert.ToInt32(ValorCelda);






                        }
                        if (ColumnaNumero == 9)
                        {
                            Records += "VALOR:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 10)
                        {
                            Records += "FECHA:&nbsp;" + Reader.GetValue(i) + "&nbsp;&nbsp;&nbsp;&nbsp;";

                        }

                        if (ColumnaNumero == 11)
                        {
                            Records += "<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;SALDO&nbsp;:&nbsp;$" + Convert.ToInt32(Reader.GetValue(i)).ToString("N0") + "&nbsp;&nbsp;&nbsp;&nbsp;";



                        }






                    }














                }





                UltimoCasoNumeroB = UltimoCasoNumeroA;


                Records += " <br/> ";










                RecordCount += 1;
            }









            Panel1.Controls.Add(new LiteralControl(Records));


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
            
    void  MonstrarNuevo()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_REPORTE_CONSIGNACIONES_VS_LEGALIZACIONES";
        


        cmd.Connection = con;
        /*
        try
        {
        */
            con.Open();


            SqlDataReader Reader = default(SqlDataReader);

            int RecordCount = 0;

            Reader = cmd.ExecuteReader();

            string Records = null;



            int ColumnaNumero = 0;
            string ValorCelda = "";

            int NumeroLegalizacionAnterior = 0;
            int NumeroConsignacionAnterior = 0;
            int NumeroDeCasoAnterior = 0;


            string NumeroDeLegalizacion = "";
            string ValorLegalizacion = "";

            string NumeroDeViatico = "";
            string ValorViaticos = "";

            
            string Saldo = "";



            string NumeroDeCaso2 = "0";




            while (Reader.Read())
            {



                


                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {


                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));



                    if (ColumnaNumero == 1)
                    {
                        NumeroDeViatico = ValorCelda;
                    }


                    if (ColumnaNumero == 2)
                    {
                        NumeroDeLegalizacion = ValorCelda;
                    }


                    if (ColumnaNumero == 3)
                    {

                        Saldo = ValorCelda;

                    }


                    if (ColumnaNumero == 4)
                    {

                        ValorViaticos = ValorCelda;

                    }


                    if (ColumnaNumero ==5)
                    {

                        ValorLegalizacion = ValorCelda;

                    }              

                                      


                }


                if (NumeroLegalizacionAnterior == Convert.ToInt32(NumeroDeLegalizacion))
                {


                string fecha = "no";
                ContaCasoObject.fECHAcONSIGNACION(NumeroDeViatico, out fecha);

                Records += "<tr>" + "<td>&nbsp;&nbsp;  </td>" + "<td> &nbsp;&nbsp;   </td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "CONSIGNACION #" + NumeroDeViatico + "</td>" + "<td>$&nbsp;&nbsp;" + Convert.ToInt32(ValorViaticos).ToString("N0") + "</td>"  + "<td>&nbsp;&nbsp" + fecha + "</td>" + "</tr>";
                    Records += "<tr>" + "<td>&nbsp;&nbsp;  </td>" + "<td> &nbsp;&nbsp;   </td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "SALDO:" + "</td>" + "<td>$&nbsp;&nbsp;" + Convert.ToInt32(Saldo).ToString("N0") + "</td>" + "</tr>";
                   
                   


                }
                else
                {


                    
                    string NombreDelAfiliado = "no";
                    string Compania = "no";
                    string cIUDAD = "no";




                ContaCasoObject.DatosDeCaso2(NumeroDeLegalizacion, out NumeroDeCaso2, out NombreDelAfiliado, out Compania);


                ContaCasoObject.CIUDADLEGALIZACION(NumeroDeLegalizacion, out cIUDAD);


                Records += "</table>";

                    Records += "<br/>*****************************************************************************************************************************************************************************<br/>";
                    Records += "<H2>LEGALIZACION DE GASTOS NUMERO:&nbsp;" + NumeroDeLegalizacion + " ORDEN:&nbsp;" + NumeroDeCaso2 + "</H2><br/>";



                    Records += "<table >";

                    Records += "<tr>" + "<td>" + "<b>INVESTIGADOR:</b>" + "</td>" + "<td>" + "&nbsp;<ins>" + DropDownListInvestigador.SelectedItem.Text + "</ins>" + "</td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "<b>ASEGURADO:</b>" + " </td>" + "<td>" + "&nbsp;<ins>" + NombreDelAfiliado + "</ins>" + "</td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "<b>FECHA DE VISITA:</b>" + "</td>" + "<td>" + "____________" + "</td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "<b>ASEGURADORA:</b>" + "</td>" + "<td>" + "&nbsp;<ins>" + Compania + "</ins>" + "</td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "<b>CIUDAD:</b>" + "</td>" + "<td>" + "&nbsp;<ins>" + cIUDAD + "</ins>" + "</td>" + "</tr>";


                    Records += "</table>";


                    Records += "<br/><br/><b>GASTOS GENERADOS</b>&nbsp;<br/>";



                    Records += MonstrarGastos(Convert.ToInt32(NumeroDeLegalizacion));


                    Records += "<br/><b>TOTAL:</b>&nbsp;<b>$&nbsp;&nbsp;" + Convert.ToInt32(ValorLegalizacion).ToString("N0") + "</b><br/>";



                    

                    Records += "<br/><br/><b>PANEL DE CUENTAS</b>&nbsp;<br/><br/>";
                    Records += "<table border='1'>";
                    Records += "<tr>" + "<td>" + "VALOR LEGALIZACION:" + "</td>" + "<td>$&nbsp;&nbsp;" + Convert.ToInt32(ValorLegalizacion).ToString("N0") + "</td>" + "</tr>";
                    Records += "<tr>" + "<td>&nbsp;&nbsp;  </td>" + "<td> &nbsp;&nbsp;   </td>" + "</tr>";



               



                if (NumeroConsignacionAnterior == Convert.ToInt32(NumeroDeViatico))
                    {

                    string fecha = "no";
                    ContaCasoObject.fECHAcONSIGNACION(NumeroDeViatico, out fecha);


                    Records += "<tr>" + "<td>" + "CONSIGNACION #" + NumeroDeViatico + "<br/>VIENE SALDO LEGALIZACION #" + NumeroLegalizacionAnterior+ "<br/>CASO #" + NumeroDeCasoAnterior + "</td>" + "<td>$&nbsp;&nbsp;" + Convert.ToInt32(ValorViaticos).ToString("N0") + "</td>" + "<td>&nbsp;&nbsp" + fecha + "</td>" + "</tr>";

                    }
                    else
                    {

                    string fecha = "no";
                    ContaCasoObject.fECHAcONSIGNACION(NumeroDeViatico, out fecha);

                    Records += "<tr>" + "<td>" + "CONSIGNACION #" + NumeroDeViatico + "</td>" + "<td>$&nbsp;&nbsp;" + Convert.ToInt32(ValorViaticos).ToString("N0") + "</td>"  + "<td>&nbsp;&nbsp" + fecha + "</td>"  + "</tr>";


                    }                  


                    Records += "<tr>" + "<td>&nbsp;&nbsp;  </td>" + "<td> &nbsp;&nbsp;   </td>" + "</tr>";
                    Records += "<tr>" + "<td>" + "SALDO:" + "</td>" + "<td>$&nbsp;&nbsp;" + Convert.ToInt32(Saldo).ToString("N0") + "</td>" + "</tr>";
                  
                   



                }










                

                NumeroLegalizacionAnterior = Convert.ToInt32(NumeroDeLegalizacion);
                NumeroConsignacionAnterior = Convert.ToInt32(NumeroDeViatico);
                NumeroDeCasoAnterior = Convert.ToInt32(NumeroDeCaso2);




                NumeroDeLegalizacion = "";
                 
                 
                 
                 
                 ValorLegalizacion = "";
                 NumeroDeViatico = "";
                 ValorViaticos = "";
                 
                 Saldo = "";





                RecordCount += 1;

            }




            Panel1.Controls.Add(new LiteralControl(Records));


/*

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


    */



    }

    


    public string MonstrarGastos(int NumeroLegalizacion)
    {



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


            SqlDataReader Reader = default(SqlDataReader);

            int RecordCount = 0;

            Reader = cmd.ExecuteReader();

            string Records = null;



            int ColumnaNumero = 0;
            string ValorCelda = "";


            string Columna0 = "";
            string Columna1 = "";
            string Columna2 = "";
            string Columna3 = "";



            while (Reader.Read())
            {

             


                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {


                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));




                    if (ColumnaNumero == 0)
                    {

                        Columna0 = ValorCelda;                     

                    }

                    if (ColumnaNumero == 1)
                    {

                        Columna1 = ValorCelda;

                    }

                    if (ColumnaNumero == 2)
                    {

                        Columna2 = ValorCelda;

                    }


                    if (ColumnaNumero == 3)
                    {

                        Columna3 = ValorCelda;

                    }


                }



               

                Records += "<tr>" + "<td>" + Columna0 + "</td>"+ "<td>$&nbsp;&nbsp;" + Convert.ToInt32(Columna2).ToString("N0") + "</td>"+ "<td>" + Columna1 + "</td>" + "</tr>";

             



                Columna0 = "";
                Columna1 = "";
                Columna2 = "";
                Columna3 = "";



              
                RecordCount += 1;

            }




            Records = "<table border='1'><th>DESCRIPCION</th><th>VALOR</th><th>FECHA</th>" + Records + "</table>";

           




            return Records;

            


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










    protected void Button1_Click1(object sender, EventArgs e)
    {

        string RESULTADO;
        int investigador = Convert.ToInt32(DropDownListInvestigador.SelectedValue);


        RESULTADO = ContaCasoObject.ConsolidarCuentas(investigador);


        MonstrarNuevo();



    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}