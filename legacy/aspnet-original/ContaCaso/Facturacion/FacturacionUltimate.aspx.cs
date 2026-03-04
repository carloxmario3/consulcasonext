using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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



       // if (!IsPostBack)
        //    AddControls();






        if (IsPostBack)
        {
        }
            
        else
        {
            
          
            DropDownList_Compania.DataSource = ContaCasoObject.CargarCompanias();
            DropDownList_Compania.DataValueField = "Id_compania";
            DropDownList_Compania.DataTextField = "Nombre";
            DropDownList_Compania.DataBind();

                     



        }




           


    }
    
    


   
    protected void DropDownList_Compania_SelectedIndexChanged(object sender, EventArgs e)
    {


        DropDownList_Casos.DataSource = ContaCasoObject.CargarCasosCompletosFacturar(DropDownList_Compania.SelectedValue);
        DropDownList_Casos.DataValueField = "Id_Numero_Caso";
        DropDownList_Casos.DataTextField = "NCASOTEXT";
        DropDownList_Casos.DataBind();




    }


    protected void ButtonFacturarCaso_Click(object sender, EventArgs e)
    {


        AddControls();



    }









    void CargarDatosCaso()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
       
        
        //cmd.CommandText = "SP_LEER_DATOS_CASO";


        cmd.CommandText = "SP_CARGAR_GASTOS_POR_CASOS";

        


        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.BigInt).Value = NumeroDeCaso;
        cmd.Connection = con;
        try
        {
            con.Open();


            SqlDataReader Reader = default(SqlDataReader);

            int RecordCount = 0;

            Reader = cmd.ExecuteReader();

            string Records = null;
          


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

                       

                    }


                    Records = Records + "<a>" + ValorCelda + "</a>";


                




                }




              

               
                RecordCount += 1;
            }


            //Label_TotalLegalizacion.Text = RecordCount + "Records processed:" + Records;

            Panel1.Controls.Add(new LiteralControl(Records));


        }
        catch (Exception ex)
        {
            //throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }






    }












    protected override void LoadViewState(object savedState)
    {
        base.LoadViewState(savedState);
        if (ViewState["controsladded"] == null)
            AddControls();
    }


    private void AddControls()
    {
        Label milabelito = new Label();
        milabelito.Text = "esteesuntexto";
        milabelito.ID = "milabelitolabel";


        TextBox dynamictextbox = new TextBox();
        dynamictextbox.Text = "(Enter some text)";
        dynamictextbox.ID = "dynamictextbox";


        Button dynamicbutton = new Button();
        dynamicbutton.Click += new System.EventHandler(dynamicbutton_Click);
        dynamicbutton.Text = "Dynamic Button";


        Panel1.Controls.Add(dynamictextbox);
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(dynamicbutton);
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(new LiteralControl("<BR>"));
        Panel1.Controls.Add(milabelito);

        
        ViewState["controlsadded"] = true;


    }

    private void dynamicbutton_Click(Object sender, System.EventArgs e)
    {
        TextBox tb = new TextBox();
        tb = (TextBox)(Panel1.FindControl("dynamictextbox"));
        Label1.Text = tb.Text;
    }







    protected void Button1_Click(object sender, EventArgs e)
    {


        NumeroDeCaso = DropDownList_Casos.SelectedValue;

        CargarDatosCaso();




    }
}