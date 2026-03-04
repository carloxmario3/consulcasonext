using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;

public partial class SubirCapacitacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        
    }
    protected void btnUpload3_Click(object sender, EventArgs e)
    {


        if (RadUpload1.UploadedFiles.Count > 0)
        {
            foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
            {
                                                                
                                                                              

                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Capacitacion\\"+ Convert.ToString(Session["usuariocapacita"]))  +"\\" + Convert.ToString(file1.GetName()));
                                                                                                             
                

            }
        }


        Page.Response.Redirect("~/CapacitacionesPage.aspx");

     


    }
}