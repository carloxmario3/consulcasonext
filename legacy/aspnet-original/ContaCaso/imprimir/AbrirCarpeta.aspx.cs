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


        NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoAbrirCarpeta"];



       // Response.AddHeader("REFRESH", "1;URL=/ConsulCaso9/NewVisualizadorCasos.aspx" + NumeroDeCaso);

        //    Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);

    }


    



    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);
    }
}