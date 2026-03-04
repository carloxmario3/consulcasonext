using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Multimedia_VideosPage : System.Web.UI.Page
{

   


    protected void Page_Load(object sender, EventArgs e)
    {

        string var1;
       
        var1 = Convert.ToString(Session["revisordecasossi"]);


        if (var1 == "si")
        {

            Button3.Visible = false;

                      

        }   


    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\NuevoVideo\\nuevo");
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];

            Session["vervideo"] = row.Cells[4].Text;

            Page.Response.Redirect("~\\Multimedia\\VideosPage.aspx");


        }





        if (e.CommandName == "ActualizarAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];


            Session["codigovideo"] = row.Cells[1].Text;

            Page.Response.Redirect("~\\NuevoVideo\\actualizar");

        }




    }


    protected void Button3_Click(object sender, EventArgs e)
    {


        if (Convert.ToString(Session["revisordecasossi"]) == "si")
        {

            Page.Response.Redirect("~/RevisorCasosPage.aspx" + Convert.ToString(Session["revisordecasoretorno"]) + "puntoAnclaFotos");

        }   


        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo");

    }
}