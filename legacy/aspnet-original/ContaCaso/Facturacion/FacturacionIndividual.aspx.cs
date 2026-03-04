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
    string NumeroDeFactura;


   
    int gastosinvestigacion;
    int servicioinvestigacion;
    int subtotafactura;
    int iva;
    int totalapagar;

    string Records = null;

    protected void Page_Load(object sender, EventArgs e)
    {


       NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoFacturacion"];
       NumeroDeFactura = (string)Page.RouteData.Values["NumeroDeFacturaPa"];



        if (IsPostBack)
        {
        }
            
        else
        {



            CargarGastosDeFactura();

            DropDownList_Concepto.DataSource = ContaCasoObject.CargarConceptos();
            DropDownList_Concepto.DataValueField = "N_ID_CONCEPTO";
            DropDownList_Concepto.DataTextField = "T_NOMBRE";
            DropDownList_Concepto.DataBind();


            GridViewGastos.EmptyDataText = "No Records Found";
            GridViewGastos.DataSource = ContaCasoObject.CargarGastosNumeroDeCaso(NumeroDeCaso);
            GridViewGastos.DataBind();


            GridViewFacturaGastos.EmptyDataText = "No Records Found";
            GridViewFacturaGastos.DataSource = ContaCasoObject.CargarGastosFactura(NumeroDeCaso,NumeroDeFactura);
            GridViewFacturaGastos.DataBind();





           


            string COMPANIA;
            string NUMERODECASOTRAIDO;
            string ASEGURADO;
            string CIUDAD;
            string TIPODECASO;
            string INVESTIGADOR;
            string FECHAASIGNACION;
            string FECHAENTREGA;
            string CIUDADDEPART;
            string CEDULA;
            
            string NOMBREANALISTA;
            string NITCOMPANIA;
            string IDTIPODECASO;
            string IDCOMPANIA;





            ContaCasoObject.DatosDeCasoFactura(NumeroDeCaso, out COMPANIA, out NUMERODECASOTRAIDO, out ASEGURADO, out CIUDAD, out TIPODECASO, out INVESTIGADOR, out FECHAASIGNACION, out FECHAENTREGA, out CIUDADDEPART, out CEDULA,out NOMBREANALISTA,out NITCOMPANIA, out IDTIPODECASO,out IDCOMPANIA);





            LabelIDFACTURA.Text = NumeroDeFactura;

            LabelCiudadFactura.Text = "BOGOTA DC";

          

            LabelNombreAnalista.Text = NOMBREANALISTA;

            LabelFechaVencimiento.Text = "";

            LabelCompania.Text = COMPANIA;

            LabelNitCpmpania.Text = NITCOMPANIA;

            LabelDieccion.Text = "";

            LabelNombreDelAfiliado.Text = ASEGURADO;

            LabelCedula.Text = CEDULA;

            LabelTipoDeCaso.Text = TIPODECASO;

            LabelNumeroDeCaso.Text = NUMERODECASOTRAIDO;
           
            LabelCiudad.Text = CIUDADDEPART;




                       
            string FECHAFACTURA;
            string CASOFINALIZADO;
            string FACTURAFISICA;

            ContaCasoObject.Traerfechafactura(NumeroDeFactura, out FECHAFACTURA,out CASOFINALIZADO ,out FACTURAFISICA);

            LabelFechaDeFactura.Text = FECHAFACTURA;

            LabelIDFACTURAFISICA.Text = FACTURAFISICA;


            string SERVICIODEINVESTIGACION;                                    
            ContaCasoObject.TraerValorServicio(IDCOMPANIA, IDTIPODECASO, out SERVICIODEINVESTIGACION);


            LabelServicioDeInvestigacion0.Text = SERVICIODEINVESTIGACION;          





            LabelGastosInvestigacion.Text = ContaCasoObject.TotalGastosFACTURA(NumeroDeCaso, NumeroDeFactura);


          



            if (LabelServicioDeInvestigacion0.Text == "" || LabelGastosInvestigacion.Text == "")
            {



                int valordefecto = 0;




                if (LabelServicioDeInvestigacion0.Text == "")
                {

                   
                }
                else {


                    if (IDCOMPANIA == "15") {


                        servicioinvestigacion = Convert.ToInt32(LabelServicioDeInvestigacion0.Text);
                        LabelServicioDeInvestigacion0.Text = servicioinvestigacion.ToString("N0");
                        LabelServicioDeInvestigacion2.Text = servicioinvestigacion.ToString("N0");




                        LabelGastosInvestigacion.Text = valordefecto.ToString();
                        LabelGastosInvestigacion0.Text = valordefecto.ToString();

                        LabelSubTotal.Text = servicioinvestigacion.ToString();
                        LabelSubTotal0.Text = servicioinvestigacion.ToString();


                        LabelIVA.Text = valordefecto.ToString();
                        LabelIVA0.Text = valordefecto.ToString();




                        LabelTotalAPagar.Text = servicioinvestigacion.ToString();
                        LabelTotalAPagar0.Text = servicioinvestigacion.ToString();




                        Session["striservicioinvestigacion"] = servicioinvestigacion.ToString();


                        Session["strigastosinvestigacion"] = valordefecto.ToString();



                        Session["strisubtotafactura"] = servicioinvestigacion.ToString();
                        Session["striiva"] = valordefecto.ToString();

                        Session["stritotalapagar"] = servicioinvestigacion.ToString();


                        TextBoxNumeroFacturaFisica.Text = "0";
                        TextBoxNumeroFacturaFisica.Enabled = false;




                    }              

                 



                }




            


            }
            else
            {

                servicioinvestigacion = Convert.ToInt32(LabelServicioDeInvestigacion0.Text);
                LabelServicioDeInvestigacion0.Text = servicioinvestigacion.ToString("N0");
                LabelServicioDeInvestigacion2.Text = servicioinvestigacion.ToString("N0");


                gastosinvestigacion = Convert.ToInt32(LabelGastosInvestigacion.Text);


                
                LabelGastosInvestigacion.Text = gastosinvestigacion.ToString("N0");
                LabelGastosInvestigacion0.Text = gastosinvestigacion.ToString("N0");




                switch (Convert.ToInt32(IDCOMPANIA))
                {
                    case 15:



                        subtotafactura = servicioinvestigacion + gastosinvestigacion;

                        LabelSubTotal.Text = subtotafactura.ToString("N0");
                        LabelSubTotal0.Text = subtotafactura.ToString("N0");




                        iva = 0;

                        LabelIVA.Text = iva.ToString("N0");
                        LabelIVA0.Text = iva.ToString("N0");



                        

                        LabelTotalAPagar.Text = subtotafactura.ToString();


                     
                       
                        totalapagar = Convert.ToInt32(LabelTotalAPagar.Text);

                        LabelTotalAPagar.Text = totalapagar.ToString("N0");
                        LabelTotalAPagar0.Text = totalapagar.ToString("N0");


                        if (IDTIPODECASO == "5")
                        {


                        }
                        else
                        {

                            TextBoxNumeroFacturaFisica.Text = "0";
                            TextBoxNumeroFacturaFisica.Enabled = false;

                        }

                       





                        break;


                    case 223:



                       





                        break;


                    default:


                        subtotafactura = servicioinvestigacion + gastosinvestigacion;

                        LabelSubTotal.Text = subtotafactura.ToString("N0");
                        LabelSubTotal0.Text = subtotafactura.ToString("N0");



                        LabelIVA.Text = Convert.ToString(Convert.ToInt32(subtotafactura) * 0.16);
                        LabelIVA.Text = LabelIVA.Text.Substring(0, LabelIVA.Text.LastIndexOf(",") + 1);


                        if (LabelIVA.Text == "")
                        {

                            LabelIVA.Text = Convert.ToString(Convert.ToInt32(subtotafactura) * 0.16);

                        }
                        else {

                            LabelIVA.Text = LabelIVA.Text.Replace(",", string.Empty);
                        }

                       


                        iva = Convert.ToInt32(LabelIVA.Text);

                        LabelIVA.Text = iva.ToString("N0");
                        LabelIVA0.Text = iva.ToString("N0");






                        LabelTotalAPagar.Text = Convert.ToString(1.16 * Convert.ToInt32(subtotafactura));

                        LabelTotalAPagar.Text = LabelTotalAPagar.Text.Substring(0, LabelTotalAPagar.Text.LastIndexOf(",") + 1);

                        if (LabelTotalAPagar.Text == "")
                        {

                            LabelTotalAPagar.Text = Convert.ToString(1.16 * Convert.ToInt32(subtotafactura));

                        }
                        else {

                            LabelTotalAPagar.Text = LabelTotalAPagar.Text.Replace(",", string.Empty);
                        }




                           


                        totalapagar = Convert.ToInt32(LabelTotalAPagar.Text);

                        LabelTotalAPagar.Text = totalapagar.ToString("N0");
                        LabelTotalAPagar0.Text = totalapagar.ToString("N0");






                        break;
                }




                Session["strigastosinvestigacion"] = gastosinvestigacion.ToString();
                  Session["striservicioinvestigacion"] = servicioinvestigacion.ToString();
                 Session["strisubtotafactura"] = subtotafactura.ToString();
                 Session["striiva"] = iva.ToString();
                 Session["stritotalapagar"] = totalapagar.ToString();





                LabelValorEnLetras.Text = ContaCasoObject.enletras(LabelTotalAPagar.Text) + " PESOS MCTE";

            }




            if (CASOFINALIZADO == "1")

            {


                Div_ListaConceptos.Visible = false;

                Div1.Visible = false;

                Div2.Visible = false;



                GridViewFacturaGastos.Columns[0].Visible = false;




            }




        }










    }







    void CargarGastosDeFactura()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_GASTOS_FACTURA_IMPRIMIR";
        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;
        cmd.Parameters.Add("@NUMEROFACTURA", SqlDbType.BigInt).Value = NumeroDeFactura;


        cmd.Connection = con;
        try
        {
            con.Open();


            SqlDataReader Reader = default(SqlDataReader);

            int RecordCount = 0;

            Reader = cmd.ExecuteReader();

            string NombreConceto = null;
            string ValorConcepto = null;
            



            int ColumnaNumero = 0;
            string ValorCelda = "";


            while (Reader.Read())
            {







                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {






                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));



                    
                    if (ColumnaNumero == 1)
                    {
                        

                        NombreConceto = ValorCelda;

                    }

                    if (ColumnaNumero == 2)
                    {


                        ValorConcepto = ValorCelda;

                    }








                }



                if (RecordCount <= 13) {



                    Label lblConcepto = ((Label)Div_factura.FindControl("LabelNombre" + RecordCount));

                    lblConcepto.Text = NombreConceto;





                    Label lblValor = ((Label)Div_factura.FindControl("LabelValor" + RecordCount));

                    lblValor.Text = Convert.ToInt32(ValorConcepto).ToString("N0");




                }

                


                RecordCount += 1;
            }




          


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



     


    protected void Button1_Click(object sender, EventArgs e)
    {
        ContaCasoObject.InsertarGastoCaso
           (DropDownList_Concepto.SelectedValue, TextBoxValor.Text,NumeroDeCaso);

        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionIndividual.aspx" + NumeroDeCaso + "y" + NumeroDeFactura);


    }
    


   
    
    protected void GridViewGastos_SelectedIndexChanged(object sender, EventArgs e)
    {
        


        GridViewRow row = GridViewGastos.SelectedRow;

        ContaCasoObject.AgregarGastoAfactura(row.Cells[1].Text, NumeroDeFactura);


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionIndividual.aspx" + NumeroDeCaso + "y" + NumeroDeFactura);


    }




    protected void Button2_Click(object sender, EventArgs e)
    {



        ContaCasoObject.FinalizarFactura(NumeroDeFactura, TextBoxNumeroFacturaFisica.Text, Convert.ToString(Session["striservicioinvestigacion"]), Convert.ToString(Session["strigastosinvestigacion"]), Convert.ToString(Session["strisubtotafactura"]), Convert.ToString(Session["striiva"]), Convert.ToString(Session["stritotalapagar"]));


                


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionCaso.aspx" + NumeroDeCaso );



    }

    protected void GridViewFacturaGastos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewFacturaGastos.SelectedRow;

        ContaCasoObject.QuitarGastoAfactura(row.Cells[1].Text);


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionIndividual.aspx" + NumeroDeCaso + "y" + NumeroDeFactura);




    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {


       // string fechafactura = Calendar1.SelectedDate.Day.ToString() + "/" + Calendar1.SelectedDate.Month.ToString() + "/" + Calendar1.SelectedDate.Year.ToString();

       

        ContaCasoObject.ActualizarfechaFactura(NumeroDeFactura,Calendar1.SelectedDate);

        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionIndividual.aspx" + NumeroDeCaso + "y" + NumeroDeFactura);



    }
}