using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        //LabelUsuario.Text = Convert.ToString(System.Web.Security.Membership.GetUser());
        LabelUsuario.Text = Convert.ToString(System.Web.Security.Membership.GetUser().Email);


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            Image6.Visible = true;
            Image9.Visible = true;
            Image14.Visible = true;
            Image15.Visible = true;
            Image16.Visible = true;
            Image17.Visible = true;
            Image3.Visible = true;
            Image19.Visible = true;
            Image88.Visible = true;


        }
        else {

            Image6.Visible = true;
            Image19.Visible = true;
            Image88.Visible = true;


        }

        



        }
}