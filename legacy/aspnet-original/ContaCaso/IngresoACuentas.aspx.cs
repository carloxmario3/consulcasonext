using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_IngresoACuentas : System.Web.UI.Page
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


        String fechayhora;

        fechayhora =  TextBox_Fecha.Text + " "+ TextBoxHora.Text;
               
                

        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);

                FileInfo fi = new FileInfo(filename);
                string ext = fi.Extension;


                FileUpload1.SaveAs(Server.MapPath("~/Condata/Consignaciones/") + ContaCasoObject.InsertarViaticosInvestigador(fechayhora,TextBoxValor.Text,ContaCasoObject.InsertarTransaccionViaticosInvestigador(ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue),TextBoxValor.Text),DropDownListInvestigador.SelectedValue) + ext);
                LabelEstado.Text = "Viaticos Ingresados Con Exito";
            }
            catch (Exception ex)
            {
                LabelEstado.Text = "A ocurrido un error con el ingreso de los viaticos" + ex.Message;
            }
        }




        Div1.Visible = false;
        Button1.Visible = false;
        Button2.Visible = true;
        

        

    }
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {



        LabelSaldo.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(DropDownListInvestigador.SelectedValue));


        



    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~/ContaCaso/IngresoACuentas.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}