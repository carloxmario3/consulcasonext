using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_ImprimirLegalizacion : System.Web.UI.Page
{



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
                
        //correoinvestigador = Convert.ToString(System.Web.Security.Membership.GetUser());
       
        idinvestigador = ContaCasoObject.obteneridinvestigadorPorLegalizacion(idlegalizacion);


        LabelInvestigador.Text = ContaCasoObject.obtenerNombreinvestigador(idinvestigador);



        LabelValorLegalizar.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(idinvestigador));


        LabelDateOfLegalizacion.Text = ContaCasoObject.FechaLegalizacion(idlegalizacion);


        string asegura;
        string compania;
        string ciudad;
        string asignacion;


        ContaCasoObject.DatosDeCaso(numerodecaso, out asegura, out compania, out ciudad, out asignacion);




        Labelasegurado.Text = asegura;
        LabelCompañia.Text = compania;
        LabelCiudad.Text = ciudad;
        LabelDateAsignacion.Text = asignacion;



        LabelNumeroDeCaso.Text = numerodecaso;
        LabelLegalizacionNumero.Text = idlegalizacion;
        
        LabelValorTotal.Text = ContaCasoObject.SumatoriaGastos(idlegalizacion);

        

        GridView_Gastos.EmptyDataText = "No Records Found";
        GridView_Gastos.DataSource = ContaCasoObject.CargarGastos(idlegalizacion);
        GridView_Gastos.DataBind();




        

        string RESULTADO;
        int investigador = Convert.ToInt32(idinvestigador);


        RESULTADO = ContaCasoObject.ConsolidarCuentas(investigador);

        GridView1.EmptyDataText = "No Records Found";
        GridView1.DataSource = ContaCasoObject.CONSIGNACIONCORESPONDIENTE(idlegalizacion);
        GridView1.DataBind();





    }
}