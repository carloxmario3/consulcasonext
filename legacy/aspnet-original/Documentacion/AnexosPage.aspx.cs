using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documentacion_AnexosPage : System.Web.UI.Page
{
    private ClaseAnexos anexosok = new ClaseAnexos();
   

    protected void Page_Load(object sender, EventArgs e)
    {

        HyperLink1.NavigateUrl = "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos";


        string var1;

        var1 = Convert.ToString(Session["revisordecasossi"]);


        if (var1 == "si")
        {

            Button1.Visible = false;


            HyperLink1.NavigateUrl = "~/RevisorCasosPage.aspx" + Convert.ToString(Session["revisordecasoretorno"]) + "puntoAnclaAnexos";

        }


    }
    protected void btnUpload3_Click(object sender, EventArgs e)
    {
     

    }
   
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

        
     

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {


            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];


            Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[3].Text + row.Cells[4].Text);

            Label2.Text = "~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + row.Cells[4].Text;

            Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + row.Cells[4].Text);
            Response.End();

        }

      
        
    

        if (e.CommandName == "ActualizarAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];


            Session["codigoanexoo"] = row.Cells[1].Text;

            Page.Response.Redirect("~\\NuevoAnexo\\actualizar");

        }

        


    }




    protected void Button1_Click(object sender, EventArgs e)
    {
       
        Page.Response.Redirect("~\\NuevoAnexo\\nuevo");
    
    
    
    }

}