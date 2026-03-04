using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.IO;

public partial class Gestion_AsignarCasosPage : System.Web.UI.Page
{
    private ClaseCasos casosok = new ClaseCasos();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (this.IsPostBack == false)
        {
            this.DropDownList1.DataSource = this.SqlDataSource2;
            this.DropDownList1.DataTextField = "Nombres";
            this.DropDownList1.DataValueField = "Id_Investigador";
            this.DropDownList1.DataBind();


            this.DropDownList2.DataSource = this.SqlDataSource2;
            this.DropDownList2.DataTextField = "Nombres";
            this.DropDownList2.DataValueField = "Id_Investigador";
            this.DropDownList2.DataBind();


            this.DropDownList3.DataSource = this.SqlDataSource2;
            this.DropDownList3.DataTextField = "Correo";
            this.DropDownList3.DataValueField = "Id_Investigador";
            this.DropDownList3.DataBind();

            DropDownList3.SelectedValue = DropDownList1.SelectedValue;

        }



    }




    void ActualizarPermisosFtp(string idinvestigador,string numerodecaso) {



        Page.Response.Redirect("~\\ConsulCaso9\\AbrirArchivos.aspxAsign-" + idinvestigador + "-" + numerodecaso);

            
    }

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();




    private static void DirectoryCopy(string sourceDirName, string destDirName, bool copySubDirs)
    {
        // Get the subdirectories for the specified directory.
        DirectoryInfo dir = new DirectoryInfo(sourceDirName);
        DirectoryInfo[] dirs = dir.GetDirectories();

        if (!dir.Exists)
        {
            throw new DirectoryNotFoundException(
                "Source directory does not exist or could not be found: "
                + sourceDirName);
        }

        // If the destination directory doesn't exist, create it. 
        if (!Directory.Exists(destDirName))
        {
            Directory.CreateDirectory(destDirName);
        }

        // Get the files in the directory and copy them to the new location.
        FileInfo[] files = dir.GetFiles();
        foreach (FileInfo file in files)
        {
            string temppath = Path.Combine(destDirName, file.Name);
            file.CopyTo(temppath, false);
        }

        // If copying subdirectories, copy them and their contents to new location. 
        if (copySubDirs)
        {
            foreach (DirectoryInfo subdir in dirs)
            {
                string temppath = Path.Combine(destDirName, subdir.Name);
                DirectoryCopy(subdir.FullName, temppath, copySubDirs);
            }
        }
    }


    
    
    protected void Button2_Click(object sender, EventArgs e)
    {


        /*

        string idinvestigador = ContaCasoObject.obtenerCasoAsignadoA(lb_ncaso.Text);


        if (ContaCasoObject.obtenerEstadoDeCaso(lb_ncaso.Text) == "1")
        {

            System.IO.Directory.Move(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + idinvestigador + "\\" + lb_ncaso.Text), Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + DropDownList1.SelectedValue + "\\" + lb_ncaso.Text));



            
            //System.IO.Directory.CreateDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + DropDownList1.SelectedValue + "\\" + lb_ncaso.Text));
            
            //DirectoryCopy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + idinvestigador + "\\" + lb_ncaso.Text), Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + DropDownList1.SelectedValue + "\\" + lb_ncaso.Text), true);
            
        }
        else
        {

            idinvestigador = "3333";

            System.IO.Directory.Move(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + idinvestigador + "\\" + lb_ncaso.Text), Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\" + DropDownList1.SelectedValue + "\\"));

        }


        */





        string varito = "no paso";

        casosok.Id_investigador = DropDownList1.SelectedValue;

        casosok.actualizarasignado(lb_ncaso.Text, ref varito);

        

        lb_info_operacion.Text = varito;



        

        // Envia correo electronico a investigador con nuevo asignacion



        if (DropDownList3.SelectedItem.Text != "No Asignado")
        {

      

            System.Net.Mail.MailMessage mensaje4 = new System.Net.Mail.MailMessage();


            mensaje4.To.Add(DropDownList3.SelectedItem.Text);


            mensaje4.Subject = "Nuevo Caso Asignado # " +  lb_ncaso.Text + " Afiliado: " + lb_nombre.Text + "#---" + DateTime.Now;

            mensaje4.IsBodyHtml = true;



            mensaje4.Body = "<img src='http://consultandoweb.com/consulcaso/logo.png' alt='ConsulCaso7'> <br />" + "<h2><h3><i>  Asignacion Caso #" + lb_ncaso.Text + " Afiliado: " + lb_nombre.Text + "</i></h3> <br />" + " <br />" + " <h2> Puede Ver el caso Asignado Dando Clic En El Siguiente Enlace: </h2>" + " <br />" + "<h1> <a href='" + WebConfigurationManager.AppSettings["RutaPagina"] + "/VisualizadorDeCasos.aspx" + lb_ncaso.Text + "puntonormal'> Ver Caso Asignado </a> </h1>";




            dynamic smpt2 = new System.Net.Mail.SmtpClient();


            try
            {
                smpt2.Send(mensaje4);
            }

            catch (Exception err)
            {
                lb_info_operacion.Text = Convert.ToString(err);

            }




        }
        
        
        
        
        
        
        








        
        
        
        
        Panel1.Visible = false;

             



        Page.Response.Redirect("~\\Gestion\\AsignarCasosPage.aspx");
        //Page.Response.Redirect("~\\Gestion\\AsignarCasosPage.aspx");


        //ActualizarPermisosFtp(casosok.Id_investigador, lb_ncaso.Text);


     


     


    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session["asignadoaa"] = "31";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }




    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerAnexo")
        {

            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];
                                 

            Panel1.Visible = true;

            lb_ncaso.Text = row.Cells[1].Text;

            lb_nombre.Text = row.Cells[4].Text + " " + row.Cells[5].Text; 

            lb_cedula.Text = row.Cells[6].Text;

               

        }


        if (e.CommandName == "ActualizarAnexo")
        {

         

        }

    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {


        Session["asignadoaa"] = DropDownList2.SelectedValue;

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.SelectedValue = DropDownList1.SelectedValue;
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
         
    }
}