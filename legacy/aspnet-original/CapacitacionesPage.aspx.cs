using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;

public partial class CapacitacionesPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        


      


        if (Roles.IsUserInRole("Analista"))
        {
            

            Session["usuariocapacita"] = "Analista";


        }



        if (Roles.IsUserInRole("JefeAnalista"))
        {


            Session["usuariocapacita"] = "JefeAnalista";


        }



        if (Roles.IsUserInRole("AreaOperativa"))
        {


            Session["usuariocapacita"] = "AreaOperativa";


        }


        if (Roles.IsUserInRole("Investigador"))
        {


            Session["usuariocapacita"] = "Investigador";



        }






        



        foreach (string foundFile in System.IO.Directory.GetFiles(System.IO.Path.Combine(Request.PhysicalApplicationPath, "Condata\\Capacitacion\\" + Convert.ToString(Session["usuariocapacita"]))))
        {


            ListBox2.Items.Add(rutasaok(foundFile));



        }




    }
    protected void Button2_Click(object sender, EventArgs e)
    {



        Page.Response.Redirect("~/SubirCapacitacion.aspx");



    }





    public string rutasaok(string rutasa)
    {


        int caracteres_totales;

        int posicion_rallita;

        int caracteres_archivo;

        string nombre_archivo = null;


        caracteres_totales = rutasa.Length;

        posicion_rallita = rutasa.LastIndexOf("\\");

        posicion_rallita = posicion_rallita + 1;

        caracteres_archivo = (caracteres_totales - posicion_rallita);


        nombre_archivo = rutasa.Substring(posicion_rallita, caracteres_archivo);

        return nombre_archivo;


    }




    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        

                
        //Session["cargayredirije"] = "si";
            
              

    }







  


    protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    {

        Label2.Text = ListBox2.SelectedValue;

        Session["capacitavideo"] = ListBox2.SelectedValue;


        Page.Response.Redirect("~/SoloVideoCapacitacion.aspx");

    }
}