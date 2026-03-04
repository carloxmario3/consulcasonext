using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ContaCaso_Menu_Default : System.Web.UI.Page
{



    //Consul9WebService.ContaCasoServiceSoapClient ContaCasoObject = new Consul9WebService.ContaCasoServiceSoapClient();
    ClaseContaCaso  ContaCasoObject = new ClaseContaCaso();


    
    
    protected void Page_Load(object sender, EventArgs e)
    {



        if (IsPostBack)
        {
        }
        else
        {


           CargarGastosHtml();

            
        }     

    }






    


  void CargarGastosHtml()
  {



      String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
      SqlConnection con = new SqlConnection(strConnString);
      SqlCommand cmd = new SqlCommand();
      cmd.CommandType = CommandType.StoredProcedure;
      cmd.CommandText = "SP_LISTA_DE_CASOS";
      //cmd.Parameters.Add("@IDLEGALIZACION", SqlDbType.BigInt).Value = 7;
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

                      Records1 = "<div class='FormatoDivGrande'><a href='../VisualizadorDeCasos.aspx" + ValorCelda + "puntonormal'><table style='width:100%;'><tr><td rowspan='6' class='auto-style1'><a><img src='../Condata/" + ValorCelda + "/Fotos/0.jpg' onerror=this.onerror=null;this.src='0.jpg' style='width: 150px' /></a></td></tr>";

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

      
  



     
 
}