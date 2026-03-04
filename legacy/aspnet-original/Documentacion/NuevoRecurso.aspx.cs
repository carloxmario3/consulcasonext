using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Configuration;
using System.Web.Security;

public partial class Documentacion_NuevoRecurso : System.Web.UI.Page
{

    private ClaseRecuinve recuinveok = new ClaseRecuinve();

    string recuirID;

    protected void Page_Load(object sender, EventArgs e)
    {

        recuirID = (string)Page.RouteData.Values["recuirID"];

        if (recuirID == "actualizar")
        {

            tb_nombre.Text = "Se Actualizara El Archivo";


        }


    }
    protected void btnUpload3_Click(object sender, EventArgs e)
    {

        if (recuirID == "nuevo")
        {


            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + i + extencion));


                    recuinveok.Ruta = i + extencion;

                }
            }





            recuinveok.Tipodedocumento = tb_nombre.Text;



           
            if (Roles.IsUserInRole("Analista"))
            {

                recuinveok.SubidoPor = "JefeAnalista";

            }


            if (Roles.IsUserInRole("JefeAnalista"))
            {

                recuinveok.SubidoPor = "JefeAnalista";
            }


            if (Roles.IsUserInRole("Investigador"))
            {

                recuinveok.SubidoPor = "Investigador";
            
            }




            if (Roles.IsUserInRole("AreaOperativa"))
            {
                 recuinveok.SubidoPor = "AreaOperativa";
            }






            recuinveok.Id_numero_de_Caso = Convert.ToString(Session["NumeroDeCaso"]);

            recuinveok.nuevo(ref varito);

            lb_info_operacion.Text = varito;





            // Envia correo electronico a investigador con nuevo recurso



            if (DropDownList1.SelectedValue != "No Asignado")
            
            {
            
            
            

            System.Net.Mail.MailMessage mensaje4 = new System.Net.Mail.MailMessage();


            mensaje4.To.Add(DropDownList1.SelectedValue);


            mensaje4.Subject = "Nuevo Recurso ("+ tb_nombre.Text +") Del Caso # " + Convert.ToString(Session["NumeroDeCaso"]) + " Afiliado: " + DropDownList2.SelectedValue + "#---" + DateTime.Now;

            mensaje4.IsBodyHtml = true;



            mensaje4.Body = "<h3> Nuevo Recurso De Investigador: " + tb_nombre.Text + " Del Caso # " + Convert.ToString(Session["NumeroDeCaso"]) + "<br /><br /> Afiliado: " + DropDownList2.SelectedValue + "</h3>  <br /><br /> " + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "puntoAnclaRinvestigador#AnclaRinvestigador'> Ver Nuevo Recurso </a> </h1>";




            dynamic smpt2 = new System.Net.Mail.SmtpClient();


            try
            {
                smpt2.Send(mensaje4);
            }

            catch (Exception err)
            {
                lb_info_operacion.Text = Convert.ToString(err);

            }




            }









            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes");






        }

        if (recuirID == "actualizar")
        {



            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());


                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + i + extencion));


                    recuinveok.Ruta = i + extencion;

                }
            }




            recuinveok.actualizarruta(Convert.ToString(Session["codigorecuinve"]), ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~\\Documentacion\\RecursosPageok.aspx");



        }

        
    }
}