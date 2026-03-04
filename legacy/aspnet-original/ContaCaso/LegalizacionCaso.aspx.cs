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
    string idinvestigador;
    string correoinvestigador;


    protected void Page_Load(object sender, EventArgs e)
    {



        NumeroDeCaso = (string)Page.RouteData.Values["NumeroCasoLegalizaciones"];

        if (Roles.IsUserInRole("AreaOperativa"))

        {

            Page.Response.Redirect("~/ContaCaso/GastosInvestigacion.aspx" + NumeroDeCaso);
        
        
        }

        
        correoinvestigador = Convert.ToString(System.Web.Security.Membership.GetUser().Email);

        idinvestigador = ContaCasoObject.obteneridinvestigador(correoinvestigador);      
        

        LabelPendienteLegalizar.Text = "$ " + Convert.ToInt32(ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(idinvestigador))).ToString("N0");


        if (IsPostBack)
        {
        }
        else
        {


            CargarLegalizaciones();
            TotalLegalizaciones();


        }






    }
    protected void Button1_Click(object sender, EventArgs e)
    {
                
        Page.Response.Redirect("~/ContaCaso/NuevaLegalizacion.aspx" + NumeroDeCaso + "y0");
        
    }




    void CargarLegalizaciones()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_CARGAR_LEGALIZACIONES";

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



                    if (Roles.IsUserInRole("Investigador"))
                    {

                        //Button1.Visible = false;

                    }


                    
                    
                    ColumnaNumero = i;
                    ValorCelda = Convert.ToString(Reader.GetValue(i));



                    if (ColumnaNumero == 0)
                    {
                        Records2 += "<tr><td> Legalizacion :" + Reader.GetValue(i) + "</td> </tr>";

                    }
                    

                    if (ColumnaNumero == 1)
                    {
                        Records2 += "<tr><td> Total:" + Reader.GetValue(i) + "</td> </tr>";
                    
                    }

                    if (ColumnaNumero == 2)
                    {
                        Records2 += "<tr><td> Legalizacion Terminada :" + Reader.GetValue(i) + "</td> </tr>";

                    }
                    if (ColumnaNumero == 3)
                    {
                        Records2 += "<tr><td> Fecha :" + Reader.GetValue(i) + "</td> </tr>";

                    }

                    // Panel1.Controls.Add(new LiteralControl(yourHTMLstring));

                    if (ColumnaNumero == 0)
                    {

                        Records1 = "<div class='FormatoDivGrande'><a href='../ContaCaso/NuevaLegalizacion.aspx"+NumeroDeCaso+"y"+ValorCelda+"'><table style='width:100%;'><tr><td rowspan='6' class='auto-style1'><a><img src='Exel.PNG' style='width: 150px' /></a></td></tr>";

                    }









                }


                Records3 = "</table></a></div><br />";





                Records = Records + Records1 + Records2 + Records3;

                Records1 = "";
                Records2 = "";

                RecordCount += 1;
            }


            //Label_TotalLegalizacion.Text = RecordCount + "Records processed:" + Records;

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






    void TotalLegalizaciones()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Sp_VALOR_TOTAL_LEGALIZACIONES";

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
                        Records2 += "<tr><td> TOTAL LEGALIZACIONES: " +  Reader.GetValue(i) + "</td> </tr>";

                    }

                                       

                    // Panel1.Controls.Add(new LiteralControl(yourHTMLstring));

                    if (ColumnaNumero == 0)
                    {

                        Records1 = "<div class='FormatoDivGrande'></td></tr>";

                    }









                }


                Records3 = "</table></div><br />";





                Records = Records + Records1 + Records2 + Records3;

                Records1 = "";
                Records2 = "";

                RecordCount += 1;
            }


            //Label_TotalLegalizacion.Text = RecordCount + "Records processed:" + Records;

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
        Page.Response.Redirect("~/ContaCaso/PanelDeCuentasLegalizacion.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);


        

    }
}