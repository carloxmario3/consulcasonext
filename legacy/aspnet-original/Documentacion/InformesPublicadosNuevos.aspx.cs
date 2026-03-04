using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Documentacion_InformesPublicadosNuevos : System.Web.UI.Page
{

    private ClasePublicados publicadosok = new ClasePublicados();

    string nuevopubID;

    protected void Page_Load(object sender, EventArgs e)
    {

        nuevopubID = (string)Page.RouteData.Values["nuevopubID"];

        if (nuevopubID == "actualizar")
        {

            tb_nombre.Text = "Se Actualizara El Archivo";


        }



    }

    protected void btnUpload3_Click(object sender, EventArgs e)
    {


        if (nuevopubID == "nuevo")
        {


            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado\\" + i + extencion));


                    publicadosok.Ruta = i + extencion;

                }
            }





            publicadosok.Tipodedocumento = tb_nombre.Text;



            publicadosok.Id_numero_de_Caso = Convert.ToString(Session["NumeroDeCaso"]);

            publicadosok.nuevo(ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~\\Documentacion\\InformesPublicadosPage.aspx");






        }

        if (nuevopubID == "actualizar")
        {



            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado\\" + i + extencion));


                    publicadosok.Ruta = i + extencion;

                }
            }




            publicadosok.actualizarruta(Convert.ToString(Session["codigopublicado"]), ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~\\Documentacion\\InformesPublicadosPage.aspx");



        }

     


    }
}