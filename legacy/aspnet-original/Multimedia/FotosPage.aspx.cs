using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Multimedia_FotosPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        HyperLink1.NavigateUrl = "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaFotos" + "#AnclaFotos";


        string var1;

        var1 = Convert.ToString(Session["revisordecasossi"]);


        if (var1 == "si")
        {

            Button2.Visible = false;


            HyperLink1.NavigateUrl = "~/RevisorCasosPage.aspx" + Convert.ToString(Session["revisordecasoretorno"]) + "puntoAnclaFotos";

        }   

        
        Label3.Text = Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Fotos\\" + Convert.ToString(Session["Verfoto"]));






        if (File.Exists(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Fotos\\" + Convert.ToString(Session["Verfoto"]))))
        {
                       
            Label2.Text = "siexisteM";

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

    int anchomargen ;

    
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


    protected void btnUpload3_Click(object sender, EventArgs e)
    {

    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\NuevaFoto\\nuevo");
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];

            Session["Verfoto"] = row.Cells[4].Text;

            Page.Response.Redirect("~\\Multimedia\\FotosPage.aspx");

        }





        if (e.CommandName == "ActualizarAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];


            Session["codigofotoa"] = row.Cells[1].Text;

            Page.Response.Redirect("~\\NuevaFoto\\actualizar");

        }




    }


}