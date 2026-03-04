using System;
using System.Collections.Generic;
using System.Data.OleDb;
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










            ContaCasoObject.BorrarTablaViaticosTemporal();



            LabelFecha.Text = DateTime.Now.Year.ToString() + "_" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Hour.ToString() + "_" + DateTime.Now.Minute.ToString() + "_" + DateTime.Now.Second.ToString();


            System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "ContaCaso\\Banco\\GeneradorLimpio.xls"), Path.Combine(Request.PhysicalApplicationPath, "ContaCaso\\Banco\\" + LabelFecha.Text +".xls"));



            Session["CampoConsignacion"] = "8";
            Session["Campoarray"] = "0";

            DropDownListInvesConsigna.DataSource = ContaCasoObject.CargarInvestigadoresConsigna();
            DropDownListInvesConsigna.DataValueField = "ID";
            DropDownListInvesConsigna.DataTextField = "NOMBREINVESTIGADOR";
            DropDownListInvesConsigna.DataBind();

           



        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {









        for (int ii = 0; ii < ContaCasoObject.CargarViatcosTemporales().Rows.Count; ii++)
        {





            String IDIVESTIGADORTEMP = Convert.ToString(ContaCasoObject.CargarViatcosTemporales().Rows[ii]["ID_INVESTIGADOR"]);
            String VALORTEMP = Convert.ToString(ContaCasoObject.CargarViatcosTemporales().Rows[ii]["VALOR"]);
            String NOMBETEM = Convert.ToString(ContaCasoObject.CargarViatcosTemporales().Rows[ii]["NOMBRE"]);


            

            String fechayhora;

            fechayhora = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString() + " " + DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();



            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);

                    FileInfo fi = new FileInfo(filename);
                    string ext = fi.Extension;


                    FileUpload1.SaveAs(Server.MapPath("~/Condata/Consignaciones/") + ContaCasoObject.InsertarViaticosInvestigador(fechayhora, VALORTEMP, ContaCasoObject.InsertarTransaccionViaticosInvestigador(ContaCasoObject.LoadCuentaInvestigador(IDIVESTIGADORTEMP), VALORTEMP), IDIVESTIGADORTEMP) + ext);
                    LabelEstado.Text = "Viaticos Ingresados Con Exito";

                    
                }
                catch (Exception ex)
                {
                    LabelEstado.Text = "A ocurrido un error con el ingreso de los viaticos" + ex.Message;
                }
            }
            else
            {

                LabelEstado.Text = "Seleccione El Archivo de Soporte";


            }


            
        }






        

    }
    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {



      


        



    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Page.Response.Redirect("~/ContaCaso/PanelDeCuentasLegalizacion.aspx");
    }

    protected void DropDownListInvesConsigna_SelectedIndexChanged(object sender, EventArgs e)
    {


        //Label5.Visible = true;







    }


    

    protected void ButtonAgregar_Click(object sender, EventArgs e)
    {


        if (DropDownListInvesConsigna.SelectedValue == "0")

        {






        }
        else
        {




            int CampoConsignacion = Convert.ToInt32(Session["CampoConsignacion"]);

            int Campoarray = Convert.ToInt32(Session["Campoarray"]);



            string ID_INVESTIGADOR;
            string CUENTAORIGEN;
            string NUMEROCUENTAORIGEN;
            string PRODUCTODESTINO;
            string NUMEROPRODUCTODESTINO;
            string NOMBREINVESTIGADOR;
            string CEDULA;
            string ACTIVO;




            ContaCasoObject.DatosbANCOiNVESTIGADOR(DropDownListInvesConsigna.SelectedValue, out ID_INVESTIGADOR, out CUENTAORIGEN, out NUMEROCUENTAORIGEN, out PRODUCTODESTINO, out NUMEROPRODUCTODESTINO, out NOMBREINVESTIGADOR, out CEDULA, out ACTIVO);







            if (ID_INVESTIGADOR == "")
            {

                //LabelSaldo.Text = "NO ID";

            }
            else
            {


                ContaCasoObject.InsertarViaticosTemporal(ID_INVESTIGADOR, TextBoxValorConsigacion.Text, NOMBREINVESTIGADOR);

                //LabelSaldo.Text = ContaCasoObject.PendientePorLegalizar(ContaCasoObject.LoadCuentaInvestigador(ID_INVESTIGADOR));


            }








            LabelValores.Text = LabelValores.Text + NOMBREINVESTIGADOR + " " + TextBoxValorConsigacion.Text + "<br />";







            String sConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/ContaCaso/Banco/" + LabelFecha.Text + ".xls") + " ;Extended Properties='Excel 8.0;HDR=NO'";
            OleDbConnection objConn = new OleDbConnection(sConnectionString);
            objConn.Open();




            OleDbCommand objCmdSelect1 = new OleDbCommand(@"UPDATE [Hoja1$B" + CampoConsignacion + ":B" + CampoConsignacion + "] SET F1='" + CUENTAORIGEN + "'", objConn);
            objCmdSelect1.ExecuteNonQuery();


            OleDbCommand objCmdSelect2 = new OleDbCommand(@"UPDATE [Hoja1$C" + CampoConsignacion + ":C" + CampoConsignacion + "] SET F1='" + NUMEROCUENTAORIGEN + "'", objConn);
            objCmdSelect2.ExecuteNonQuery();


            OleDbCommand objCmdSelect3 = new OleDbCommand(@"UPDATE [Hoja1$D" + CampoConsignacion + ":D" + CampoConsignacion + "] SET F1='" + PRODUCTODESTINO + "'", objConn);
            objCmdSelect3.ExecuteNonQuery();


            OleDbCommand objCmdSelect4 = new OleDbCommand(@"UPDATE [Hoja1$E" + CampoConsignacion + ":E" + CampoConsignacion + "] SET F1='" + NUMEROPRODUCTODESTINO + "'", objConn);
            objCmdSelect4.ExecuteNonQuery();


            OleDbCommand objCmdSelect5 = new OleDbCommand(@"UPDATE [Hoja1$F" + CampoConsignacion + ":F" + CampoConsignacion + "] SET F1='" + TextBoxValorConsigacion.Text + "'", objConn);
            objCmdSelect5.ExecuteNonQuery();



            OleDbCommand objCmdSelect6 = new OleDbCommand(@"UPDATE [Hoja1$G" + CampoConsignacion + ":G" + CampoConsignacion + "] SET F1='" + NOMBREINVESTIGADOR + "'", objConn);
            objCmdSelect6.ExecuteNonQuery();

            OleDbCommand objCmdSelect7 = new OleDbCommand(@"UPDATE [Hoja1$H" + CampoConsignacion + ":H" + CampoConsignacion + "] SET F1='" + CEDULA + "'", objConn);
            objCmdSelect7.ExecuteNonQuery();






            objConn.Close();


            CampoConsignacion = CampoConsignacion + 1;


            Session["CampoConsignacion"] = CampoConsignacion;


            Campoarray = Campoarray + 1;

            Session["Campoarray"] = Campoarray;



            TextBoxValorConsigacion.Text = "0";
            DropDownListInvesConsigna.SelectedValue = "0";














        }












    }

    protected void ButtonDescargar_Click(object sender, EventArgs e)
    {


        Page.Response.Redirect("~/ContaCaso/Banco/"+ LabelFecha.Text + ".xls");


    }

    protected void ButtonLimpiar_Click(object sender, EventArgs e)
    {
        
        Page.Response.Redirect("~/ContaCaso/ConsignacionViaticos.aspx");

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~/ContaCaso/IngresoACuentas.aspx");



    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Page.Response.Redirect("~\\START\\Default.aspx");
    }
}