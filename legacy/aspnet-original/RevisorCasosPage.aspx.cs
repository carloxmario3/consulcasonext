using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using System.Web.Configuration;

public partial class RevisorCasosPage : System.Web.UI.Page
{
    string tipoID;

    string ancla2ID;

    private ClaseInformes informesok = new ClaseInformes();

    protected void Page_Load(object sender, EventArgs e)
    {

        Session["revisordecasossi"] = "si";


        tipoID = (string)Page.RouteData.Values["tipoID"];

        ancla2ID = (string)Page.RouteData.Values["ancla2ID"];


        Session["anclona2"] = ancla2ID;

        string var1 = Convert.ToString(Session["tipodecasorevisor"]);


        if (var1 == "Padres")
        {
            
            pn_Fotos.Visible = true;

        }

        if (var1 == "Compa&#241;era")
        {
            pn_Fotos.Visible = true;

        }

        if (var1 == "Conyuge")
        {
            pn_Fotos.Visible = true;

        }

        if (var1 == "Arp")
        {

            pn_Fotos.Visible = true;
        }

        if (var1 == "Seguimiento")
        {
            pn_Video.Visible = true;

        }




            if (tipoID == "Revisar")

            {

                Session["revisordecasoretorno"] = "Revisar";

                HyperLink1.NavigateUrl = "~/ListaDeInformes/Revisar";

                              
                
                //ButtonRevisar.Visible = true;
              
                ButtonCorregir.Visible = true;

                ButtonConvertir.Visible = true;

                //ButtonPublicado.Visible = true;




                Button10.Visible = true;

                Button11.Visible = true;

                fotosaa.Visible = true;

                Button1.Visible = true;

            }


            if (tipoID == "Convertir")
            {

                Session["revisordecasoretorno"] = "Convertir";

                HyperLink1.NavigateUrl = "~/ListaDeInformes/Convertir";

                ButtonRevisar.Visible = true;

               // ButtonCorregir.Visible = true;

                //ButtonConvertir.Visible = true;

                ButtonPublicado.Visible = true;



                pn_infop.Visible = true;



              

            }


            if (tipoID == "Publicados")
             
            {

                Session["revisordecasoretorno"] = "Publicados";

                HyperLink1.NavigateUrl = "~/ListaDeInformes/Publicados";

                ButtonRevisar.Visible = true;

              // ButtonCorregir.Visible = true;

              //ButtonConvertir.Visible = true;

              //  ButtonPublicado.Visible = true;


            }


            if (tipoID == "Corregir")
            {

                Session["revisordecasoretorno"] = "Corregir";

                HyperLink1.NavigateUrl =  "~/ListaDeInformes/Corregir" ;
                
                ButtonRevisar.Visible = true;

                // ButtonCorregir.Visible = true;

                //ButtonConvertir.Visible = true;

                //ButtonPublicado.Visible = true;




                Button10.Visible = true;

                Button11.Visible = true;

                fotosaa.Visible = true;

                Button1.Visible = true;


            }


          





           /* if (Roles.IsUserInRole("Investigador"))
            {

               
            }

            if (Roles.IsUserInRole("Analista"))
            {


            }

            if (Roles.IsUserInRole("JefeAnalista"))
            {


            }

            if (Roles.IsUserInRole("AreaOperativa"))
            {

            
            }

            */



       


      


      



               






        if (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Fotos\\" + Convert.ToString(Session["Verfoto"]))))
        {

           

            Image1.ImageUrl = "~/Condata/" + Convert.ToString(Session["NumeroDeCaso"]) + "/Fotos/" + Convert.ToString(Session["Verfoto"]);

            switch (AjustaImagen("~/Condata/" + Convert.ToString(Session["NumeroDeCaso"]) + "/Fotos/" + Convert.ToString(Session["Verfoto"])))
            {

                case "HEIGHT":
                    Image1.Attributes.Add("height", "280px");
                    Image1.Attributes.Remove("Width");

                    break;
                case "WIDTH":
                    Image1.Attributes.Add("width", "440px");
                    Image1.Attributes.Remove("height");

                    break;

            }

        }





       

    }


    // Obtiene el tamaño de la imagen y ajusta la vertical o la horizontal de la imagen
    // y devuelve una cadena diciendo si es demasiado alta o demasiado ancha.
    // La funcion toma el nombre de la imagen de la variable global Direccion

    int anchomargen;


    public string AjustaImagen(string direccion)
    {

        string Dimension = null;


        //-- El Alto de la imagen
        int iH = 0;

        //-- El ancho de la imagen
        int iW = 0;

        System.Drawing.Image ti = System.Drawing.Image.FromFile(Server.MapPath(direccion));

        //-- Obtiene la altura y el ancho y le añade un margen
        iH = ti.Height;
        iW = ti.Width;

        //Ajusta ancho
        if (iW > iH)
        {
            Dimension = "WIDTH";
            //Ya que estamos aquí, sacamos el tamaño del margen en una variable exterior
            anchomargen = (480 - iH) / 2;
            //Ajusta alto
        }
        else
        {
            Dimension = "HEIGHT";
        }
        return Dimension;

    }




    protected void Button2_Click(object sender, EventArgs e)
    {
        string mensaje = "nada";

        informesok.Id_estadodocus = "2";

        informesok.actualizarestado(Convert.ToString(Session["NumeroDeInforme"]), ref mensaje);

        Label2.Text = mensaje;


        // se envia mensaje al investigador

        GridViewRow row = GridView3.Rows[0];

        System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();


        mensaje3.To.Add(row.Cells[7].Text);


        mensaje3.Subject = "Por favor Corregir Informe o Complementos  Caso: #" + row.Cells[2].Text + "#-----" + DateTime.Now;

        mensaje3.IsBodyHtml = true;



        mensaje3.Body = "<img src='http://consultandoweb.com/consulcaso/logo.png' alt='ConsulCaso7'> <br />" + "<h2> Por Favor Corregir Informacion Caso: </h2> <h3><i> " + row.Cells[2].Text + "</i></h3> <br /> <h2> Area Operativa Dice: </h2><br /><h3><i>" + TextBox1.Text + "</i> </h3> <br />" + " <br />" + " <h2> Puede ver Todos Los Informes Pendientes Por Corregir Dando Clic En El Siguiente Enlace </h2>" + " <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/ListaDeInformes/Corregir'> Ver Todos Los Informes Pendientes Por Corregir </a> </h1>";


        

        dynamic smpt = new System.Net.Mail.SmtpClient();


        try
        {


            smpt.Send(mensaje3);
        }

        catch (Exception err)
        {
            lb_info_operacion.Text = Convert.ToString(err);

        }




        if (tipoID == "Revisar")
        {

            Page.Response.Redirect("~/ListaDeInformes/Revisar");

        }


        if (tipoID == "Convertir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Convertir");


        }


        if (tipoID == "Publicados")
        {

            Page.Response.Redirect("~/ListaDeInformes/Publicados");


        }


        if (tipoID == "Corregir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Corregir");

            
        }

    }
    protected void Button10_Click(object sender, EventArgs e)
    {

    }
    protected void Button11_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        
        string mensaje = "nada";

        informesok.Id_estadodocus = "3";

        informesok.actualizarestado(Convert.ToString(Session["NumeroDeInforme"]), ref mensaje);

        Label2.Text = mensaje;


        if (tipoID == "Revisar")
        {

            Page.Response.Redirect("~/ListaDeInformes/Revisar");

        }


        if (tipoID == "Convertir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Convertir");


        }


        if (tipoID == "Publicados")
        {

            Page.Response.Redirect("~/ListaDeInformes/Publicados");


        }


        if (tipoID == "Corregir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Corregir");



        }


    }
    protected void Button15_Click(object sender, EventArgs e)
    {

        pn_corregir.Visible = true;
        
      
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        string mensaje = "nada";

        informesok.Id_estadodocus = "1";

        informesok.actualizarestado(Convert.ToString(Session["NumeroDeInforme"]), ref mensaje);

        Label2.Text = mensaje;


        if (tipoID == "Revisar")
        {

            Page.Response.Redirect("~/ListaDeInformes/Revisar");      

        }


        if (tipoID == "Convertir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Convertir"); 
          

        }


        if (tipoID == "Publicados")
        {

            Page.Response.Redirect("~/ListaDeInformes/Publicados"); 
           

        }


        if (tipoID == "Corregir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Corregir"); 
          


        }


    }
    protected void Button18_Click(object sender, EventArgs e)
    {
        string mensaje = "nada";

        informesok.Id_estadodocus = "4";

        informesok.actualizarestado(Convert.ToString(Session["NumeroDeInforme"]), ref mensaje);

        Label2.Text = mensaje;



        // se envia mensaje al analista

        GridViewRow row = GridView3.Rows[0];

        System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();


        mensaje3.To.Add(row.Cells[9].Text);


        mensaje3.Subject = "Nuevo Informe " + row.Cells[4].Text + " Afiliado: " + row.Cells[10].Text + "------" + DateTime.Now;

        mensaje3.IsBodyHtml = true;



        mensaje3.Body = "<img src='http://consultandoweb.com/consulcaso/logo.png' alt='ConsulCaso7'> <br />" + "<h2><h3><i>  Nuevo Informe " + row.Cells[4].Text + " Afiliado: " + row.Cells[10].Text + "</i></h3> <br />" + " <br />" + " <h2> Puede ver Todos Los Informes Publicados Dando Clic En El Siguiente Enlace: </h2>" + " <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + row.Cells[2].Text + "puntoAnclainfop#Anclainfop'> Ver Todos Los Informes Publicados </a> </h1>" + " <br />" + " <h2> Si Su Caso es un Registro Filmico Puede ver Todos Los Videos Publicados Dando Clic En El Siguiente Enlace: </h2>" + " <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + row.Cells[2].Text + "puntoAnclaVideo#AnclaVideo'> Ver Todos Los Videos Publicados </a> </h1>";


        
        
        dynamic smpt = new System.Net.Mail.SmtpClient();

        
        
             try
                     {
        
        smpt.Send(mensaje3);

                     }
             catch (Exception err)
             {
                 lb_info_operacion.Text = Convert.ToString(err);

             }


        if (tipoID == "Revisar")
        {

            Page.Response.Redirect("~/ListaDeInformes/Revisar");

        }


        if (tipoID == "Convertir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Convertir");


        }


        if (tipoID == "Publicados")
        {

            Page.Response.Redirect("~/ListaDeInformes/Publicados");


        }


        if (tipoID == "Corregir")
        {

            Page.Response.Redirect("~/ListaDeInformes/Corregir");



        }
    }


    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];


            Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[4].Text + row.Cells[3].Text);

            Label2.Text = "~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + row.Cells[3].Text;

            Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + row.Cells[3].Text);
            Response.End();

        }






    }

    protected void GridView21_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {


            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];


            Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[3].Text + row.Cells[4].Text);



            Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Anexos\\" + row.Cells[4].Text);
            Response.End();

        }





    }


    protected void GridView17_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView17.Rows[index];

            Session["Verfoto"] = row.Cells[4].Text;

            Page.Response.Redirect("~/RevisorCasosPage.aspx" + Convert.ToString(Session["revisordecasoretorno"]) + "puntoAnclaFotos");

        }

        

    }



    protected void GridView18_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView18.Rows[index];

            Session["vervideo"] = row.Cells[4].Text;

            Page.Response.Redirect("~/RevisorCasosPage.aspx" + Convert.ToString(Session["revisordecasoretorno"]) + "puntoAnclaVideo");


        }






    }




    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {


            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView2.Rows[index];


            Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[3].Text + row.Cells[4].Text);



            Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Publicado\\" + row.Cells[4].Text);

            Response.End();

        }


    }



    protected void Button13_Click(object sender, EventArgs e)
    {
        
    }
    protected void fotosaa_Click(object sender, EventArgs e)
    {

    }
}