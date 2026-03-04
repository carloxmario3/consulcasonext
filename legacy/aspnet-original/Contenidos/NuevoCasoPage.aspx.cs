using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Web.Configuration;
using System.Net.Mail;

public partial class Contenidos_NuevoCasoPage : System.Web.UI.Page
{

    private ClaseCasos miobjeto = new ClaseCasos();

    private ClaseAfiliado afiliadook = new ClaseAfiliado();

    private ClaseAnalista Analistaok = new ClaseAnalista();



    string casovID;

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();



    protected void Page_Load(object sender, EventArgs e)
    {
        

        miobjeto.Ejecutado_con_exito += casocreadoconexito;  

        

        casovID = (string)Page.RouteData.Values["casoID"];

       
        Label2.Text = "Detalles De Caso";

              

            Label2.Text = "Nuevos Casos";


           

            Session["NumeroDeCaso"] = "";

       


        if (this.IsPostBack == false)
        {
            this.DropDownList1.DataSource = this.SqlDataSource1;
            this.DropDownList1.DataTextField = "Nombre";
            this.DropDownList1.DataValueField = "Id_compania";
            this.DropDownList1.DataBind();


            Session["ComboIdCompania"] = DropDownList1.SelectedValue;

            this.DropDownList2.DataSource = this.SqlDataSource2;
            this.DropDownList2.DataTextField = "Ciudad";
            this.DropDownList2.DataValueField = "Id_oficina";
            this.DropDownList2.DataBind();

            Session["ComboIdOficina"] = DropDownList2.SelectedValue;

            this.DropDownList3.DataSource = this.SqlDataSource3;
            this.DropDownList3.DataTextField = "Nombres";
            this.DropDownList3.DataValueField = "Id_analista";
            this.DropDownList3.DataBind();



            this.DropDownList4.DataSource = this.SqlDataSource4;
            this.DropDownList4.DataTextField = "Nombre";
            this.DropDownList4.DataValueField = "Id_tipocaso";
            this.DropDownList4.DataBind();

            this.DropDownList4.SelectedValue = Convert.ToString(casovID);


            this.DropDownList5.DataSource = this.SqlDataSource6;
            this.DropDownList5.DataTextField = "Ciudaddep";
            this.DropDownList5.DataValueField = "Id_ciudad";
            this.DropDownList5.DataBind();



        }


      
          
      


       

                

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {


        if (lb_fechadeasignacion.Text == "" || lb_fechadeentrega.Text == "")
        {
            
            LabelError.Text = "SELECIONE FECHA DE ASIGNACION Y FECHA DE ENTREGA";
            LabelError.Visible = true;
        }
        else
        {


                     
            // crear el caso en la base de datos


            string ultimocaso = ContaCasoObject.NUEVOCASO(DropDownList4.SelectedValue, "1", DropDownList3.SelectedValue, "31", lb_fechadeasignacion.Text, lb_fechadeentrega.Text, "", "", DropDownList5.SelectedValue);

                
             

        Session["NumeroDeCaso"] = ultimocaso;

        Session["casonuevo"] = "true";


        ContaCasoObject.InsertarBitacora(Convert.ToString(Session["NumeroDeCaso"]), "NUEVO CASO CREADO",31);






            // int caseSwitch = Convert.ToInt32(DropDownList4.SelectedValue);
            // switch (caseSwitch)
            // {
            //     case 5:
                   

            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Fotos"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Videos"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Legalizacion"));


            //         System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Plantillas\\PlantillaCaso.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\SeguimientosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + ".docx"));


               


            //         break;
                
            //     default:


            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Fotos"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Videos"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado"));
            //         System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Legalizacion"));


            //         System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Plantillas\\PlantillaCaso.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosActivos\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + ".docx"));




            //         break;
            // }



        




            /*
       


            if (DropDownList4.SelectedValue == "1")
            {
                //Padres

                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\PADRES\\PlantillaPadres.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + "Padres.docx"));


            }


            if (DropDownList4.SelectedValue == "2")
            {
                //Compañera

                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\COMPANERA\\PlantillaCompanera.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + "companera.docx"));

            }

            if (DropDownList4.SelectedValue == "3")
            {
                //Conyuge

                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\CONYUGUE\\PlantillaConyugue.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + "Conyugue.docx"));

            }
            if (DropDownList4.SelectedValue == "4")
            {
                //Arp

                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\ARP\\PlantillaArp.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + "Arp.docx"));

            }
            if (DropDownList4.SelectedValue == "5")
            {
                //Seguimiento


                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\SEGUIMIENTOS\\PlantillaSeguimiento.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\Informe" + Convert.ToString(Session["NumeroDeCaso"]) + "Seguimiento.docx"));


                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\SEGUIMIENTOS\\PlantillaEdicionVideo.nvc"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Videos\\Edicion" + Convert.ToString(Session["NumeroDeCaso"]) + "Video.nvc"));


                System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Formatos\\SEGUIMIENTOS\\PlantillaQuemarDisco.lnk"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Videos\\Quemar" + Convert.ToString(Session["NumeroDeCaso"]) + "Disco.lnk"));




            }



       */






            //crea el afiliadoooo

            string varito = "no paso";

        afiliadook.Id_Numero_Caso = Convert.ToString(Session["NumeroDeCaso"]);

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




        //ENVIO DE CORREO ELECTRONICO



        // try
        // {



        //     string COMPANIA;
        //     string NUMERODECASOTRAIDO;
        //     string ASEGURADO;
        //     string CIUDAD;
        //     string TIPODECASO;
        //     string INVESTIGADOR;
        //     string FECHAASIGNACION;
        //     string FECHAENTREGA;
        //     string CIUDADDEPART;
        //     string CEDULA;
        //     string CORREOANALISTA;



        //     ContaCasoObject.DatosDeCasoEnvioCorreo(ultimocaso, out COMPANIA, out NUMERODECASOTRAIDO, out ASEGURADO, out CIUDAD, out TIPODECASO, out INVESTIGADOR, out FECHAASIGNACION, out FECHAENTREGA, out CIUDADDEPART, out CEDULA, out CORREOANALISTA);





        //     SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
        //     var mail = new MailMessage();
        //     mail.From = new MailAddress("consultandoltda@hotmail.com");

        //     mail.To.Add("consultandoltda@hotmail.com");
        //     mail.To.Add("consultando@consultandoweb.com");

        //     mail.To.Add(CORREOANALISTA);


        //     mail.Subject = "CASO NUEVO Creado Con Exito  Asignacion N:" + ultimocaso + " Afiliado: " + tb_nombre.Text + " " + tb_apellido.Text + " Fecha: " + DateTime.Now;

        //     mail.IsBodyHtml = true;
        //     string htmlBody;
        //     htmlBody = "<h3> Caso Asignado Con Exito a Consultando Ltda <br /><br /> Numero De Asignacion: " + ultimocaso + "<br /><br /> Iniciaremos Inmediatamente la Realizacion Del Presente Caso </h3>  <h3> Afiliado: " + tb_nombre.Text + " " + tb_apellido.Text + "</h3>  <h3> Cedula: " + tb_cedula.Text + " </h3> "+ "http://www.consultandoweb.com/ConsulCaso9/NewVisualizadorCasos.aspx" + ultimocaso + " <h3> Muchas Gracias Por Confiar En Nosotros </h3>   <h3> Area Operativa </h3> <h3> Consultando Ltda </h3>";





        //     mail.Body = htmlBody;






        //     SmtpServer.Port = 587;
        //     SmtpServer.UseDefaultCredentials = false;
        //     SmtpServer.Credentials = new System.Net.NetworkCredential("consultandoltda@hotmail.com", "61RPG6rbb14saj1q");
        //     SmtpServer.EnableSsl = true;
        //     SmtpServer.Send(mail);








        // }

        // catch (Exception err)
        // {



        //     Label4.Text = Convert.ToString(err);

        // }




        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + ultimocaso);



        }


    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ComboIdCompania"] = DropDownList1.SelectedValue;

        this.DropDownList2.DataSource = this.SqlDataSource2;
        this.DropDownList2.DataTextField = "Ciudad";
        this.DropDownList2.DataValueField = "Id_oficina";
        this.DropDownList2.DataBind();

        Session["ComboIdOficina"] = DropDownList2.SelectedValue;

        this.DropDownList3.DataSource = this.SqlDataSource3;
        this.DropDownList3.DataTextField = "Nombres";
        this.DropDownList3.DataValueField = "Id_analista";
        this.DropDownList3.DataBind();
        
       
        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ComboIdOficina"] = DropDownList2.SelectedValue;

        this.DropDownList3.DataSource = this.SqlDataSource3;
        this.DropDownList3.DataTextField = "Nombres";
        this.DropDownList3.DataValueField = "Id_analista";
        this.DropDownList3.DataBind();
        
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        
        lb_fechadeasignacion.Text = Convert.ToString(Calendar1.SelectedDate.Day);

        lb_fechadeasignacion.Text = lb_fechadeasignacion.Text + "/" + Convert.ToString(Calendar1.SelectedDate.Month);

        lb_fechadeasignacion.Text = lb_fechadeasignacion.Text + "/" + Convert.ToString(Calendar1.SelectedDate.Year);

             

    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        lb_fechadeentrega.Text = Convert.ToString(Calendar2.SelectedDate.Day);

        lb_fechadeentrega.Text = lb_fechadeentrega.Text + "/" + Convert.ToString(Calendar2.SelectedDate.Month);

        lb_fechadeentrega.Text = lb_fechadeentrega.Text + "/" + Convert.ToString(Calendar2.SelectedDate.Year);

    }

  

    public void casocreadoconexito()
    {

      


    }


    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}