using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.Security;
public partial class ConsulCaso9_Default2 : System.Web.UI.Page
{



    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();




    protected void Page_Load(object sender, EventArgs e)
    {


        //Label1.Text = Convert.ToString(Membership.GetUser());



       



        if (IsPostBack)
        {


            if (Roles.IsUserInRole("AreaOperativa"))
            {

                CargarTodosLosCasos();
            }


        }
        else
        {


            if (Roles.IsUserInRole("AreaOperativa"))
            {


                CargarCasosNoAsignados();
                CargarCasosCompletos();
                CargarCasosSuspendido();
                CargarCasosFacturado();
                CargarCasosPorRevisar();

                CargarCasosRicardo();
                CargarCasosDavid();

                //CargarCasosWilson();

                CargarCasosFabiola();
                CargarCasosFanny();
               // CargarCasosMauricio();
                CargarCasosIrma();

                CargarCasosPorEnviar();

                CargarCasosPagados();





            }
            else
            {

                CargarCasosPorRevisar();
               // CargarCasosRicardo();
               // CargarCasosDiego();
               // CargarCasosWilson();
               // CargarCasosFabiola();
               // CargarCasosFanny();
               // CargarCasosMauricio();
               // CargarCasosIrma();
                CargarCasosNoAsignados2();

                Button1.Visible = false;




            }




           



        }

    }




   

  





    void CargarCasosNoAsignados()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "No Asignado";

        }
        else {

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

            PanelSinAsignar.Controls.Add(new LiteralControl(Records));


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




    void CargarCasosCompletos()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 2;
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

            PanelCompletos.Controls.Add(new LiteralControl(Records));
            

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






    void CargarCasosPorEnviar()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 7;
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

            PanelPorEnviar.Controls.Add(new LiteralControl(Records));


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





    void CargarCasosPagados()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 6;
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

            PanelPagados.Controls.Add(new LiteralControl(Records));


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





    void CargarCasosSuspendido()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 3;
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

            PanelSusendidos.Controls.Add(new LiteralControl(Records));


            

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





    void CargarCasosFacturado()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 4;
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

            PanelFacturados.Controls.Add(new LiteralControl(Records));


            

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





    void CargarCasosPorRevisar()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {


            //cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";
            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }



        cmd.Parameters.Add("@ESTADOCASO", SqlDbType.BigInt).Value = 5;
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

            PanelPorRevisar.Controls.Add(new LiteralControl(Records));

            
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




    void CargarCasosDavid()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "David.Montiel@consultandoweb.com";

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

            PanelDavid.Controls.Add(new LiteralControl(Records));

            

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







    void CargarCasosFabiola()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "Fabiola.Montiel@consultandoweb.com";

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

            PanelFabiola.Controls.Add(new LiteralControl(Records));


            


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





    void CargarCasosFanny()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "Fanny.Martinez@consultandoweb.com";

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

            PanelFanny.Controls.Add(new LiteralControl(Records));

                       


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





  


    void CargarCasosIrma()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "Irma.martinez@consultandoweb.com";

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

            Panelirma.Controls.Add(new LiteralControl(Records));

            
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














    void CargarTodosLosCasos()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS_TODOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "%";

        }
        else
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = Convert.ToString(Membership.GetUser());


        }

                
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

            PanelTodosLosCasos.Controls.Add(new LiteralControl(Records));

            
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








    void CargarCasosNoAsignados2()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LISTA_DE_CASOS";


        if (Roles.IsUserInRole("AreaOperativa"))
        {

            cmd.Parameters.Add("@CORREOUSUARIO", SqlDbType.VarChar, 50).Value = "No Asignado";

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

            PanelTodosLosCasos.Controls.Add(new LiteralControl(Records));


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







    protected void Button1_Click(object sender, EventArgs e)
    {

    }

  
}