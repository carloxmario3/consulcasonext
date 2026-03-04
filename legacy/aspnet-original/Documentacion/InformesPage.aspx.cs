using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documentacion_InformesPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        HyperLink1.NavigateUrl = "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes";


       string var1 ;
       
        var1 = Convert.ToString(Session["revisordecasossi"]);

 
        if (var1 == "si") 
        {

            Button1.Visible = false;


            HyperLink1.NavigateUrl = "~/RevisorCasosPage.aspx" + Convert.ToString(Session["revisordecasoretorno"]) + "puntoAnclaInformes";

        }



        

    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\Nuevoinforme\\nuevo");
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];


            Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[4].Text + row.Cells[3].Text);

            Label2.Text = "~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + row.Cells[3].Text;

            Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + row.Cells[3].Text);
            Response.End();

        }





        if (e.CommandName == "ActualizarAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];


            Session["codigoinforme"] = row.Cells[1].Text;


            Page.Response.Redirect("~\\Nuevoinforme\\actualizar");

        }




    }



    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}