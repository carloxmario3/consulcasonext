using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageVisorDeCasos : System.Web.UI.Page
{

    public string mivaiable34;


    protected void Page_Load(object sender, EventArgs e)
    {


        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        


        mivaiable34 = Convert.ToString(Session["pruebahtml"]);

        Session["pruebahtml"] = Convert.ToString(Session["pruebahtml"]) + Convert.ToString(Session["pruebahtml"]);
    }
}