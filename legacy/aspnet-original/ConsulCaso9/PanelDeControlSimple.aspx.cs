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



            if (Roles.IsUserInRole("AreaOperativa"))
            {

                

                string fechahoy = DateTime.Now.ToString().Substring(0, 10);



                GridViewCasoSinAsignar.EmptyDataText = "No Records Found";
                GridViewCasoSinAsignar.DataSource = ContaCasoObject.CargaCasosNoAsignados();
                GridViewCasoSinAsignar.DataBind();

                foreach (GridViewRow row in GridViewCasoSinAsignar.Rows)
                {


                    DateTime date1 = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);                                    
                    DateTime date2 = DateTime.Parse(row.Cells[14].Text);
                    int result = DateTime.Compare(date1, date2);                   

                    if (result < 0)                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Green;
                        //relationship = "is earlier than";
                    }
                    else if (result == 0)                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Yellow;
                        //relationship = "is the same time as";
                    }
                    else
                    {
                        row.Cells[14].BackColor = System.Drawing.Color.Red;
                        //relationship = "is later than";

                    }



                 


                if (row.Cells[11].Text.Substring(0, 10) == fechahoy)
                    {

                        row.Cells[11].BackColor = System.Drawing.Color.GreenYellow;
                        row.Cells[12].BackColor = System.Drawing.Color.GreenYellow;
                    }
                    else
                    {
                        row.Cells[11].BackColor = System.Drawing.Color.Orange;
                        row.Cells[12].BackColor = System.Drawing.Color.Orange;
                    }



                    if (Convert.ToInt32(row.Cells[15].Text) <= 10)
                    {                        
                        row.Cells[15].BackColor = System.Drawing.Color.Green;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 10 && Convert.ToInt32(row.Cells[15].Text) <= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Yellow;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Red;
                    }





                }









                GridViewCasosAsignados.EmptyDataText = "No Records Found";
                GridViewCasosAsignados.DataSource = ContaCasoObject.CargaCasosAsignados();
                GridViewCasosAsignados.DataBind();

                foreach (GridViewRow row in GridViewCasosAsignados.Rows)
                {

                    DateTime date1 = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                    DateTime date2 = DateTime.Parse(row.Cells[14].Text);
                    int result = DateTime.Compare(date1, date2);

                    if (result < 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Green;
                        //relationship = "is earlier than";
                    }
                    else if (result == 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Yellow;
                        //relationship = "is the same time as";
                    }
                    else
                    {
                        row.Cells[14].BackColor = System.Drawing.Color.Red;
                        //relationship = "is later than";

                    }




                    if (row.Cells[11].Text.Substring(0, 10) == fechahoy)
                    {

                        row.Cells[11].BackColor = System.Drawing.Color.GreenYellow;
                        row.Cells[12].BackColor = System.Drawing.Color.GreenYellow;
                    }
                    else
                    {
                        row.Cells[11].BackColor = System.Drawing.Color.Orange;
                        row.Cells[12].BackColor = System.Drawing.Color.Orange;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) <= 10)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Green;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 10 && Convert.ToInt32(row.Cells[15].Text) <= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Yellow;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Red;
                    }



                }





                GridViewCasosPorRevisar.EmptyDataText = "No Records Found";
                GridViewCasosPorRevisar.DataSource = ContaCasoObject.CargaCasosPorRevisar();
                GridViewCasosPorRevisar.DataBind();

                foreach (GridViewRow row in GridViewCasosPorRevisar.Rows)
                {

                    DateTime date1 = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                    DateTime date2 = DateTime.Parse(row.Cells[14].Text);
                    int result = DateTime.Compare(date1, date2);

                    if (result < 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Green;
                        //relationship = "is earlier than";
                    }
                    else if (result == 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Yellow;
                        //relationship = "is the same time as";
                    }
                    else
                    {
                        row.Cells[14].BackColor = System.Drawing.Color.Red;
                        //relationship = "is later than";

                    }





                    if (row.Cells[11].Text.Substring(0, 10) == fechahoy)
                    {

                        row.Cells[11].BackColor = System.Drawing.Color.GreenYellow;
                        row.Cells[12].BackColor = System.Drawing.Color.GreenYellow;
                    }
                    else
                    {
                        row.Cells[11].BackColor = System.Drawing.Color.Orange;
                        row.Cells[12].BackColor = System.Drawing.Color.Orange;
                    }



                    if (Convert.ToInt32(row.Cells[15].Text) <= 10)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Green;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 10 && Convert.ToInt32(row.Cells[15].Text) <= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Yellow;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Red;
                    }


                }



                GridViewCasoEnviar.EmptyDataText = "No Records Found";
                GridViewCasoEnviar.DataSource = ContaCasoObject.CargaCasosCasoEnviar();
                GridViewCasoEnviar.DataBind();

                foreach (GridViewRow row in GridViewCasoEnviar.Rows)
                {

                    DateTime date1 = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                    DateTime date2 = DateTime.Parse(row.Cells[14].Text);
                    int result = DateTime.Compare(date1, date2);

                    if (result < 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Green;
                        //relationship = "is earlier than";
                    }
                    else if (result == 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Yellow;
                        //relationship = "is the same time as";
                    }
                    else
                    {
                        row.Cells[14].BackColor = System.Drawing.Color.Red;
                        //relationship = "is later than";

                    }






                    if (row.Cells[11].Text.Substring(0, 10) == fechahoy)
                    {

                        row.Cells[11].BackColor = System.Drawing.Color.GreenYellow;
                        row.Cells[12].BackColor = System.Drawing.Color.GreenYellow;
                    }
                    else
                    {
                        row.Cells[11].BackColor = System.Drawing.Color.Orange;
                        row.Cells[12].BackColor = System.Drawing.Color.Orange;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) <= 10)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Green;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 10 && Convert.ToInt32(row.Cells[15].Text) <= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Yellow;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Red;
                    }


                }


                GridViewCompletos.EmptyDataText = "No Records Found";
                GridViewCompletos.DataSource = ContaCasoObject.CargaCasosCompletos();
                GridViewCompletos.DataBind();


                GridViewFacturados.EmptyDataText = "No Records Found";
                GridViewFacturados.DataSource = ContaCasoObject.CargaCasosFacturados();
                GridViewFacturados.DataBind();


                GridViewPagados.EmptyDataText = "No Records Found";
                GridViewPagados.DataSource = ContaCasoObject.CargaCasosPagados();
                GridViewPagados.DataBind();


                GridViewCasosSuspendidos.EmptyDataText = "No Records Found";
                GridViewCasosSuspendidos.DataSource = ContaCasoObject.CargaCasosSuspedidos();
                GridViewCasosSuspendidos.DataBind();



                GridViewSeguimientos.EmptyDataText = "No Records Found";
                GridViewSeguimientos.DataSource = ContaCasoObject.CargaSeguimientos();
                GridViewSeguimientos.DataBind();



                               


                foreach (GridViewRow row in GridViewSeguimientos.Rows)
                {

                    DateTime date1 = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                    DateTime date2 = DateTime.Parse(row.Cells[14].Text);
                    int result = DateTime.Compare(date1, date2);

                    if (result < 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Green;
                        //relationship = "is earlier than";
                    }
                    else if (result == 0)
                    {

                        row.Cells[14].BackColor = System.Drawing.Color.Yellow;
                        //relationship = "is the same time as";
                    }
                    else
                    {
                        row.Cells[14].BackColor = System.Drawing.Color.Red;
                        //relationship = "is later than";

                    }




                    if (row.Cells[11].Text.Substring(0, 10) == fechahoy)
                {

                      row.Cells[11].BackColor = System.Drawing.Color.GreenYellow;
                        row.Cells[12].BackColor = System.Drawing.Color.GreenYellow;
               }
                else
                    {
                        row.Cells[11].BackColor = System.Drawing.Color.Orange;
                        row.Cells[12].BackColor = System.Drawing.Color.Orange;
                    }

                    if (Convert.ToInt32(row.Cells[15].Text) <= 10)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Green;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 10 && Convert.ToInt32(row.Cells[15].Text) <= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Yellow;
                    }


                    if (Convert.ToInt32(row.Cells[15].Text) >= 20)
                    {
                        row.Cells[15].BackColor = System.Drawing.Color.Red;
                    }


                }






            }
            else
            {

                Div2.Visible = false;


                GridViewCasosAsignados.EmptyDataText = "No Records Found";
                GridViewCasosAsignados.DataSource = ContaCasoObject.CargaCasosAsignadosInvestigaor(Convert.ToString(Membership.GetUser()),1);
                GridViewCasosAsignados.DataBind();

            }





          



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



    protected void GridViewCasoSinAsignar_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCasoSinAsignar.SelectedRow;

     
        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[3].Text);
    }

    protected void GridViewCasosAsignados_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCasosAsignados.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

    protected void GridViewCasosPorRevisar_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCasosPorRevisar.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

    protected void GridViewCasoEnviar_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCasoEnviar.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

    protected void GridViewCompletos_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCompletos.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

    protected void GridViewFacturados_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewFacturados.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

    protected void GridViewPagados_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewPagados.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }


   



    protected void GridViewSeguimientos_SelectedIndexChanged(object sender, EventArgs e)
    {


        GridViewRow row = GridViewSeguimientos.SelectedRow;

        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[1].Text);


        
    }

    protected void GridViewCasosSuspendidos_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewCasosSuspendidos.SelectedRow;


        Page.Response.Redirect("~/ConsulCaso9/NewVisualizadorCasos.aspx" + row.Cells[2].Text);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~/ConsulCaso9/SeguimientoLaborales.aspx");
    }
}