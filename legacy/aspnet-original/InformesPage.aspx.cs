using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class InformesPage : System.Web.UI.Page
{

    string ingresoID;

    private ClaseVideo videook = new ClaseVideo();
    private ClaseFotos fotosok = new ClaseFotos();

    protected void Page_Load(object sender, EventArgs e)
    {
        ingresoID = (string)Page.RouteData.Values["ingresoID"];
        
        
       


        if (ingresoID == "Videos")
        {

            Label2.Text = "Lista De Informes";

            Label3.Text = "Seleccione El Informe Relacionado Con El VIDEO Que Desea Subir";

            GridView8.DataSourceID = "SqlDataSource9";

        }


        if (ingresoID == "Fotos")
        {
            Label2.Text = "Lista De Informes";

            Label3.Text = "Seleccione El Informe Relacionado Con Las FOTOS Que Desea Subir";

            GridView8.DataSourceID = "SqlDataSource9";

        }



        if (ingresoID == "Anexos")
        {
            Label2.Text = "Lista De Informes";

            Label3.Text = "Seleccione El Informe Relacionado Con Los ANEXOS Que Desea Subir";

            GridView8.DataSourceID = "SqlDataSource9";

        }


        if (ingresoID == "Revisar")
        {

            Label2.Text = "Informes Por Revisar";

            Session["estadoreviinformes"] = "Revisar";


            if (Roles.IsUserInRole("Investigador"))
            {

                Session["investigadorrevicion"] = Convert.ToString(Membership.GetUser());
                                

            }

            if (Roles.IsUserInRole("Analista"))
            {

                


            }

            if (Roles.IsUserInRole("JefeAnalista"))
            {
                

            }

            if (Roles.IsUserInRole("AreaOperativa"))
            {

                Session["investigadorrevicion"] = "%";             
            

            }


        }


        if (ingresoID == "Convertir")
        {
            Label2.Text = "Informes Por Convertir";

            Session["estadoreviinformes"] = "Convertir";


            if (Roles.IsUserInRole("Investigador"))
            {

                Session["investigadorrevicion"] = Convert.ToString(Membership.GetUser());

            }

            if (Roles.IsUserInRole("Analista"))
            {




            }

            if (Roles.IsUserInRole("JefeAnalista"))
            {


            }

            if (Roles.IsUserInRole("AreaOperativa"))
            {


                Session["investigadorrevicion"] = "%";  


            }



        }



        if (ingresoID == "Corregir")
        {

            Label2.Text = "Informes Por Corregir";

            Session["estadoreviinformes"] = "Corregir";


            if (Roles.IsUserInRole("Investigador"))
            {

                Session["investigadorrevicion"] = Convert.ToString(Membership.GetUser());

            }

            if (Roles.IsUserInRole("Analista"))
            {




            }

            if (Roles.IsUserInRole("JefeAnalista"))
            {


            }

            if (Roles.IsUserInRole("AreaOperativa"))
            {

                Session["investigadorrevicion"] = "%";                

            }



        }




        if (ingresoID == "Publicados")
        {

            Label2.Text = "Informes Publicados";

            Session["estadoreviinformes"] = "Publicado";

            if (Roles.IsUserInRole("Investigador"))
            {

                Session["investigadorrevicion"] = Convert.ToString(Membership.GetUser());

            }

            if (Roles.IsUserInRole("Analista"))
            {




            }

            if (Roles.IsUserInRole("JefeAnalista"))
            {


            }

            if (Roles.IsUserInRole("AreaOperativa"))
            {


                Session["investigadorrevicion"] = "%";  


            }



        }


    }
    protected void GridView8_SelectedIndexChanged(object sender, EventArgs e)
    {

        
       
        string algo = "rr";

        GridViewRow row = GridView8.SelectedRow;

        Session["NumeroDeInforme"] = row.Cells[1].Text;

        Session["NumeroDeCaso"] = row.Cells[3].Text;

        Session["tipodecasorevisor"] = row.Cells[4].Text; 

        videook.traervideo(Convert.ToString(Session["NumeroDeInforme"]),ref algo);

        Session["vervideo"] = videook.Ruta;


        fotosok.traerfoto(Convert.ToString(Session["NumeroDeInforme"]), ref algo);

        Session["Verfoto"] = fotosok.Ruta;



        if (ingresoID == "Videos")
        {

            Page.Response.Redirect("~/Multimedia/VideosPage.aspx");

        }


        if (ingresoID == "Fotos")
        {

            Page.Response.Redirect("~/Multimedia/FotosPage.aspx");

        }
        
        
        
        if (ingresoID == "Anexos")
        {

            Page.Response.Redirect("~/Documentacion/AnexosPage.aspx");

        }


        if (ingresoID == "Revisar")
        {

            GridViewRow row8 = GridView8.SelectedRow;

            Session["NumeroDeCaso"] = row8.Cells[3].Text;

            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row8.Cells[3].Text + "punto" + "normal");

                     
            
        }


        if (ingresoID == "Convertir")
        {


            Page.Response.Redirect("~/RevisorCasosPage.aspxConvertirpuntonormal");

        }


        if (ingresoID == "Publicados")
        {


            GridViewRow row8 = GridView8.SelectedRow;

            Session["NumeroDeCaso"] = row8.Cells[3].Text;

            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row8.Cells[3].Text + "punto" + "normal");

           

        }


        if (ingresoID == "Corregir")
        {


            GridViewRow row8 = GridView8.SelectedRow;

            Session["NumeroDeCaso"] = row8.Cells[3].Text;

            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row8.Cells[3].Text + "punto" + "normal");



        }

        
    }
}