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


       


        if (IsPostBack)
        {
        }
            
        else
        {



            DropDownList_Compania.DataSource = ContaCasoObject.CargarCompanias();
            DropDownList_Compania.DataValueField = "Id_compania";
            DropDownList_Compania.DataTextField = "Nombre";
            DropDownList_Compania.DataBind();








        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

    }
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {

                              
     



                


    }
    protected void GridViewGastos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewGastos.SelectedRow;

        //Server.Transfer("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");

        Page.Response.Redirect("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");


    }
    protected void Button1_Click1(object sender, EventArgs e)
    {


        

                

    }



    private bool startConversion = false;


    protected override void Render(HtmlTextWriter writer)
    {
        if (startConversion)
        {
            // get html of the page
            TextWriter myWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(myWriter);
            base.Render(htmlWriter);

            // instantiate a html to pdf converter object
            HtmlToPdf converter = new HtmlToPdf();

            // create a new pdf document converting the html string of the page
            PdfDocument doc = converter.ConvertHtmlString(
                myWriter.ToString(), Request.Url.AbsoluteUri);

            // save pdf document
            doc.Save(Response, false, "Sample.pdf");

            // close pdf document
            doc.Close();
        }
        else
        {
            // render web page in browser
            base.Render(writer);
        }
    }







    protected void Button1_Click2(object sender, EventArgs e)
    {


        startConversion = true;



        /*

        // instantiate a html to pdf converter object
        HtmlToPdf converter = new HtmlToPdf();


        // set authentication cookie
        converter.Options.HttpCookies.Add(
            System.Web.Security.FormsAuthentication.FormsCookieName,
             Request.Cookies[FormsAuthentication.FormsCookieName].Value);



        // create a new pdf document converting an url
        PdfDocument doc = converter.ConvertUrl("http://localhost:6107/ContaCaso/imprimir/ReporteLegalizacionesMes.aspx");

        // save pdf document
        doc.Save(Response, false, "Sample.pdf");

        // close pdf document
        doc.Close();

        */


    }

    protected void DropDownList_Compania_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        GridViewGastos.EmptyDataText = "No Records Found";
        GridViewGastos.DataSource = ContaCasoObject.REPORTE_CASOS_COMPANIA(DropDownList_Compania.SelectedValue);
        GridViewGastos.DataBind();

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
}