using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ContaCaso_GastosInvestigacion : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    

    protected void Page_Load(object sender, EventArgs e)
    {


     


        if (IsPostBack)
        {

        }            
        else
        {

            
                GridViewCasosSuspendidos.EmptyDataText = "No Records Found";
                GridViewCasosSuspendidos.DataSource = ContaCasoObject.CargaCasosPendienteLaboral();
                GridViewCasosSuspendidos.DataBind();
                
            

        }

    }


    
    protected void GridViewCasosSuspendidos_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCasosSuspendidos.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[1].Text);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\ListaDeCasos.aspx");
    }
}