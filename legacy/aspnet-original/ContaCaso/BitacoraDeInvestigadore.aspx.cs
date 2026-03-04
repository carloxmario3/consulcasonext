using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_GastosInvestigacion : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    
    protected void Page_Load(object sender, EventArgs e)
    {



        if (IsPostBack)
        {



        }
            
        else
        {

            DropDownListInvestigador.DataSource = ContaCasoObject.CargarInvestigadores();
            DropDownListInvestigador.DataValueField = "Id_Investigador";
            DropDownListInvestigador.DataTextField = "Investigador";
            DropDownListInvestigador.DataBind();

          




        }



    }
   
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {


        

        GridViewBitacora.EmptyDataText = "No Records Found";
        GridViewBitacora.DataSource = ContaCasoObject.BitacoraDeCasoInvestigador(Convert.ToInt32(DropDownListInvestigador.SelectedValue));
        GridViewBitacora.DataBind();



      

        


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        ContaCasoObject.InsertarBitacoraInvestigador(TextBox1.Text, Convert.ToInt32(DropDownListInvestigador.SelectedValue));

        GridViewBitacora.EmptyDataText = "No Records Found";
        GridViewBitacora.DataSource = ContaCasoObject.BitacoraDeCasoInvestigador(Convert.ToInt32(DropDownListInvestigador.SelectedValue));
        GridViewBitacora.DataBind();


        TextBox1.Text = "";


    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}