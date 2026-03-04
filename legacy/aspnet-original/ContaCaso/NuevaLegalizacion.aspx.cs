using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_NuevaLegalizacion : System.Web.UI.Page
{



    //Consul9WebService.ContaCasoServiceSoapClient ContaCasoObject = new Consul9WebService.ContaCasoServiceSoapClient();
    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();


    string numerodecaso;
    string idlegalizacion;
    string correoinvestigador;
    string idinvestigador;
    string editable;

    protected void Page_Load(object sender, EventArgs e)
    {


        numerodecaso = (string)Page.RouteData.Values["NumeroCasoNuevale"];
        idlegalizacion = (string)Page.RouteData.Values["Idlegalizaok"];

        correoinvestigador = Convert.ToString(System.Web.Security.Membership.GetUser().Email);
        idinvestigador = ContaCasoObject.obteneridinvestigador(correoinvestigador);

        

        

        if (IsPostBack)
        {
        }
        else
        {

            Session["ValorCiudadombo"] = 0;


            Label1NombreInvestigador.Text = correoinvestigador;

            LabelCaso.Text = numerodecaso;


            Label_ValorPorLegalizar.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(idinvestigador));






            DivPendienteLegalizar.Visible = true;
            DivCaso.Visible = true;


            DropDownList_Concepto.DataSource = ContaCasoObject.CargarConceptos();
            DropDownList_Concepto.DataValueField = "N_ID_CONCEPTO";
            DropDownList_Concepto.DataTextField = "T_NOMBRE";
            DropDownList_Concepto.DataBind();
            DivConcepto.Visible = true;


            
            
            
            if (idlegalizacion == "0")
            {


                LabelNumeroLegalizacion.Text = ContaCasoObject.NuevaLegalizacion(numerodecaso);

                editable = ContaCasoObject.OBTENERESTADOLEGALIZACION(idlegalizacion);
                

            }
            else 
            {


                LabelNumeroLegalizacion.Text = idlegalizacion;

                editable = ContaCasoObject.OBTENERESTADOLEGALIZACION(idlegalizacion);
                


                GridView_Gastos.EmptyDataText = "No Records Found";
                GridView_Gastos.DataSource = ContaCasoObject.CargarGastos(LabelNumeroLegalizacion.Text);
                GridView_Gastos.DataBind();


                Label_TotalLegalizacion.Text = ContaCasoObject.SumatoriaGastos(LabelNumeroLegalizacion.Text);



                int ValorLegalizacion = Convert.ToInt32(Label_ValorPorLegalizar.Text);
                int ValorPorLegalizar = Convert.ToInt32(Label_TotalLegalizacion.Text);



                Label_PendienteLegalizarLuego.Text = Convert.ToString(ValorLegalizacion - ValorPorLegalizar);



                DropDownList_Concepto.SelectedValue = "0";
                DropDownList_Ciudad.SelectedValue = "0";
                CalendarFechaGasto.SelectedDates.Clear();


                Div_ciudad.Visible = false;
                Diligencie_Valor.Visible = false;
                Div_Fecha.Visible = false;
                Div_AgregarConcepto.Visible = false;

                Div_ListaConceptos.Visible = true;


                Div_TerminarLegalizacion.Visible = true;

                if (editable == "0")
                {


                    DivConcepto.Visible = true;
                    Div_PendientePorLegalizar.Visible = true;

                }
                else
                {

                   // Button1Imprimir.Visible = true;
                    Div_PendientePorLegalizar.Visible = false;


                    this.GridView_Gastos.Columns[0].Visible = false;

                    DivConcepto.Visible = false;
                    Div_TerminarLegalizacion.Visible = false;

                }
                

                
                
                
                Div_TotalLegalizacion.Visible = true;
                



                
                
                






            
            
            }

            
            
            

            






        }

    }





    protected void DropDownList_Concepto_SelectedIndexChanged(object sender, EventArgs e)
    {

        DropDownList_Ciudad.DataSource = ContaCasoObject.CargarCiudades();
        DropDownList_Ciudad.DataValueField = "Id_ciudad";
        DropDownList_Ciudad.DataTextField = "Ciudaddep";
        DropDownList_Ciudad.DataBind();

        Div_ciudad.Visible = true;


        DropDownList_Ciudad.SelectedValue = Convert.ToString(Session["ValorCiudadombo"]);



    }
    protected void DropDownList_Ciudad_SelectedIndexChanged(object sender, EventArgs e)
    {

        




    }
    protected void Button_AgregarConcepto2_Click(object sender, EventArgs e)
    {



        if (TextBox_ValorConcepto.Visible == true)
        {


            Session["ValorLegalizaciones"] = TextBox_ValorConcepto.Text;


        }
        else 
        
        {

            Session["ValorLegalizaciones"] = Label_ValorConcepto.Text;
                
        
        
        
        }

        ContaCasoObject.InsertarGasto
          (
          DropDownList_Concepto.SelectedValue,
          idinvestigador,
          Convert.ToString(Session["ValorLegalizaciones"]),
          numerodecaso,
          CalendarFechaGasto.SelectedDate,
          LabelNumeroLegalizacion.Text
          );


       


        GridView_Gastos.EmptyDataText = "No Records Found";
        GridView_Gastos.DataSource = ContaCasoObject.CargarGastos(LabelNumeroLegalizacion.Text);
        GridView_Gastos.DataBind();


        Label_TotalLegalizacion.Text = ContaCasoObject.SumatoriaGastos(LabelNumeroLegalizacion.Text);



        int ValorLegalizacion = Convert.ToInt32(Label_ValorPorLegalizar.Text);
        int ValorPorLegalizar = Convert.ToInt32(Label_TotalLegalizacion.Text);



        Label_PendienteLegalizarLuego.Text = Convert.ToString(ValorLegalizacion - ValorPorLegalizar);


        //fff
        DropDownList_Concepto.SelectedValue = "0";
        //DropDownList_Ciudad.SelectedValue = "0";
        CalendarFechaGasto.SelectedDates.Clear();


        Div_ciudad.Visible = false;
        Diligencie_Valor.Visible = false;
        Div_Fecha.Visible = false;
        Div_AgregarConcepto.Visible = false;


        Div_ListaConceptos.Visible = true;
        Div_TotalLegalizacion.Visible = true;
        Div_PendientePorLegalizar.Visible = true;



        Div_TerminarLegalizacion.Visible = true;


        
        

        


    }
    protected void Button_TerminarLegalizacion_Click(object sender, EventArgs e)
    {

        ContaCasoObject.ActualizarLegalizacion(LabelNumeroLegalizacion.Text, ContaCasoObject.InsertarTransaccion(ContaCasoObject.LoadCuentaInvestigador(idinvestigador), Label_TotalLegalizacion.Text));


        Page.Response.Redirect("~/ContaCaso/LegalizacionCaso.aspx" + numerodecaso);


    }
    protected void CalendarFechaGasto_SelectionChanged(object sender, EventArgs e)
    {
        Div_AgregarConcepto.Visible = true;
    }




    protected void GridView_Gastos_SelectedIndexChanged(object sender, EventArgs e)
    {


        

        GridViewRow row = GridView_Gastos.SelectedRow;

        ContaCasoObject.QUITARGASTO(row.Cells[1].Text);

        Page.Response.Redirect("~/ContaCaso/NuevaLegalizacion.aspx" + numerodecaso + "y" + LabelNumeroLegalizacion.Text);

        

    }
    protected void ButtonEstaCiudad_Click(object sender, EventArgs e)
    {

        ContaCasoObject.ActualizarCiudadLegalizacion(LabelNumeroLegalizacion.Text, Convert.ToInt32(DropDownList_Ciudad.SelectedValue));



        Session["ValorCiudadombo"] = DropDownList_Ciudad.SelectedValue;

        string ValorFijo;
        string VALOR;

        ContaCasoObject.CargarValorConcepto(DropDownList_Concepto.SelectedValue, DropDownList_Ciudad.SelectedValue, out VALOR, out ValorFijo);



        if (ValorFijo == "True")
        {

            TextBox_ValorConcepto.Visible = false;
            Label_ValorConcepto.Visible = true;

            Label_ValorConcepto.Text = VALOR;

            Session["ValorLegalizaciones"] = Label_ValorConcepto.Text;

        }
        else
        {

            TextBox_ValorConcepto.Visible = true;
            Label_ValorConcepto.Visible = false;
            TextBox_ValorConcepto.Text = VALOR;

            Session["ValorLegalizaciones"] = TextBox_ValorConcepto.Text;

        }


        Diligencie_Valor.Visible = true;
        Div_Fecha.Visible = true;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~/ContaCaso/PanelDeCuentasLegalizacion.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\ContaCaso\\LegalizacionCaso.aspx" + numerodecaso);
    }
}