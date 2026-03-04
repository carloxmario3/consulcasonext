using System;
using System.Collections.Generic;
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


        NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoGastos"];

        //NumeroDeCaso = "5496";

        LabelTotalGastos.Text =  ContaCasoObject.TotalGastosCaso(NumeroDeCaso);


        if (IsPostBack)
        {
        }
            
        else
        {

            
            GridViewGastos.EmptyDataText = "No Records Found";
            GridViewGastos.DataSource = ContaCasoObject.CargarGastosNumeroDeCaso(NumeroDeCaso);
            GridViewGastos.DataBind();


            DropDownList_Concepto.DataSource = ContaCasoObject.CargarConceptos();
            DropDownList_Concepto.DataValueField = "N_ID_CONCEPTO";
            DropDownList_Concepto.DataTextField = "T_NOMBRE";
            DropDownList_Concepto.DataBind();


        
        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ContaCasoObject.InsertarGastoCaso
           (DropDownList_Concepto.SelectedValue, TextBoxValor.Text,NumeroDeCaso);


        Page.Response.Redirect("~/ContaCaso/GastosInvestigacion.aspx"+NumeroDeCaso);


    }
}