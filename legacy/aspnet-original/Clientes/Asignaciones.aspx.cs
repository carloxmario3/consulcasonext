using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Web.Configuration;

public partial class Clientes_Asignaciones : System.Web.UI.Page
{

    private ClaseRecuinve recuinveok = new ClaseRecuinve();
    private ClaseCasos miobjeto = new ClaseCasos();
    private ClaseAfiliado afiliadook = new ClaseAfiliado();
    
    private ClaseAnalista Analistaok = new ClaseAnalista();


    protected void Page_Load(object sender, EventArgs e)
    {


     
     

    }


    


    protected void Button3_Click(object sender, EventArgs e)
    {


        // crea el casoooo


        if (Convert.ToString(Session["casonuevo"]) != "true")
        {

            //consultar id analista


            string mivarreas = "no esta pasando";

            string elcorreo = Convert.ToString(Membership.GetUser());

            Analistaok.traeriddeanalista(elcorreo, ref mivarreas);


            lb_info_operacion.Text = mivarreas;


            // crear

            string infooper = "no esta pasando";

            miobjeto.Id_tipocaso = "";

            miobjeto.Id_estado = "1";

            miobjeto.Id_analista = Analistaok.Id_analista;

            miobjeto.Id_investigador = "31";

            miobjeto.Fecha_asignacion = "";

            miobjeto.Fecha_posibleentrega = "";

            miobjeto.Fecha_entregareal = "";

            miobjeto.Observaciones = "";

            miobjeto.Ciudad = "1131";


            miobjeto.nuevo(ref infooper);

            lb_info_operacion.Text = infooper;



            string ultimocaso = "";

            miobjeto.traerultimocaso(ref ultimocaso);

            Session["NumeroDeCasoasig"] = ultimocaso;

            Session["casonuevo"] = "true";


            System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Anexos"));
            System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Fotos"));
            System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Informes"));
            System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Recuinve"));
            System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Videos"));
            System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Publicado"));


        }

        Label2.Text = Convert.ToString(Session["NumeroDeCasoasig"]);

        Label28.Text = Convert.ToString(Session["NumeroDeCasoasig"]);


        
        
        
        
        
        
        
        
        //consultar id analista


        string mivarreas1 = "no esta pasando";

        string elcorreo1 = Convert.ToString(Membership.GetUser());

        Analistaok.traeriddeanalista(elcorreo1, ref mivarreas1);


        lb_info_operacion.Text = mivarreas1;




        //aaaa

            string infooper1 = "no esta pasando";
       

            miobjeto.Id_tipocaso = DropDownList4.SelectedValue;

            miobjeto.Id_analista = Analistaok.Id_analista;

            miobjeto.Fecha_asignacion = "";

            miobjeto.Fecha_posibleentrega = "";

            miobjeto.Fecha_entregareal = "";

            miobjeto.Observaciones = TextBox1.Text;

            miobjeto.Ciudad = "1131";
        
            miobjeto.actualizarcaso(Convert.ToString(Session["NumeroDeCasoasig"]), ref infooper1);

            lb_info_operacion.Text = infooper1;
        
            
        
        
        //crea el afiliadoooo

            string varito = "no paso";

            afiliadook.Id_Numero_Caso = Convert.ToString(Session["NumeroDeCasoasig"]);

            afiliadook.Id_laborales = "";

            afiliadook.Nombre = tb_nombre.Text;

            afiliadook.Apellido = tb_apellido.Text;

            afiliadook.Cedula = tb_cedula.Text;

            afiliadook.Ciudad = "1131";

            afiliadook.Direccion = "";

            afiliadook.Barrio = "";

            afiliadook.Celular = "";

            afiliadook.Telefono = "";

            afiliadook.nuevo(ref varito);

            lb_info_operacion.Text = varito;
                
            Session["casonuevo"] = "no";







        // envia correo electronico a consultando web


                          

           
            System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();


            mensaje3.To.Add("consultando@consultandoweb.com");


            mensaje3.Subject = "ConsulCaso 7 Nuevo Caso # "+ Label2.Text +" Asignado Por: " + Convert.ToString(Membership.GetUser()) + "#---" + DateTime.Now;

            mensaje3.IsBodyHtml = true;



            mensaje3.Body = "<h3> Nuevo Caso Creado en Consulcaso7 NUMERO " + Label2.Text + "<br /><br /> Asignado Por: " + Convert.ToString(Membership.GetUser()) + " </h3> <br /> <h3> Afiliado: " + tb_nombre.Text + " " + tb_apellido.Text + "</h3> <br /> <h3> Cedula: " + tb_cedula.Text + " </h3> <br /> <h3> Observaciones: " + TextBox1.Text + " </h3>  <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + Label2.Text + "puntonormal#normal'> Ver Nuevo Caso Asignado </a> </h1>";




            dynamic smpt = new System.Net.Mail.SmtpClient();


            try
            {
                 smpt.Send(mensaje3);
            }

            catch (Exception err)
            {
                lb_info_operacion.Text = Convert.ToString(err);

            }



            // Envia correo electronico a analista con confirmacion de nuevo caso


            System.Net.Mail.MailMessage mensaje4 = new System.Net.Mail.MailMessage();


            mensaje4.To.Add(Convert.ToString(Membership.GetUser()));


            mensaje4.Subject = "Caso Asignado Con Exito # " + Label2.Text + " Afiliado: " + tb_nombre.Text + " " + tb_apellido.Text +  "#---" + DateTime.Now;

            mensaje4.IsBodyHtml = true;



            mensaje4.Body = "<h3> Caso Asignado Con Exito a Consultando Ltda <br /><br /> Numero De Asignacion: " + Label2.Text + "<br /><br /> Iniciaremos Inmediatamente la Realizacion Del Presente Caso </h3> <br /> <h3> Afiliado: " + tb_nombre.Text + " " + tb_apellido.Text + "</h3> <br /> <h3> Cedula: " + tb_cedula.Text + " </h3> <br /> <h3> Observaciones: " + TextBox1.Text + " </h3>  <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + Label2.Text + "puntonormal#normal'> Ver Nuevo Caso Asignado </a> </h1>";




            dynamic smpt2 = new System.Net.Mail.SmtpClient();


            try
            {
                smpt2.Send(mensaje4);
            }

            catch (Exception err)
            {
                lb_info_operacion.Text = Convert.ToString(err);

            }



        Page.Response.Redirect("~/ListaDeCasosPage.aspx");
              

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\NuevoRecurso\\nuevo");
    }




    protected void btnUpload3_Click(object sender, EventArgs e)
    {

        


            string varito = "no paso";



            if (RadUpload1.UploadedFiles.Count > 0)
            {
                foreach (Telerik.Web.UI.UploadedFile file1 in RadUpload1.UploadedFiles)
                {

                    string extencion = Convert.ToString(file1.GetExtension());

                    string nombre = Convert.ToString(file1.GetNameWithoutExtension());

                    int i = 0;

                    while (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Recuinve\\" + i + extencion)))
                    {
                        i += 1;

                    }


                    file1.SaveAs(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCasoasig"]) + "\\Recuinve\\" + i + extencion));


                    recuinveok.Ruta = i + extencion;

                    recuinveok.Tipodedocumento = nombre;

                }
            }





            



            recuinveok.Id_numero_de_Caso = Convert.ToString(Session["NumeroDeCasoasig"]);

            recuinveok.nuevo(ref varito);

            lb_info_operacion.Text = varito;

            Page.Response.Redirect("~\\Clientes\\Asignaciones.aspx");
        

      
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
       
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {

    }
}