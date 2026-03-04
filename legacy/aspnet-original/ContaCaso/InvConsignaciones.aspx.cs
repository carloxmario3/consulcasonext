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

    string idinvestigador;
    string correoinvestigador;

    protected void Page_Load(object sender, EventArgs e)
    {


        //NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoGastos"];

        //NumeroDeCaso = "5496";

        //LabelTotalGastos.Text =  ContaCasoObject.TotalGastosCaso(NumeroDeCaso);



        correoinvestigador = Convert.ToString(System.Web.Security.Membership.GetUser().Email);
        idinvestigador = ContaCasoObject.obteneridinvestigador(correoinvestigador);

        Label3.Text = correoinvestigador;





        if (IsPostBack)
        {
        }
            
        else
        {


            GridViewGastos.EmptyDataText = "No Records Found";
            GridViewGastos.DataSource = ContaCasoObject.CargarConsignacionesInvestigador(idinvestigador);
            GridViewGastos.DataBind();

            LabeLPendientePorLegalizar.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(idinvestigador));

                             

        
        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        

    }
   
    protected void GridViewGastos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewGastos.SelectedRow;

        //Server.Transfer("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");

        Page.Response.Redirect("~/Condata/CasosAsignados/Consignaciones/" + row.Cells[0].Text + ".pdf");


    }
}