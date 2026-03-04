using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Multimedia_VideosPageOk : System.Web.UI.Page
{

       


    protected void Page_Load(object sender, EventArgs e)
    {


        HyperLink1.NavigateUrl = "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo";

    }




    protected void btnUpload3_Click(object sender, EventArgs e)
    {



        if (RadUpload1.UploadedFiles.Count > 0)
        {
            foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
            {

                


                file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Videos\\" + RadioButtonList1.SelectedValue));
                
                
            }
        }


        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo");

     
      


    }
}
