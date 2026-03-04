using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContaCaso_LegalizacionCaso : System.Web.UI.Page
{


    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();
    string NumeroDeCaso;
    string NumeroDeFactura;

    string idinvestigador;
    string correoinvestigador;


    protected void Page_Load(object sender, EventArgs e)
    {



        NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoFactura"];

       

        

        

        if (IsPostBack)
        {
        }
        else
        {


            Cargarfacturas();
        


        }






    }
    protected void Button1_Click(object sender, EventArgs e)
    {



        NumeroDeFactura = ContaCasoObject.NuevaFactura(NumeroDeCaso);

        Page.Response.Redirect("~/ContaCaso/Facturacion/FacturacionIndividual.aspx" + NumeroDeCaso + "y" + NumeroDeFactura);


    }




    void Cargarfacturas()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_FACTURAS";

        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;
                
        cmd.Connection = con;
        try
        {
            con.Open();


            SqlDataReader Reader = default(SqlDataReader);

            int RecordCount = 0;

            Reader = cmd.ExecuteReader();

            string Records = null;
            string Records1 = null;
            string Records2 = null;
            string Records3 = null;



            int ColumnaNumero = 0;
            string ValorCelda = "";


            while (Reader.Read())
            {



                



                int i = 0;
                for (i = 0; i <= Reader.FieldCount - 1; i++)
                {



                   
                    
                    
                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));



                    if (ColumnaNumero == 0)
                    {
                        Records2 += "<tr><td> FACTURA :" + Reader.GetValue(i) + "</td> </tr>";

                    }
                    

                    if (ColumnaNumero == 1)
                    {
                        Records2 += "<tr><td> TOTAL FACTURA:" + Reader.GetValue(i) + "</td> </tr>";
                    
                    }

                    if (ColumnaNumero == 2)
                    {
                        Records2 += "<tr><td> FACTURA FINALIZADA :" + Reader.GetValue(i) + "</td> </tr>";

                    }
                    if (ColumnaNumero == 3)
                    {
                        Records2 += "<tr><td> FECHA :" + Reader.GetValue(i) + "</td> </tr>";

                    }

                    // Panel1.Controls.Add(new LiteralControl(yourHTMLstring));

                    if (ColumnaNumero == 0)
                    {

                        Records1 = "<div class='FormatoDivGrande'><a href='../Facturacion/FacturacionIndividual.aspx" + NumeroDeCaso+"y"+ValorCelda+"'><table style='width:100%;'><tr><td rowspan='6' class='auto-style1'><a><img src='Exel.PNG' style='width: 150px' /></a></td></tr>";

                    }









                }


                Records3 = "</table></a></div><br />";





                Records = Records + Records1 + Records2 + Records3;

                Records1 = "";
                Records2 = "";

                RecordCount += 1;
            }


            

            Panel1.Controls.Add(new LiteralControl(Records));


        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }






    }








    protected void Button2_Click(object sender, EventArgs e)
    {

       


    }
}