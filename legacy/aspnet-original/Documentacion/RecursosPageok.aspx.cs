using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Documentacion_RecursosPageok : System.Web.UI.Page
{

    private ClaseRecuinve Recuinveok = new ClaseRecuinve();


    protected void Page_Load(object sender, EventArgs e)
    {


        HyperLink1.NavigateUrl = "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador";

      

    }


      

    protected void  btnUpload3_Click(object sender, EventArgs e)
    {


     



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\NuevoRecurso\\nuevo");
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {


            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView2.Rows[index];


            Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[2].Text + row.Cells[4].Text);

            Label2.Text = "~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + row.Cells[4].Text;

            Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + row.Cells[4].Text);
            Response.End();

        }





        if (e.CommandName == "ActualizarAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView2.Rows[index];


            Session["codigorecuinve"] = row.Cells[1].Text;
                        

            Page.Response.Redirect("~\\NuevoRecurso\\actualizar");

        }




    }


}
