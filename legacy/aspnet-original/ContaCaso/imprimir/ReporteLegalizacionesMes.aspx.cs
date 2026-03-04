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
            
            
          


          

        
        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

    }
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {


        string RESULTADO;
        int investigador = Convert.ToInt32(DropDownListInvestigador.SelectedValue);

                
        RESULTADO = ContaCasoObject.ConsolidarCuentas(investigador);
                
        GridViewGastos.EmptyDataText = "No Records Found";
        GridViewGastos.DataSource = ContaCasoObject.REPORTE_CONSIGNACIONES_VS_LEGALIZACIONES();
        GridViewGastos.DataBind();




        LabeLPendientePorLegalizar.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue));


        


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

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
}