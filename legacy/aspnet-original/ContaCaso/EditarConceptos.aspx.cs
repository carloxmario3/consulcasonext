using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_Default : System.Web.UI.Page
{




    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    protected void Page_Load(object sender, EventArgs e)
    {



          if (IsPostBack)
        {
        }
        else
        {



            DropDownList_Concepto.DataSource = ContaCasoObject.CargarConceptos();
            DropDownList_Concepto.DataValueField = "N_ID_CONCEPTO";
            DropDownList_Concepto.DataTextField = "T_NOMBRE";
            DropDownList_Concepto.DataBind();
            




            DropDownList_Ciudad.DataSource = ContaCasoObject.CargarCiudades();
            DropDownList_Ciudad.DataValueField = "Id_ciudad";
            DropDownList_Ciudad.DataTextField = "Ciudaddep";
            DropDownList_Ciudad.DataBind();
  

          
          
        }


        



    }
    protected void DropDownList_Concepto_SelectedIndexChanged(object sender, EventArgs e)
    {

        string editable;
        string valor;
        
        ContaCasoObject.obtenervalor(DropDownList_Concepto.SelectedValue,out valor,out editable);


        TextBoxValor.Text = valor;

        if (editable == "1")
        {
            CheckBoxEditable.Checked = true;            
        }
        else         
        {
            CheckBoxEditable.Checked = false;
        }

        




    }
    protected void DropDownList_Ciudad_SelectedIndexChanged(object sender, EventArgs e)
    {




        string editable;
        string valor;

        ContaCasoObject.obtenervalorCiudad(DropDownList_Concepto.SelectedValue,DropDownList_Ciudad.SelectedValue, out valor, out editable);


        TextBox_ValorConcepto.Text = valor;

        if (editable == "1")
        {
            CheckBoxEditable.Checked = true;
        }
        else
        {
            CheckBoxEditable.Checked = false;
        }

        




    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        DivNombreNumevo.Visible = true;
        DivDiligencieElValor.Visible = true;
        ButtonCrearConcepto.Visible = true;
        DivValorEditable.Visible = true;

        TextBoxNombreConcepto.Text = "";
        TextBoxValor.Text = "";
        CheckBoxEditable.Checked = false;


    }
    protected void ButtonCrearConcepto_Click(object sender, EventArgs e)
    {



        ContaCasoObject.InsertarConcepto(TextBoxValor.Text, Convert.ToInt32(CheckBoxEditable.Checked).ToString(), TextBoxNombreConcepto.Text);
        
        DivNombreNumevo.Visible = false;
        DivDiligencieElValor.Visible = false;
        ButtonCrearConcepto.Visible = false;
        DivValorEditable.Visible = false;


    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        DivSeleccioneConcepto.Visible = true;
        DivDiligencieElValor.Visible = true;
        DivValorEditable.Visible = true;
        ButtonGuardarValor.Visible = true;



        DropDownList_Concepto.SelectedValue = "0";
        TextBoxValor.Text = "";        
        CheckBoxEditable.Checked = false;


      


    }
    protected void ButtonGuardarValor_Click(object sender, EventArgs e)
    {

        ContaCasoObject.ActualizarValorConcepto(DropDownList_Concepto.SelectedValue, TextBoxValor.Text, Convert.ToInt32(CheckBoxEditable.Checked).ToString());

        DivSeleccioneConcepto.Visible = false;
        DivDiligencieElValor.Visible = false;
        DivValorEditable.Visible = false;
        ButtonGuardarValor.Visible = false;


    }
    protected void Button4_Click(object sender, EventArgs e)
    {

        DivSeleccioneConcepto.Visible = true;
        
        DivValorEditable.Visible = true;

        Div_ciudadSelecioneCiudad.Visible = true;

        Diligencie_Valor.Visible = true;


        ButtonGuardarValorCiudad.Visible = true;



        DropDownList_Concepto.SelectedValue = "0";
        DropDownList_Ciudad.SelectedValue = "0";

        TextBox_ValorConcepto.Text = "";
        CheckBoxEditable.Checked = false;


    }
    protected void ButtonGuardarValorCiudad_Click(object sender, EventArgs e)
    {


        ContaCasoObject.ActualizarValorConceptoCiudad(DropDownList_Concepto.SelectedValue, DropDownList_Ciudad.SelectedValue, TextBox_ValorConcepto.Text, Convert.ToInt32(CheckBoxEditable.Checked).ToString());



        /*
        DivSeleccioneConcepto.Visible = false;

        DivValorEditable.Visible = false;

        Div_ciudadSelecioneCiudad.Visible = false;

        Diligencie_Valor.Visible = false;


        ButtonGuardarValorCiudad.Visible = false;

        */



    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}