using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();


    protected void Page_Load(object sender, EventArgs e)
     {


     
               
        



        }

    protected void GridViewCasosSuspendidos_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewCasosSuspendidos.SelectedRow;

        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[1].Text);


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridViewCasosSuspendidos.EmptyDataText = "No Records Found";
        GridViewCasosSuspendidos.DataSource = ContaCasoObject.BuscarCasos(TextBox1.Text);
        GridViewCasosSuspendidos.DataBind();

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}