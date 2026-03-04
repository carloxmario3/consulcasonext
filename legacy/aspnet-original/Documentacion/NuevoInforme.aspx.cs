using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Documentacion_NuevoInforme : System.Web.UI.Page
{

    string inforsID;

    private ClaseInformes informesok = new ClaseInformes();
    
    protected void Page_Load(object sender, EventArgs e)
    {

        HyperLink1.NavigateUrl = "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes";


        

        inforsID = (string)Page.RouteData.Values["inforsID"];

        if (inforsID == "actualizar")
        {

            lb_info_operacion.Text = "Se Actualizara El Archivo";

            RadioButtonList1.Visible = false;
            

        }

    }

    protected void btnUpload3_Click(object sender, EventArgs e)
    {



        if (inforsID == "nuevo")
        {


            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + i + extencion));


                    informesok.Ruta_word = i + extencion;

                }
            }



            informesok.Id_tipoinforme = RadioButtonList1.SelectedValue;

            informesok.Id_numero_de_Caso = Convert.ToString(Session["NumeroDeCaso"]);

            informesok.Ruta_Pdf = "";

            informesok.Id_estadodocus = "1";

            informesok.nuevo(ref varito);
                                           
          

            lb_info_operacion.Text = varito;


            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes");






        }

        if (inforsID == "actualizar")
        {



            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + i + extencion));


                    informesok.Ruta_word = i + extencion;

                }
            }




            informesok.actualizarruta(Convert.ToString(Session["codigoinforme"]), ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes");



        }

     








        
      /*  string varito = "no paso";

        if (RadUpload1.UploadedFiles.Count > 0)
        {
            foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
            {

                informesok.Ruta_word = file1.FileName;

            }
        }

                              

        informesok.Id_tipoinforme = DropDownList1.SelectedValue;

        informesok.Id_numero_de_Caso = Convert.ToString(Session["NumeroDeCaso"]);

        informesok.Ruta_Pdf = "";

        informesok.Id_estadodocus = "1";

        informesok.nuevo(ref varito);

        lb_info_operacion.Text = varito;
       
       */
         
    }
}