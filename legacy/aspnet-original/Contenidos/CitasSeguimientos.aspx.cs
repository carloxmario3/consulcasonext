using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contenidos_CitasSeguimientos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        Session["fechacitas"] = "%";

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        Session["fechacitas"] = DropDownList1.SelectedValue + Convert.ToString(DateTime.Now.Year);


        Label3.Text = DropDownList1.SelectedValue + Convert.ToString(DateTime.Now.Year);

    }
}