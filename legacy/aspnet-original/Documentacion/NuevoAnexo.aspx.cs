using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Documentacion_NuevoAnexo : System.Web.UI.Page
{

    private ClaseAnexos anexosok = new ClaseAnexos();

    string actuID;

    protected void Page_Load(object sender, EventArgs e)
    {
        actuID = (string)Page.RouteData.Values["actuID"];

        if (actuID == "actualizar")
        {

            tb_nombre.Text = "Se Actualizara El Archivo";
        
        
        }
      

    }


   
    protected void btnUpload3_Click(object sender, EventArgs e)
    {

        if (actuID == "nuevo")
        {


            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + i + extencion));


                    anexosok.Ruta = i + extencion;

                }
            }





            anexosok.Id_informe = Convert.ToString(Session["NumeroDeInforme"]);


            anexosok.Tipodedocumento = tb_nombre.Text;

            anexosok.Id_estadodocus = "1";


            anexosok.nuevo(ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~\\Documentacion\\AnexosPage.aspx");






        }

        if (actuID == "actualizar")
        {



            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + i + extencion));


                    anexosok.Ruta = i + extencion;

                }
            }


            anexosok.actualizarruta(Convert.ToString(Session["codigoanexoo"]), ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~\\Documentacion\\AnexosPage.aspx");



        }
        
        
        
        
        
        
     
    }
}