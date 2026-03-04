using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_GastosInvestigacion : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    string NumeroDeFactura;

    string Records = null;

    protected void Page_Load(object sender, EventArgs e)
    {


       
        NumeroDeFactura = (string)Page.RouteData.Values["NumeroDeFacturaPa2"];




        if (IsPostBack)
        {
        }
            
        else
        {

                        

            GridViewFacturas.EmptyDataText = "No Records Found";
            GridViewFacturas.DataSource = ContaCasoObject.CargarPrefacturas();
            GridViewFacturas.DataBind();



            GridViewFacturasDeFacturasServicio.EmptyDataText = "No Records Found";
            GridViewFacturasDeFacturasServicio.DataSource = ContaCasoObject.CargarFacturasDeFacturaServicio(NumeroDeFactura);
            GridViewFacturasDeFacturasServicio.DataBind();


            GridViewGastosFacturaDeFactura.EmptyDataText = "No Records Found";
            GridViewGastosFacturaDeFactura.DataSource = ContaCasoObject.CargarFacturasDeFacturaGastos(NumeroDeFactura);
            GridViewGastosFacturaDeFactura.DataBind();


            GridViewGastosFijos.EmptyDataText = "No Records Found";
            GridViewGastosFijos.DataSource = ContaCasoObject.CargarFacturasDeFacturaGastosFijos(NumeroDeFactura);
            GridViewGastosFijos.DataBind();







            string FECHAFACTURA;
            string CASOFINALIZADO;
            string FACTURAFISICA;

            ContaCasoObject.Traerfechafactura(NumeroDeFactura, out FECHAFACTURA, out CASOFINALIZADO, out FACTURAFISICA);

            LabelFechaDeFactura.Text = FECHAFACTURA;

            LabelIDFACTURAFISICA.Text = FACTURAFISICA;

            LabelIDFACTURA.Text = NumeroDeFactura;


            LabelFechaDeFactura0.Text = FECHAFACTURA;

            LabelIDFACTURAFISICA0.Text = FACTURAFISICA;

            LabelIDFACTURA0.Text = NumeroDeFactura;

            LabelFechaDeFactura1.Text = FECHAFACTURA;

            LabelIDFACTURAFISICA1.Text = FACTURAFISICA;

            LabelIDFACTURA1.Text = NumeroDeFactura;



            string SERVICIODEINVESTIGACION;

            ContaCasoObject.TraerValorServicioFacturaMultiple(NumeroDeFactura, out SERVICIODEINVESTIGACION);


            


            string GASTOSDEINVESTIGACION;

            ContaCasoObject.TraerValorGastosFacturaMultiple(NumeroDeFactura, out GASTOSDEINVESTIGACION);


          


            string dumyy;
            string GASTOSDEINVESTIGACIONFIJOS;

            ContaCasoObject.TraerValorGastosfIJOSFacturaMultiple(NumeroDeFactura,out dumyy, out GASTOSDEINVESTIGACIONFIJOS);


        

         


            if (SERVICIODEINVESTIGACION == "" || GASTOSDEINVESTIGACION == "" || GASTOSDEINVESTIGACIONFIJOS == "")
            {
            }
            else
            {


                Session["striservcioinvestigacionmultiple"] = SERVICIODEINVESTIGACION;
                LabelServicioDeInvestigacion0.Text = Convert.ToInt32(SERVICIODEINVESTIGACION).ToString("N0");
                LabelServicioDeInvestigacion1.Text = Convert.ToInt32(SERVICIODEINVESTIGACION).ToString("N0");


                Session["strigastosvariablesmultiple"] = GASTOSDEINVESTIGACION;
                LabelGastosDeInvestigacion.Text = Convert.ToInt32(GASTOSDEINVESTIGACION).ToString("N0");
                LabelGastosDeInvestigacion0.Text = Convert.ToInt32(GASTOSDEINVESTIGACION).ToString("N0");



                Session["strigastosFijosmultiple"] = GASTOSDEINVESTIGACIONFIJOS;
                LabelGastosFijosInvestigacion.Text = Convert.ToInt32(GASTOSDEINVESTIGACIONFIJOS).ToString("N0");
                LabelGastosFijosDeInvestigacion1.Text = Convert.ToInt32(GASTOSDEINVESTIGACIONFIJOS).ToString("N0");




                LabelSubTotal.Text = Convert.ToInt32(SERVICIODEINVESTIGACION).ToString("N0");
                LabelTotalAPagar.Text = Convert.ToInt32(SERVICIODEINVESTIGACION).ToString("N0");

                LabelValorEnLetras.Text = ContaCasoObject.enletras(SERVICIODEINVESTIGACION) + " PESOS MCTE";




               LabelSubTotal0.Text = Convert.ToInt32(GASTOSDEINVESTIGACION).ToString("N0");
                LabelTotalAPagar0.Text = Convert.ToInt32(GASTOSDEINVESTIGACION).ToString("N0");
                LabelValorEnLetras0.Text = ContaCasoObject.enletras(GASTOSDEINVESTIGACION) + " PESOS MCTE";





                LabelSubTotal1.Text = Convert.ToInt32(GASTOSDEINVESTIGACIONFIJOS).ToString("N0");
                LabelTotalAPagar1.Text = Convert.ToInt32(GASTOSDEINVESTIGACIONFIJOS).ToString("N0");
                LabelValorEnLetras1.Text = ContaCasoObject.enletras(GASTOSDEINVESTIGACIONFIJOS) + " PESOS MCTE";




            }




            if (CASOFINALIZADO == "1")

            {


                Div_ListaConceptos.Visible = false;

                Div1.Visible = false;

                //Div2.Visible = false;




                GridViewFacturasDeFacturasServicio.Columns[0].Visible = false;

                GridViewGastosFacturaDeFactura.Columns[0].Visible = false;






            }










        }




    }





    protected void Button2_Click(object sender, EventArgs e)
    {



        ContaCasoObject.FinalizarFacturaMultiple(NumeroDeFactura, TextBoxNumeroFacturaFisicaServicio.Text , TextBoxNumeroFacturaFisicaGastos.Text,TextBoxNumeroFacturaFisicaGastosFijos.Text, Convert.ToString(Session["striservcioinvestigacionmultiple"]), Convert.ToString(Session["strigastosvariablesmultiple"]),  "0", "0", "0", Convert.ToString(Session["strigastosFijosmultiple"]));



        
                
               


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionCasoMultipleColfodos.aspx");



    }

    protected void GridViewFacturas_SelectedIndexChanged(object sender, EventArgs e)
    {

        
        GridViewRow row = GridViewFacturas.SelectedRow;

        ContaCasoObject.AgregarPrefacturaAfactura(row.Cells[1].Text, NumeroDeFactura);

        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacioMultiple.aspx" + NumeroDeFactura);




    }

    protected void GridViewFacturasDeFacturas_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewFacturasDeFacturasServicio.SelectedRow;

        ContaCasoObject.QuitarGastoAfacturaMultiple(row.Cells[1].Text);


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacioMultiple.aspx" + NumeroDeFactura);



    }

    protected void GridViewGastosFacturaDeFactura_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewGastosFacturaDeFactura.SelectedRow;

        ContaCasoObject.QuitarGastoAfacturaMultiple(row.Cells[1].Text);


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacioMultiple.aspx" + NumeroDeFactura);
    }

    protected void GridViewGastosFijos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewGastosFijos.SelectedRow;

        ContaCasoObject.QuitarGastoAfacturaMultiple(row.Cells[1].Text);


        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacioMultiple.aspx" + NumeroDeFactura);


    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        ContaCasoObject.ActualizarfechaFactura(NumeroDeFactura, Calendar1.SelectedDate);

        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacioMultiple.aspx" + NumeroDeFactura);

    }
}