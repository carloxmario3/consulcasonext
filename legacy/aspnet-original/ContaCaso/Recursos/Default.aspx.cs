using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ContaCaso_Menu_Default : System.Web.UI.Page
{



    //Consul9WebService.ContaCasoServiceSoapClient ContaCasoObject = new Consul9WebService.ContaCasoServiceSoapClient();
    ClaseContaCaso  ContaCasoObject = new ClaseContaCaso();


    
    
    protected void Page_Load(object sender, EventArgs e)
    {



        if (IsPostBack)
        {
        }
        else
        {

                       
          //  LabelNumeroLegalizacion.Text = ContaCasoObject.NuevaLegalizacion();
                
                        
            DropDownList_Investigador.DataSource = ContaCasoObject.CargarInvestigadores();
            DropDownList_Investigador.DataValueField = "Id_Investigador";
            DropDownList_Investigador.DataTextField = "Investigador";
            DropDownList_Investigador.DataBind();

            
        }     

    }

  
   
     
 


    protected void DropDownList_Investigador_SelectedIndexChanged(object sender, EventArgs e)
    {


        Label_ValorPorLegalizar.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(DropDownList_Investigador.SelectedValue));

        
        DropDownList_Caso.DataSource = ContaCasoObject.CargarCasos(DropDownList_Investigador.SelectedValue);
        DropDownList_Caso.DataValueField = "Id_Numero_Caso";
        DropDownList_Caso.DataTextField = "Id_Numero_Caso";
        DropDownList_Caso.DataBind();

        
        
        DropDownList_Investigador.Enabled = false;        
        DivPendienteLegalizar.Visible = true;
        DivCaso.Visible = true;



    }


    protected void DropDownList_Caso_SelectedIndexChanged(object sender, EventArgs e)
    {
                
        DropDownList_Concepto.DataSource = ContaCasoObject.CargarConceptos();
        DropDownList_Concepto.DataValueField = "N_ID_CONCEPTO";
        DropDownList_Concepto.DataTextField = "T_NOMBRE";
        DropDownList_Concepto.DataBind();
                
        DropDownList_Caso.Enabled = false;


        DivConcepto.Visible = true;


    }






    protected void DropDownList_Concepto_SelectedIndexChanged(object sender, EventArgs e)
    {
                
        DropDownList_Ciudad.DataSource = ContaCasoObject.CargarCiudades(); 
        DropDownList_Ciudad.DataValueField = "Id_ciudad";
        DropDownList_Ciudad.DataTextField = "Ciudaddep";
        DropDownList_Ciudad.DataBind();

        Div_ciudad.Visible = true;
        

    }
    protected void DropDownList_Ciudad_SelectedIndexChanged(object sender, EventArgs e)
    {


        string ValorFijo;
        string VALOR;
        
        ContaCasoObject.CargarValorConcepto(DropDownList_Concepto.SelectedValue, DropDownList_Ciudad.SelectedValue,out VALOR,out ValorFijo);



        if (ValorFijo == "True")
        {

            TextBox_ValorConcepto.Visible = false;
            Label_ValorConcepto.Visible = true;

            Label_ValorConcepto.Text = VALOR;

            Session["ValorLegalizaciones"] = Label_ValorConcepto.Text;

        }
        else
        {

            TextBox_ValorConcepto.Visible = true;
            Label_ValorConcepto.Visible = false;
            TextBox_ValorConcepto.Text = VALOR;

            Session["ValorLegalizaciones"] = TextBox_ValorConcepto.Text;

        }


        Diligencie_Valor.Visible = true;
        Div_Fecha.Visible = true;
        
        


    }
    protected void Button_AgregarConcepto2_Click(object sender, EventArgs e)
    {



        ContaCasoObject.InsertarGasto
            (
            DropDownList_Concepto.SelectedValue, 
            DropDownList_Investigador.SelectedValue, 
            Convert.ToString(Session["ValorLegalizaciones"]), 
            DropDownList_Caso.SelectedValue, 
            CalendarFechaGasto.SelectedDate, 
            LabelNumeroLegalizacion.Text
            );

                        
        GridView_Gastos.EmptyDataText = "No Records Found";
        GridView_Gastos.DataSource = ContaCasoObject.CargarGastos(LabelNumeroLegalizacion.Text);
        GridView_Gastos.DataBind();

        
        Label_TotalLegalizacion.Text = ContaCasoObject.SumatoriaGastos(LabelNumeroLegalizacion.Text);
        
        
        
        int ValorLegalizacion = Convert.ToInt32(Label_ValorPorLegalizar.Text);
        int ValorPorLegalizar = Convert.ToInt32(Label_TotalLegalizacion.Text);



        Label_PendienteLegalizarLuego.Text = Convert.ToString(ValorLegalizacion - ValorPorLegalizar);



        DropDownList_Concepto.SelectedValue = "0";
        DropDownList_Ciudad.SelectedValue ="0";
        CalendarFechaGasto.SelectedDates.Clear();


        Div_ciudad.Visible = false;
        Diligencie_Valor.Visible = false;
        Div_Fecha.Visible = false;
        Div_AgregarConcepto.Visible = false;


        Div_ListaConceptos.Visible = true;
        Div_TotalLegalizacion.Visible = true;
        Div_PendientePorLegalizar.Visible = true;
        Div_TerminarLegalizacion.Visible = true;


        

              
        





    }
    protected void Button_TerminarLegalizacion_Click(object sender, EventArgs e)
    {
                
        ContaCasoObject.ActualizarLegalizacion(LabelNumeroLegalizacion.Text, ContaCasoObject.InsertarTransaccion(ContaCasoObject.LoadCuentaInvestigador(DropDownList_Investigador.SelectedValue), Label_TotalLegalizacion.Text));


        Page.Response.Redirect("~/ContaCaso/Legalizaciones/Legalizacion.aspx");


    }
    protected void CalendarFechaGasto_SelectionChanged(object sender, EventArgs e)
    {
        Div_AgregarConcepto.Visible = true;
    }





}