using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_GastosInvestigacion : System.Web.UI.Page
{

    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    string NumeroDeCaso;
    protected void Page_Load(object sender, EventArgs e)
    {


        //NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoGastos"];

        //NumeroDeCaso = "5496";

        //LabelTotalGastos.Text =  ContaCasoObject.TotalGastosCaso(NumeroDeCaso);


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
    protected void Button1_Click(object sender, EventArgs e)
    {
        

    }
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewGastos.EmptyDataText = "No Records Found";
        GridViewGastos.DataSource = ContaCasoObject.CargarConsignacionesInvestigador(DropDownListInvestigador.SelectedValue);
        GridViewGastos.DataBind();




        LabeLPendientePorLegalizar.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue));


        


    }
    protected void GridViewGastos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewGastos.SelectedRow;

        //Server.Transfer("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");

        Page.Response.Redirect("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");


    }
}