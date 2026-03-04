using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_RecivoCajaMenor : System.Web.UI.Page
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





    protected void Button1_Click(object sender, EventArgs e)
    {


        ContaCasoObject.DevolverACajaMenor("CAJA MENOR", "Regreso a caja menor viaticos", TextBoxValor.Text,DropDownListInvestigador.SelectedValue,ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue));

        Page.Response.Redirect("~/ContaCaso/RecivoCajaMenor.aspx");

    }





    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {



        LabelSaldo.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue));






    }






}