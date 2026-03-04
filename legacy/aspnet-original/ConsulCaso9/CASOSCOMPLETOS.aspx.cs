using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

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



           

                

                string fechahoy = DateTime.Now.ToString().Substring(0, 10);



            


                GridViewCompletos.EmptyDataText = "No Records Found";
                GridViewCompletos.DataSource = ContaCasoObject.CargaCasosCompletos();
                GridViewCompletos.DataBind();


            

                          





          



        }










    }




    public string CompararaFechas(string fechaacomparar)
    {


        DateTime date1 = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
        DateTime date2 = new DateTime(2009, 8, 1, 12, 0, 0);
        int result = DateTime.Compare(date1, date2);
        string relationship;

        if (result < 0) {


            relationship = "is earlier than";
        }
        else if (result == 0) { 
            relationship = "is the same time as";
        }
        else
        { 
            relationship = "is later than";

        }

        return relationship;
    }



 




    /*

    void CargarCasosRicardo()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "Ricardo.Montiel@consultandoweb.com";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 1;
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


                    Records2 += "<tr><td>" + Reader.GetValue(i) + "</td> </tr>";


                    // Panel1.Controls.Add(new LiteralControl(yourHTMLstring));

                    if (ColumnaNumero == 0)
                    {

                        Records1 = "<div class='FormatoDivOtro'><a href='../ConsulCaso9/NewVisualizadorCasos.aspx" + ValorCelda + "'><table style='width:100%;'>";

                    }









                }


                Records3 = "</table></a></div><br />";





                Records = Records + Records1 + Records2 + Records3;

                Records1 = "";
                Records2 = "";

                RecordCount += 1;
            }


            //Label_TotalLegalizacion.Text = RecordCount + "Records processed:" + Records;

            PanelRicardo.Controls.Add(new LiteralControl(Records));


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


    */



   

    protected void GridViewCompletos_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCompletos.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

  
   
        

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\ListaDeCasos.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~/ConsulCaso9/SeguimientoLaborales.aspx");
    }
}