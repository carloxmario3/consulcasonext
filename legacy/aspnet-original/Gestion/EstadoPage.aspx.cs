using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gestion_EstadoPage : System.Web.UI.Page
{

    private ClaseCasos casosok = new ClaseCasos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            this.DropDownList1.DataSource = this.SqlDataSource2;
            this.DropDownList1.DataTextField = "Nombre";
            this.DropDownList1.DataValueField = "Id_estado";
            this.DropDownList1.DataBind();


        }
    }


    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        
        
        string varito = "no paso";

        casosok.Id_estado = DropDownList1.SelectedValue;


        casosok.actualizarestado(lb_ncaso.Text, ref varito);

        lb_info_operacion.Text = varito;


        Panel1.Visible = false;


        
     /*   

        string idinvestigador = ContaCasoObject.obtenerCasoAsignadoA(lb_ncaso.Text);


         if (ContaCasoObject.obtenerEstadoDeCaso(lb_ncaso.Text) == "1")
                {
                     
                    System.IO.Directory.Move(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\"+ idinvestigador +"\\" + lb_ncaso.Text), Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\3333\\"));
                                      

                }
                else
                {


                    System.IO.Directory.Move(Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\3333\\"+ lb_ncaso.Text),Path.Combine(Request.PhysicalApplicationPath, "Condata\\CasosAsignados\\"+ idinvestigador +"\\"));
                    

                }
        

        */

        


        

        
        //DropDownList1.SelectedValue



        Page.Response.Redirect("~\\Gestion\\EstadoPage.aspx");



    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session["estadocaso"] = "3";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Session["estadocaso"] = "1";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session["estadocaso"] = "2";
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



        }


        if (e.CommandName == "ActualizarAnexo")
        {



        }

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Session["estadocaso"] = "4";
    }
}