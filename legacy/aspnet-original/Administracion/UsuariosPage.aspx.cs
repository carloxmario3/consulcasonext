using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Administracion_UsuariosPage : System.Web.UI.Page
{

    string UsuariosxID;

    protected void Page_Load(object sender, EventArgs e)
    {
        UsuariosxID = (string)Page.RouteData.Values["UsuariosxID"];


        if (UsuariosxID == "Analistas")
        {

            HyperLink1.NavigateUrl = "~/Administracion/AnalistasPage.aspx";

        }

        if (UsuariosxID == "Investigadores")
        {

            HyperLink1.NavigateUrl = "~/Administracion/InvestigadoresPage.aspx";

        }


        if (this.IsPostBack == false)
        {
            this.dd_tipo.DataSource = Roles.GetAllRoles();
            this.dd_tipo.DataBind();

            
            lb_usuario.Text = Membership.GetUserNameByEmail(Convert.ToString(Session["nombredeusuario"]));

            
            this.DropDownList1.DataSource = Roles.GetRolesForUser(Convert.ToString(Session["nombredeusuario"]));
            this.DropDownList1.DataBind();

            MembershipUser user = Membership.GetUser(Convert.ToString(Session["nombredeusuario"]));
           
            lbcontrass.Text = user.GetPassword();
        }
                                              
        
    }
    protected void bt_boton_Click(object sender, EventArgs e)
    {


        if (Convert.ToString(this.DropDownList1.SelectedItem) != "")
        
        {

        Roles.RemoveUserFromRole(Convert.ToString(Session["nombredeusuario"]), Convert.ToString(this.DropDownList1.SelectedItem));

        }

        Roles.AddUserToRole(Convert.ToString(Session["nombredeusuario"]),Convert.ToString(this.dd_tipo.SelectedItem));


        lb_Ncontra.Visible = false;
        tb_contra.Visible = false;
        Button2.Visible = false;
        dd_tipo.Visible = false;
        bt_boton.Visible = false;
        lb_tipo0.Visible = false;

        lb_mensaje.Text = "Usuario Cambiado Con Exito";


        if (UsuariosxID == "Analistas")
        {


            Page.Response.Redirect("~/Usuarios/Analistas");

        }

        if (UsuariosxID == "Investigadores")
        {


            Page.Response.Redirect("~/Usuarios/Investigadores");

        }

    }


    
    protected void Button2_Click(object sender, EventArgs e)
    {

        MembershipUser user = Membership.GetUser(Convert.ToString(Session["nombredeusuario"]));

        string pasgenerado = user.ResetPassword();

        string pasnuevo = tb_contra.Text;

        user.ChangePassword(pasgenerado, pasnuevo);


        

        lb_Ncontra.Visible = false;
        tb_contra.Visible = false;
        Button2.Visible = false;
        dd_tipo.Visible = false;
        bt_boton.Visible = false;
        lb_tipo0.Visible = false;

        lb_mensaje.Text = "contraseña cambiada con exito";


        if (UsuariosxID == "Analistas")
        {


            Page.Response.Redirect("~/Usuarios/Analistas");

        }

        if (UsuariosxID == "Investigadores")
        {


            Page.Response.Redirect("~/Usuarios/Investigadores");

        }

        

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        lb_Ncontra.Visible = true;
        tb_contra.Visible = true;
        Button2.Visible = true;
        dd_tipo.Visible = true;
        bt_boton.Visible = true;
        lb_tipo0.Visible = true;
    }
}