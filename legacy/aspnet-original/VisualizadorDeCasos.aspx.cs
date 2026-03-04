using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class VisualizadorDeCasos : System.Web.UI.Page
{
    private ClaseCasos casosook = new ClaseCasos();
    private ClaseInformes informesok = new ClaseInformes();


    string casovisualID;
    string anclaID;

    protected void Page_Load(object sender, EventArgs e)
    {

        Session["revisordecasossi"] = "";

        Session["vermenu"] = "no";

        casovisualID = (string)Page.RouteData.Values["casovisualID"];

        anclaID = (string)Page.RouteData.Values["anclaID"];


        Session["anclona"] = anclaID;


        Session["NumeroDeCaso"] = casovisualID;

        Session["Verfoto"] = "0.jpg";

        
        lb_ncaso.Text = Convert.ToString(Session["NumeroDeCaso"]);


        string numerocass = Convert.ToString(Session["NumeroDeCaso"]);
        
        string varito = "nopaso";



        casosook.traertipodecaso(numerocass, ref varito);

        lb_tipocaso.Text = casosook.Id_tipocaso;


         Session["tipodecaso"] =  casosook.Id_tipocaso;

         string var1 = Convert.ToString(Session["tipodecaso"]);

         
        
      

         if (Roles.IsUserInRole("Analista"))
         {

             GridView11.Columns[8].Visible = false;

             GridView11.Columns[9].Visible = false;

             GridView11.Columns[10].Visible = false;

             GridView11.Columns[11].Visible = false;

             GridView11.Columns[12].Visible = false;

             GridView11.Columns[13].Visible = false;

             GridView10.Columns[0].Visible = false;

             GridView13.Columns[0].Visible = false;

             GridView3.Columns[6].Visible = false;

             GridView3.Columns[7].Visible = false;

             GridView3.Columns[8].Visible = false;

             GridView3.Columns[9].Visible = false;
             
             lb_usuario.Text = "Analista";

             Session["estadoderesumen45"] = "Publicado";
             Session["estadoderesumeninformes"] = "Publicado";

             if (var1 == "Padres")
             {

                 VisualizacionEstandarAnalistas();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Compañera")
             {
                 
                  VisualizacionEstandarAnalistas();
                  cargadordefoto();
                  cargadordelaboralesafiliado();
                  cargadordelaboralesreclamante();
             }

             if (var1 == "Conyuge")
             {
                 
                  VisualizacionEstandarAnalistas();
                  cargadordefoto();
                  cargadordelaboralesafiliado();
                  cargadordelaboralesreclamante();
             }

             if (var1 == "Arp")
             {
                  VisualizacionEstandarAnalistas();
                  cargadordefoto();
                  cargadordelaboralesafiliado();
                  cargadordelaboralesreclamante();

             }


             if (var1 == "Seguimiento")
             {
                 
                 pn_Dcaso.Visible = true;
                 //Button4.Visible = true;

                 //pn_infop.Visible = true;
                 //Button13.Visible = true;


                 pn_Resumenes.Visible = true;
                 //Button9.Visible = true;

                 pn_Seguimiento.Visible = true;
                 //Button3.Visible = true;

                 pn_Informes.Visible = true;
                 //Button10.Visible = true;

                 pn_Rinvestigador0.Visible = true;
                 Button28.Visible = true;

                 //pn_Anexos.Visible = true;
                 //Button11.Visible = true;

                 pn_Video.Visible = true;
                 //Button1.Visible = true;

                 //pn_Rinvestigador.Visible = true;
                 //Button8.Visible = true;

                 pn_Dafiliado.Visible = true;
                 //Button5.Visible = true;
                                  
                 cargadordevideo();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();

             }


         }

         if (Roles.IsUserInRole("JefeAnalista"))
         {

             GridView3.Columns[6].Visible = false;

             GridView3.Columns[7].Visible = false;

             GridView3.Columns[8].Visible = false;

             GridView3.Columns[9].Visible = false;
             
             lb_usuario.Text = "JefeAnalista";

             Session["estadoderesumen45"] = "Publicado";
             Session["estadoderesumeninformes"] = "Publicado";

             if (var1 == "Padres")
             {
                 VisualizacionEstandarJefesAnalistas();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Compañera")
             {

                 VisualizacionEstandarJefesAnalistas();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Conyuge")
             {

                 VisualizacionEstandarJefesAnalistas();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Arp")
             {

                 VisualizacionEstandarJefesAnalistas();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }


             if (var1 == "Seguimiento")
             {

                 pn_Dcaso.Visible = true;
                 //Button4.Visible = true;

                // pn_infop.Visible = true;
                 //Button13.Visible = true;


                 pn_Resumenes.Visible = true;
                 //Button9.Visible = true;

                 pn_Seguimiento.Visible = true;
                 //Button3.Visible = true;

                 pn_Informes.Visible = true;
                 //Button10.Visible = true;


                 //pn_Anexos.Visible = true;
                 //Button11.Visible = true;

                 pn_Video.Visible = true;
                 //Button1.Visible = true;

                 pn_Rinvestigador0.Visible = true;
                 Button28.Visible = true;


                 //pn_Rinvestigador.Visible = true;
                 //Button8.Visible = true;

                 pn_Dafiliado.Visible = true;
                 //Button5.Visible = true;

                 cargadordevideo();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();

             }
         }

        // Area Operativa
        
        if (Roles.IsUserInRole("AreaOperativa"))
         {


             
                         

             GridView3.Columns[8].Visible = false;

             
            
            lb_usuario.Text = "AreaOperativa";

            


             Session["estadoderesumen45"] = "%";
             Session["estadoderesumeninformes"] = "%";

             if (var1 == "Padres")
             {

                 // visualizacion


                 visualizacionestandarareaoperativa();

                 // cargador de foto

                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
               

             }

             if (var1 == "Compañera")
             {

                 visualizacionestandarareaoperativa();

                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();

             }

             if (var1 == "Conyuge")
             {

                 visualizacionestandarareaoperativa();

                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();


             }

             if (var1 == "Arp")
             {

                 visualizacionestandarareaoperativa();

                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();


             }


             if (var1 == "Seguimiento")
             {


                 pn_Dcaso.Visible = true;
                 Button4.Visible = true;

                 //pn_infop.Visible = true;
                 //Button13.Visible = true;


                 pn_Resumenes.Visible = true;
                 Button9.Visible = true;

                 pn_Seguimiento.Visible = true;
                 Button3.Visible = true;
                 
                 pn_Informes.Visible = true;
                 Button10.Visible = true;


                 //pn_Anexos.Visible = true;
                 //Button11.Visible = true;
                 
                 pn_Video.Visible = true;
                 Button1.Visible = true;

                 pn_Rinvestigador.Visible = true;
                 Button8.Visible = true;

                 pn_Dafiliado.Visible = true;
                 Button5.Visible = true;

                 

                 cargadordevideo();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
                 



             }

         }


         if (Roles.IsUserInRole("Investigador"))
         {
             lb_usuario.Text = "Investigador";

             Session["estadoderesumen45"] = "%";
             Session["estadoderesumeninformes"] = "%";



             GridView3.Columns[7].Visible = false;

             GridView3.Columns[8].Visible = false;

             GridView3.Columns[9].Visible = false;


             if (var1 == "Padres")
             {

                 VisualizacionEstandarInvestigadores();

                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Compañera")
             {

                 VisualizacionEstandarInvestigadores();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Conyuge")
             {
                 VisualizacionEstandarInvestigadores();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }

             if (var1 == "Arp")
             {

                 VisualizacionEstandarInvestigadores();
                 cargadordefoto();
                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();
             }


             if (var1 == "Seguimiento")
             {

                 pn_Dcaso.Visible = true;
                 // Button4.Visible = true;

                 //pn_infop.Visible = true;
                 //Button13.Visible = true;


                 pn_Resumenes.Visible = true;
                 Button9.Visible = true;

                 pn_Seguimiento.Visible = true;
                 Button3.Visible = true;

                 pn_Informes.Visible = true;
                 Button10.Visible = true;


                 //pn_Anexos.Visible = true;
                 //Button11.Visible = true;

                 pn_Video.Visible = true;
                 Button1.Visible = true;

                 pn_Rinvestigador.Visible = true;
                 Button8.Visible = true;

                 pn_Dafiliado.Visible = true;
                 Button5.Visible = true;

                 
                 cargadordevideo();

                 cargadordelaboralesafiliado();
                 cargadordelaboralesreclamante();


             }




         }





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



    public void VisualizacionEstandarJefesAnalistas()
    {

        pn_Dcaso.Visible = true;
        //Button4.Visible = true;

        //pn_infop.Visible = true;
        //Button13.Visible = true;

        pn_Resumenes.Visible = true;
        //Button9.Visible = true;

        pn_Informes.Visible = true;
        //Button10.Visible = true;

        //pn_Anexos.Visible = true;
        //Button11.Visible = true;

        pn_Fotos.Visible = true;
        //Button2.Visible = true;

        pn_Rinvestigador0.Visible = true;
        Button28.Visible = true;

        //pn_Rinvestigador.Visible = true;
        //Button28.Visible = true;

        pn_Dafiliado.Visible = true;
        //Button5.Visible = true;

        pn_Dfallecimiento.Visible = true;
        //Button6.Visible = true;

        pn_Reclamantes.Visible = true;
        //Button7.Visible = true;

    }


    public void VisualizacionEstandarAnalistas()
    {

        pn_Dcaso.Visible = true;
        //Button4.Visible = true;

        //pn_infop.Visible = true;
        //Button13.Visible = true;

        pn_Resumenes.Visible = true;
        //Button9.Visible = true;

        pn_Informes.Visible = true;
        //Button10.Visible = true;

        //pn_Anexos.Visible = true;
        //Button11.Visible = true;

        pn_Fotos.Visible = true;
        //Button2.Visible = true;

        pn_Rinvestigador0.Visible = true;
        Button28.Visible = true;

        //pn_Rinvestigador.Visible = true;
        //Button8.Visible = true;

        pn_Dafiliado.Visible = true;
        //Button5.Visible = true;

        pn_Dfallecimiento.Visible = true;
        //Button6.Visible = true;

        pn_Reclamantes.Visible = true;
        //Button7.Visible = true;

    }


    public void VisualizacionEstandarInvestigadores()
    {

        pn_Dcaso.Visible = true;
        //Button4.Visible = true;

        //pn_infop.Visible = true;
        //Button13.Visible = true;
        
        pn_Resumenes.Visible = true;
        Button9.Visible = true;

        pn_Informes.Visible = true;
        Button10.Visible = true;
        
        //pn_Anexos.Visible = true;
        //Button11.Visible = true;

        pn_Fotos.Visible = true;
        Button2.Visible = true;

        pn_Rinvestigador.Visible = true;
        Button8.Visible = true;

        pn_Dafiliado.Visible = true;
        Button5.Visible = true;

        pn_Dfallecimiento.Visible = true;
        //Button6.Visible = true;

        pn_Reclamantes.Visible = true;
        Button7.Visible = true;


    }


    public void visualizacionestandarareaoperativa()
    {

        pn_Dcaso.Visible = true;
        Button4.Visible = true;
        
        //pn_infop.Visible = true;
        //Button13.Visible = true;


        pn_Resumenes.Visible = true;
        Button9.Visible = true;

        pn_Informes.Visible = true;
        Button10.Visible = true;


        //pn_Anexos.Visible = true;
        //Button11.Visible = true;

        pn_Fotos.Visible = true;
        Button2.Visible = true;

        pn_Rinvestigador.Visible = true;
        Button8.Visible = true;
        
        pn_Dafiliado.Visible = true;
        Button5.Visible = true;
                
        pn_Dfallecimiento.Visible = true;
        //Button6.Visible = true;

        pn_Reclamantes.Visible = true;
        Button7.Visible = true;


    }



     


      public void cargadordelaboralesafiliado()
    {

        if (Convert.ToString(Session["identifiafiliado"]) == "")
        {

            try
            {

                GridViewRow row = GridView10.Rows[0]; ;

                Session["identifiafiliado"] = row.Cells[1].Text;

                Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + Convert.ToString(Session["anclona"]));

            }

            catch (Exception err)
            {
                string relleno;

                relleno = Convert.ToString(err);

            }
        }
                          
    }

      public void cargadordelaboralesreclamante()
      {

          if (Convert.ToString(Session["identifireclamantes"]) == "")
          {

              try
              {

                  GridViewRow row = GridView13.Rows[0];;

                  Session["identifireclamantes"] = row.Cells[1].Text;

                  Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + Convert.ToString(Session["anclona"]));

              }

              catch (Exception err)
              {
                  string relleno;

                  relleno = Convert.ToString(err);

              }

          }
      }


      




    public void cargadordevideo()
    {

       


    }


    public void cargadordefoto()
    {


     
        

    
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



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView10.SelectedRow;

        Session["identifiafiliado"] = row.Cells[1].Text;

        Page.Response.Redirect("~/infolaboral/afiliado");
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        
        

    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\NuevoVideo\\nuevo");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void GridView13_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView13.SelectedRow;

        Session["identifireclamantes"] = row.Cells[1].Text;

        Page.Response.Redirect("~/infolaboral/reclamantes");
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        
    }

    



    protected void GridView18_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
       
       

                


    }



   



    protected void GridView19_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName == "VerAnexo")
        {
            
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView19.Rows[index];


            Page.Response.Redirect("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + row.Cells[4].Text);

            //Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[2].Text + row.Cells[4].Text);
                        
            //Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Recuinve\\" + row.Cells[4].Text);
            //Response.End();

        }

                             
        
    }



    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
        
        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];




            Page.Response.Redirect("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + row.Cells[3].Text);


            //Response.AppendHeader("Content-Disposition", "attachment; filename=" + row.Cells[4].Text + row.Cells[3].Text);

            
            //Page.Response.TransmitFile("~\\Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Informes\\" + row.Cells[3].Text);
            //Response.End();

        }


        if (e.CommandName == "ActualizarAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];

                               
            
            string mensaje = "nada";

            informesok.Id_estadodocus = "1";

            informesok.actualizarestado(row.Cells[1].Text, ref mensaje);
                        
                        
            
            Session["codigoinforme"] = row.Cells[1].Text;


            Page.Response.Redirect("~\\Nuevoinforme\\actualizar");

        }


        if (e.CommandName == "Corregir")
        {


            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];


            string mensaje = "nada";

            informesok.Id_estadodocus = "2";

            informesok.actualizarestado(row.Cells[1].Text, ref mensaje);



            // Se Envia mensaje al investigador

            GridViewRow row11 = GridView11.Rows[0];

            System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();


            mensaje3.To.Add(row11.Cells[12].Text);


            mensaje3.Subject = "Por Favor Corregir Informe " + row.Cells[4].Text + " Caso #" + row.Cells[2].Text + " Afiliado: " + row11.Cells[3].Text + " " + row11.Cells[4].Text + "------" + DateTime.Now;

            mensaje3.IsBodyHtml = true;



            mensaje3.Body = "<img src='http://consultandoweb.com/consulcaso/logo.png' alt='ConsulCaso7'> <br />" + "<h2><h3><i>  Por Favor Corregir Informe " + row.Cells[4].Text +" Caso #" + row.Cells[2].Text + " Afiliado: " + row11.Cells[3].Text + " " + row11.Cells[4].Text + "</i></h3> <br />" + " <br />" + " <h2> Puede Ver Los Informes a Corregir Dando Clic En El Siguiente Enlace: </h2>" + " <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + row.Cells[2].Text + "puntonormal'> Ver Todos Los Informes a Corregir </a> </h1>";




            dynamic smpt = new System.Net.Mail.SmtpClient();



            try
            {

                smpt.Send(mensaje3);

            }
            catch (Exception err)
            {
                lb_info3.Text = Convert.ToString(err);

            }



            
            
            
            
            
            
            Page.Response.Redirect("~/ListaDeInformes/Revisar");

        }

        if (e.CommandName == "Revisar")
        {


            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];


            string mensaje = "nada";

            informesok.Id_estadodocus = "1";

            informesok.actualizarestado(row.Cells[1].Text, ref mensaje);

            Page.Response.Redirect("~/ListaDeInformes/Corregir");


        }


        if (e.CommandName == "Publicar")
        {
            
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView3.Rows[index];
                                               

            string mensaje = "nada";

            informesok.Id_estadodocus = "4";

            informesok.actualizarestado(row.Cells[1].Text, ref mensaje);




            // se envia mensaje al analista

            GridViewRow row11 = GridView11.Rows[0];

            System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();


            mensaje3.To.Add(row11.Cells[9].Text);


            mensaje3.Subject = "Nuevo Informe " + row.Cells[4].Text + " Afiliado: " + row11.Cells[3].Text +" "+  row11.Cells[4].Text + "------" + DateTime.Now;

            mensaje3.IsBodyHtml = true;



            mensaje3.Body = "<img src='http://consultandoweb.com/consulcaso/logo.png' alt='ConsulCaso7'> <br />" + "<h2><h3><i>  Nuevo Informe " + row.Cells[4].Text + " Afiliado: " + row11.Cells[3].Text + " " + row11.Cells[4].Text + "</i></h3> <br />" + " <br />" + " <h2> Puede Ver Los Informes o Videos Dando Clic En El Siguiente Enlace: </h2>" + " <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + row.Cells[2].Text + "puntonormal'> Ver Todos Los Informes o Videos Publicados </a> </h1>";




            dynamic smpt = new System.Net.Mail.SmtpClient();



            try
            {

                smpt.Send(mensaje3);

            }
            catch (Exception err)
            {
                lb_info3.Text = Convert.ToString(err);

            }

                        
            Page.Response.Redirect("~/ListaDeInformes/Revisar");
            
        }

    }




  





    protected void Button9_Click(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\Nuevoinforme\\nuevo");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {

    }
    protected void Button6_Click(object sender, EventArgs e)
    {

    }
    protected void Button7_Click(object sender, EventArgs e)
    {

    }
    protected void Button14_Click(object sender, EventArgs e)
    {

        try
            {

                

        
        
        

        string eltexto;

        StreamReader w = new StreamReader(Server.MapPath("~\\Condata\\Docucaso7\\ComunData\\Marcarpeta.rtf"));

        eltexto = Convert.ToString(w.ReadToEnd());

        w.Close();

        string sindato;

        int minum;

        string completo;

        GridViewRow row = GridView11.Rows[0];

        // compania

        minum = eltexto.IndexOf("compania");

        sindato = eltexto.Remove(minum, 8);

        completo = sindato.Insert(minum, row.Cells[6].Text.ToUpper());

        // numero


        minum = completo.IndexOf("numero");

        sindato = completo.Remove(minum, 6);

        completo = sindato.Insert(minum, row.Cells[0].Text);

        // nombre

        minum = completo.IndexOf("muma");

        sindato = completo.Remove(minum, 4);

        completo = sindato.Insert(minum, row.Cells[3].Text.ToUpper() + " " + row.Cells[4].Text.ToUpper());

        //cedula

        minum = completo.IndexOf("cedula");

        sindato = completo.Remove(minum, 6);

        completo = sindato.Insert(minum, row.Cells[5].Text.ToUpper());

        //tipo

        minum = completo.IndexOf("tipo");

        sindato = completo.Remove(minum, 4);

        completo = sindato.Insert(minum,  Server.HtmlDecode(lb_tipocaso.Text.ToUpper()));

        //asignacion
        minum = completo.IndexOf("siga");

        sindato = completo.Remove(minum, 4);

        completo = sindato.Insert(minum, Server.HtmlDecode(row.Cells[11].Text.ToUpper()));

        //entrega

        minum = completo.IndexOf("tega");

        sindato = completo.Remove(minum, 4);

        completo = sindato.Insert(minum, Server.HtmlDecode(row.Cells[12].Text.ToUpper()));


        string var1 = Convert.ToString(Session["tipodecaso"]);

        if (var1 == "Seguimiento")
        {


            GridViewRow row3 = GridView1.Rows[0];


            //ciudad

            minum = completo.IndexOf("cida");

            sindato = completo.Remove(minum, 4);

            completo = sindato.Insert(minum,  Server.HtmlDecode(row3.Cells[6].Text.ToUpper()));

            //departamento

            minum = completo.IndexOf("depata");

            sindato = completo.Remove(minum, 6);

            completo = sindato.Insert(minum,  Server.HtmlDecode(row3.Cells[5].Text.ToUpper()));




        }
        else 
        
        
        {



            GridViewRow row2 = GridView13.Rows[0];


            //ciudad

            minum = completo.IndexOf("cida");

            sindato = completo.Remove(minum, 4);

            completo = sindato.Insert(minum,  Server.HtmlDecode(row2.Cells[8].Text.ToUpper()));

            //departamento

            minum = completo.IndexOf("depata");

            sindato = completo.Remove(minum, 6);

            completo = sindato.Insert(minum, Server.HtmlDecode( row2.Cells[9].Text.ToUpper()));


        
        
        }




           

       

       
        
              




        StreamWriter h = new StreamWriter(Server.MapPath("~\\Condata\\Docucaso7\\ComunData\\Marcarpeta2.rtf"));

        h.WriteLine(completo);

        h.Close();

      
               

        Response.AppendHeader("Content-Disposition", "attachment; filename=Marcarpeta2.rtf");

        Page.Response.TransmitFile("~\\Condata\\Docucaso7\\ComunData\\Marcarpeta2.rtf");
        Response.End();



            }

        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }



    }
    protected void GridView22_Load(object sender, EventArgs e)
    {

       
                
    }
    protected void GridView10_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button15_Click(object sender, EventArgs e)
    {

        

      
  
        string eltexto;

        StreamReader w = new StreamReader(Server.MapPath("~\\Condata\\Docucaso7\\ComunData\\PRELIMINARES.rtf"));

        eltexto = Convert.ToString(w.ReadToEnd());

        w.Close();

        string sindato;

        int minum;

        string completo;

        
       

        GridViewRow rowdcaso = GridView11.Rows[0];

        // detalles de caso

        minum = eltexto.IndexOf("1numero1");

        sindato = eltexto.Remove(minum, 8);

        completo = sindato.Insert(minum, rowdcaso.Cells[0].Text.ToUpper());


        // dato

        minum = completo.IndexOf("2tipo2");

        sindato = completo.Remove(minum, 6);

        completo = sindato.Insert(minum, rowdcaso.Cells[2].Text.ToUpper());

        // dato

        minum = completo.IndexOf("3compania3");

        sindato = completo.Remove(minum, 10);

        completo = sindato.Insert(minum, rowdcaso.Cells[6].Text.ToUpper());

        // dato

        minum = completo.IndexOf("4analista4");

        sindato = completo.Remove(minum, 10);

        completo = sindato.Insert(minum, rowdcaso.Cells[7].Text.ToUpper() + " " + rowdcaso.Cells[8].Text.ToUpper());

        // dato

        minum = completo.IndexOf("5investigador5");

        sindato = completo.Remove(minum, 14);

        completo = sindato.Insert(minum, rowdcaso.Cells[9].Text.ToUpper() + " " + rowdcaso.Cells[10].Text.ToUpper());

        // dato
        minum = completo.IndexOf("6asignacion6");

        sindato = completo.Remove(minum, 12);

        completo = sindato.Insert(minum, rowdcaso.Cells[11].Text.ToUpper());

        // dato

        minum = completo.IndexOf("7entrega7");

        sindato = completo.Remove(minum, 9);

        completo = sindato.Insert(minum, rowdcaso.Cells[12].Text.ToUpper());

        
        // dato

        minum = completo.IndexOf("32observaciones32");

        sindato = completo.Remove(minum, 17);

        completo = sindato.Insert(minum, rowdcaso.Cells[14].Text.ToUpper());


        


        try
        {
              GridViewRow rowdafiliado = GridView10.Rows[0];


              // dato

              minum = completo.IndexOf("8anombre8");

              sindato = completo.Remove(minum, 9);

              completo = sindato.Insert(minum, rowdafiliado.Cells[4].Text.ToUpper());

              // dato

              minum = completo.IndexOf("9aapellido9");

              sindato = completo.Remove(minum, 11);

              completo = sindato.Insert(minum, rowdafiliado.Cells[5].Text.ToUpper());

              // dato

              minum = completo.IndexOf("10acedula10");

              sindato = completo.Remove(minum, 11);

              completo = sindato.Insert(minum, rowdafiliado.Cells[6].Text.ToUpper());

              // dato

              minum = completo.IndexOf("11aciudad11");

              sindato = completo.Remove(minum, 11);

              completo = sindato.Insert(minum, rowdafiliado.Cells[7].Text.ToUpper());

              // dato

              minum = completo.IndexOf("12adireccion12");

              sindato = completo.Remove(minum, 14);

              completo = sindato.Insert(minum, rowdafiliado.Cells[8].Text.ToUpper());

              // dato

              minum = completo.IndexOf("13abarrio13");

              sindato = completo.Remove(minum, 11);

              completo = sindato.Insert(minum, rowdafiliado.Cells[9].Text.ToUpper());

              // dato

              minum = completo.IndexOf("14atelefono14");

              sindato = completo.Remove(minum, 13);

              completo = sindato.Insert(minum, rowdafiliado.Cells[11].Text.ToUpper());

              // dato

              minum = completo.IndexOf("15celular15");

              sindato = completo.Remove(minum, 11);

              completo = sindato.Insert(minum, rowdafiliado.Cells[10].Text.ToUpper());


              // dato

              minum = completo.IndexOf("16indicaciones16");

              sindato = completo.Remove(minum, 16);

              completo = sindato.Insert(minum, "");



        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }

        


        try
        {

            GridViewRow rowmuerte = GridView12.Rows[0];


            // dato

            minum = completo.IndexOf("17muerte17");

            sindato = completo.Remove(minum, 10);

            completo = sindato.Insert(minum, rowmuerte.Cells[2].Text.ToUpper());

            // dato

            minum = completo.IndexOf("18circustancias18");

            sindato = completo.Remove(minum, 17);

            completo = sindato.Insert(minum, rowmuerte.Cells[3].Text.ToUpper());


            // dato

            minum = completo.IndexOf("19fecha19");

            sindato = completo.Remove(minum, 9);

            completo = sindato.Insert(minum, rowmuerte.Cells[4].Text.ToUpper());

            // dato

            minum = completo.IndexOf("20hora20");

            sindato = completo.Remove(minum, 8);

            completo = sindato.Insert(minum, rowmuerte.Cells[5].Text.ToUpper());

            // dato

            minum = completo.IndexOf("21ciudad21");

            sindato = completo.Remove(minum, 10);

            completo = sindato.Insert(minum, Server.HtmlDecode(rowmuerte.Cells[6].Text.ToUpper()));

            // dato

            minum = completo.IndexOf("22departamento22");

            sindato = completo.Remove(minum, 16);

            completo = sindato.Insert(minum, Server.HtmlDecode(rowmuerte.Cells[7].Text.ToUpper()));

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


         try
        {


            GridViewRow rowreclamante = GridView13.Rows[0];


            // dato

            minum = completo.IndexOf("21rparentesco21");

            sindato = completo.Remove(minum, 14);

            completo = sindato.Insert(minum, rowreclamante.Cells[10].Text.ToUpper());

            // dato

            minum = completo.IndexOf("22rnombre22");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowreclamante.Cells[5].Text.ToUpper());


            // dato

            minum = completo.IndexOf("23rapellido23");

            sindato = completo.Remove(minum, 13);

            completo = sindato.Insert(minum, rowreclamante.Cells[6].Text.ToUpper());

            // dato

            minum = completo.IndexOf("24rcedula24");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowreclamante.Cells[7].Text.ToUpper());

            // dato

            minum = completo.IndexOf("25rciudad25");

            sindato = completo.Remove(minum, 10);

            completo = sindato.Insert(minum, Server.HtmlDecode(rowreclamante.Cells[8].Text.ToUpper()));

            // dato

            minum = completo.IndexOf("26rdireccion26");

            sindato = completo.Remove(minum, 14);

            completo = sindato.Insert(minum, rowreclamante.Cells[11].Text.ToUpper());



            // dato

            minum = completo.IndexOf("27rbarrio27");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowreclamante.Cells[12].Text.ToUpper());

            // dato

            minum = completo.IndexOf("28rtelefono28");

            sindato = completo.Remove(minum, 13);

            completo = sindato.Insert(minum, rowreclamante.Cells[14].Text.ToUpper());

        // dato

            minum = completo.IndexOf("29rcelular29");

            sindato = completo.Remove(minum, 12);

            completo = sindato.Insert(minum, rowreclamante.Cells[13].Text.ToUpper());


            // dato

            minum = completo.IndexOf("30indicaciones30");

            sindato = completo.Remove(minum, 16);

            completo = sindato.Insert(minum, "");

        
            // dato

            minum = completo.IndexOf("31certificacion31");

            sindato = completo.Remove(minum, 17);

            completo = sindato.Insert(minum, " ");


        }
         catch (Exception err)
         {
             string relleno;

             relleno = Convert.ToString(err);

         }



         try
        {

            GridViewRow rowlaboralesafiliado = GridView22.Rows[0];


            // dato

            minum = completo.IndexOf("33empresa33");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[3].Text.ToUpper());

            // dato

            minum = completo.IndexOf("34mailemp34");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[8].Text.ToUpper());

            // dato

            minum = completo.IndexOf("35telefono35");

            sindato = completo.Remove(minum, 12);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[5].Text.ToUpper());


            // dato

            minum = completo.IndexOf("36fax36");

            sindato = completo.Remove(minum, 7);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[6].Text.ToUpper());

            // dato

            minum = completo.IndexOf("37direccion37");

            sindato = completo.Remove(minum, 13);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[4].Text.ToUpper());

            // dato

            minum = completo.IndexOf("38ciudad38");

            sindato = completo.Remove(minum, 10);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[9].Text.ToUpper());

            // dato

            minum = completo.IndexOf("39barrio39");

            sindato = completo.Remove(minum, 10);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[7].Text.ToUpper());

            // dato

            minum = completo.IndexOf("44persona44");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[10].Text.ToUpper());


            // dato

            minum = completo.IndexOf("40extencion40");

            sindato = completo.Remove(minum, 13);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[11].Text.ToUpper());

            // dato

            minum = completo.IndexOf("41celular41");

            sindato = completo.Remove(minum, 11);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[12].Text.ToUpper());

            // dato

            minum = completo.IndexOf("42cargo42");

            sindato = completo.Remove(minum, 9);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[13].Text.ToUpper());

            // dato

            minum = completo.IndexOf("43email43");

            sindato = completo.Remove(minum, 9);

            completo = sindato.Insert(minum, rowlaboralesafiliado.Cells[14].Text.ToUpper());

        }
         catch (Exception err)
         {
             string relleno;

             relleno = Convert.ToString(err);

         }



        StreamWriter h = new StreamWriter(Server.MapPath("~\\Condata\\Docucaso7\\ComunData\\PRELIMINARES2.rtf"));

        h.WriteLine(completo);

        h.Close();




        Response.AppendHeader("Content-Disposition", "attachment; filename=PRELIMINARES2.rtf");

        Page.Response.TransmitFile("~\\Condata\\Docucaso7\\ComunData\\PRELIMINARES2.rtf");
        Response.End();



         
    }
    protected void Button16_Click(object sender, EventArgs e)
    {

       
        // se envia mensaje al investigador


      string miafiliado = " ";

      string mireclamante1 = " ";
      string mireclamante2 = " ";
      string mireclamante3 = " ";
      string mireclamante4 = " ";

       try
       {


           GridViewRow afiliadoa = GridView10.Rows[0];


           miafiliado = afiliadoa.Cells[6].Text;

       }

       catch (Exception err)
       {
           string relleno;

           relleno = Convert.ToString(err);

       }

       try
       {

           GridViewRow reclamante1 = GridView13.Rows[0];

           mireclamante1 = reclamante1.Cells[7].Text;

       }
       catch (Exception err)
       {
           string relleno;

           relleno = Convert.ToString(err);

       }
            
        
    
         try
       {

        GridViewRow reclamante2 = GridView13.Rows[1];
             
        mireclamante2 = reclamante2.Cells[7].Text;



       }
         catch (Exception err)
         {
             string relleno;

             relleno = Convert.ToString(err);

         }
        

         try
       {

           GridViewRow reclamante3 = GridView13.Rows[2];

           mireclamante3 = reclamante3.Cells[7].Text;

       }
         catch (Exception err)
         {
             string relleno;

             relleno = Convert.ToString(err);

         }


           try
       {
        
        GridViewRow reclamante4 = GridView13.Rows[3];


        mireclamante4 = reclamante4.Cells[7].Text;

       }
       
           
           catch (Exception err)
           {
               string relleno;

               relleno = Convert.ToString(err);

           }


        System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();




        mensaje3.To.Add("maximusdnns@gmail.com");


        mensaje3.Subject = "Solicitud Datos # " + lb_ncaso.Text + "#-----" + DateTime.Now;


        mensaje3.IsBodyHtml = true;



        mensaje3.Body = "<br /> CC " + miafiliado + "<br /> CC " + mireclamante1 + "<br /> CC " + mireclamante2 + "<br /> CC " + mireclamante3 + "<br /> CC " + mireclamante4;




        dynamic smpt = new System.Net.Mail.SmtpClient();



        try
        {

            smpt.Send(mensaje3);

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


    }
    protected void Button17_Click(object sender, EventArgs e)
    {

        

        System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();


        mensaje3.To.Add("gustavo.galindez@consultandoweb.com");


        mensaje3.Subject = "Solicitud Certificaciones Eps Caso " + lb_ncaso.Text + "#-----" + DateTime.Now;


        //mensaje3.IsBodyHtml = true;



        mensaje3.Body = TextBox1.Text;




        dynamic smpt = new System.Net.Mail.SmtpClient();



        try
        {

            smpt.Send(mensaje3);

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }




    }
    protected void Button19_Click(object sender, EventArgs e)
    {

        // se envia mensaje al investigador


        string miafiliado = " ";

        string mireclamante1 = " ";
        string mireclamante2 = " ";
        string mireclamante3 = " ";
        string mireclamante4 = " ";
        
        string nombreafiliado = " ";
        string apellidoafiliado = " ";

        string nombrereclamante1 = " ";
        string apellidoreclamante1 = " ";

        string nombrereclamante2 = " ";
        string apellidoreclamante2 = " ";

        string nombrereclamante3 = " ";
        string apellidoreclamante3 = " ";

        string nombrereclamante4 = " ";
        string apellidoreclamante4 = " ";


        try
        {


            GridViewRow afiliadoa = GridView10.Rows[0];


            miafiliado = afiliadoa.Cells[6].Text;
            
            nombreafiliado = afiliadoa.Cells[4].Text;
            apellidoafiliado = afiliadoa.Cells[5].Text;

        }

        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }

        try
        {

            GridViewRow reclamante1 = GridView13.Rows[0];

            mireclamante1 = reclamante1.Cells[7].Text;


            nombrereclamante1 = reclamante1.Cells[5].Text;
            apellidoreclamante1 = reclamante1.Cells[6].Text;

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);


           }



        try
        {

            GridViewRow reclamante2 = GridView13.Rows[1];

            mireclamante2 = reclamante2.Cells[7].Text;


            nombrereclamante2 = reclamante2.Cells[5].Text;
            apellidoreclamante2 = reclamante2.Cells[6].Text;


        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


        try
        {

            GridViewRow reclamante3 = GridView13.Rows[2];

            mireclamante3 = reclamante3.Cells[7].Text;


            nombrereclamante3 = reclamante3.Cells[5].Text;
            apellidoreclamante3 = reclamante3.Cells[6].Text;

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


        try
        {

            GridViewRow reclamante4 = GridView13.Rows[3];


            mireclamante4 = reclamante4.Cells[7].Text;


            nombrereclamante4 = reclamante4.Cells[5].Text;
            apellidoreclamante4 = reclamante4.Cells[6].Text;

        }


        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


        System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();




        mensaje3.To.Add("gustavo.galindez@consultandoweb.com");


        mensaje3.Subject = "Solicitud Instrumentos Publicos Centro Norte Sur Caso " + lb_ncaso.Text + "#-----" + DateTime.Now;


        mensaje3.IsBodyHtml = true;



        mensaje3.Body = "<br /> Por favor Realizar Diligencias De Solicitud Instrumentos Publicos Centro Norte Sur De Las Siguientes Personas <br />" + "<br />Nombres: " + nombreafiliado + " " + apellidoafiliado + " Cedula: " + miafiliado + "<br />Nombres: " + nombrereclamante1 + " " + apellidoreclamante1 + " Cedula: " + mireclamante1 + "<br />Nombres: " + nombrereclamante2 + " " + apellidoreclamante2 + " Cedula: " + mireclamante2 + "<br />Nombres: " + nombrereclamante3 + " " + apellidoreclamante3 + " Cedula: " + mireclamante3 + "<br />Nombres: " + nombrereclamante4 + " " + apellidoreclamante4 + " Cedula: " + mireclamante4;




        dynamic smpt = new System.Net.Mail.SmtpClient();



        try
        {

            smpt.Send(mensaje3);

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


    }
    protected void Button20_Click(object sender, EventArgs e)
    {

        // se envia mensaje al investigador


        string miafiliado = " ";

        string mireclamante1 = " ";
        string mireclamante2 = " ";
        string mireclamante3 = " ";
        string mireclamante4 = " ";

        string nombreafiliado = " ";
        string apellidoafiliado = " ";

        string nombrereclamante1 = " ";
        string apellidoreclamante1 = " ";

        string nombrereclamante2 = " ";
        string apellidoreclamante2 = " ";

        string nombrereclamante3 = " ";
        string apellidoreclamante3 = " ";

        string nombrereclamante4 = " ";
        string apellidoreclamante4 = " ";


        try
        {


            GridViewRow afiliadoa = GridView10.Rows[0];


            miafiliado = afiliadoa.Cells[6].Text;

            nombreafiliado = afiliadoa.Cells[4].Text;
            apellidoafiliado = afiliadoa.Cells[5].Text;

        }

        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }

        try
        {

            GridViewRow reclamante1 = GridView13.Rows[0];

            mireclamante1 = reclamante1.Cells[7].Text;


            nombrereclamante1 = reclamante1.Cells[5].Text;
            apellidoreclamante1 = reclamante1.Cells[6].Text;

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);


        }



        try
        {

            GridViewRow reclamante2 = GridView13.Rows[1];

            mireclamante2 = reclamante2.Cells[7].Text;


            nombrereclamante2 = reclamante2.Cells[5].Text;
            apellidoreclamante2 = reclamante2.Cells[6].Text;


        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


        try
        {

            GridViewRow reclamante3 = GridView13.Rows[2];

            mireclamante3 = reclamante3.Cells[7].Text;


            nombrereclamante3 = reclamante3.Cells[5].Text;
            apellidoreclamante3 = reclamante3.Cells[6].Text;

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


        try
        {

            GridViewRow reclamante4 = GridView13.Rows[3];


            mireclamante4 = reclamante4.Cells[7].Text;


            nombrereclamante4 = reclamante4.Cells[5].Text;
            apellidoreclamante4 = reclamante4.Cells[6].Text;

        }


        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }


        System.Net.Mail.MailMessage mensaje3 = new System.Net.Mail.MailMessage();




        mensaje3.To.Add("gustavo.galindez@consultandoweb.com");


        mensaje3.Subject = "Solicitud Certificados NO PENSION Instituto De Seguros Sociales " + lb_ncaso.Text + "#-----" + DateTime.Now;


        mensaje3.IsBodyHtml = true;



        mensaje3.Body = "<br /> Por favor Realizar Diligencias De Instituto De Seguros Sociales de las Siguientes Personas <br />" + "<br />Nombres: " + nombrereclamante1 + " " + apellidoreclamante1 + " Cedula: " + mireclamante1 + "<br />Nombres: " + nombrereclamante2 + " " + apellidoreclamante2 + " Cedula: " + mireclamante2 + "<br />Nombres: " + nombrereclamante3 + " " + apellidoreclamante3 + " Cedula: " + mireclamante3 + "<br />Nombres: " + nombrereclamante4 + " " + apellidoreclamante4 + " Cedula: " + mireclamante4;




        dynamic smpt = new System.Net.Mail.SmtpClient();



        try
        {

            smpt.Send(mensaje3);

        }
        catch (Exception err)
        {
            string relleno;

            relleno = Convert.ToString(err);

        }



    }
    protected void Button21_Click(object sender, EventArgs e)
    {
        
    }
    protected void Button28_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\NuevoRecurso\\nuevo");
    }
}