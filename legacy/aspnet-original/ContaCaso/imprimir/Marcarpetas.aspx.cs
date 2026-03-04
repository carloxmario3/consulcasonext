using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelectPdf;
using System.Web.Security;
using System.IO;

public partial class ContaCaso_GastosInvestigacion : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    string NumeroDeCaso;
   
    
    protected void Page_Load(object sender, EventArgs e)
    {


        NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoMarcarpeta"];

        
                
        string COMPANIA ;
        string NUMERODECASOTRAIDO ;
        string ASEGURADO;
        string CIUDAD ;
        string TIPODECASO ;
        string INVESTIGADOR ;
        string FECHAASIGNACION ;
        string FECHAENTREGA;
        string CIUDADDEPART;
        string CEDULA;



        ContaCasoObject.DatosDeCasoMarcarpeta(NumeroDeCaso, out COMPANIA, out NUMERODECASOTRAIDO, out ASEGURADO, out CIUDAD, out TIPODECASO, out INVESTIGADOR, out FECHAASIGNACION, out FECHAENTREGA, out CIUDADDEPART, out CEDULA);



        LabelCompania.Text = COMPANIA;
        LabelNumeroDeCaso.Text = NUMERODECASOTRAIDO;
        LabelNombreDelAfiliado.Text = ASEGURADO;
        LabelCiudad.Text = CIUDAD;
        LabelTipoDeCaso.Text = TIPODECASO;
        LabeliNVESTIGADOR0.Text = INVESTIGADOR;
        Labelfechadeasignacion.Text = FECHAASIGNACION;
        Labelfechadeentrega.Text = FECHAENTREGA;
        LabelCedula.Text = CEDULA;
        LabelCiudad.Text = CIUDADDEPART;



    }




    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);
    }
}