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
using System.Net.Mail;

public partial class ConsulCaso9_NewVisualizadorCasos : System.Web.UI.Page
{



    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    string NumeroDeCaso;
    string correoinvestigador;
    string idinvestigador;


    string correoinvestigador25;
    string idinvestigador25;




    string COMPANIA;
    string NUMERODECASOTRAIDO;
    string ASEGURADO;
    string CIUDAD;
    string TIPODECASO;
    string INVESTIGADOR;
    string FECHAASIGNACION;
    string FECHAENTREGA;
    string CIUDADDEPART;
    string CEDULA;
    string CORREOANALISTA;




    protected void Page_Load(object sender, EventArgs e)
    {


        Label6.Text = Convert.ToString(Session["ALERTASDECASO"]);
        Session["ALERTASDECASO"] = "";


        GetUser_IP();


        NumeroDeCaso = (string)Page.RouteData.Values["casovisualNewID"];

        //correoinvestigador25 = Convert.ToString(System.Web.Security.Membership.GetUser());
        //idinvestigador25 = ContaCasoObject.obteneridinvestigador(correoinvestigador25);





        ContaCasoObject.DatosDeCasoEnvioCorreo(NumeroDeCaso, out COMPANIA, out NUMERODECASOTRAIDO, out ASEGURADO, out CIUDAD, out TIPODECASO, out INVESTIGADOR, out FECHAASIGNACION, out FECHAENTREGA, out CIUDADDEPART, out CEDULA, out CORREOANALISTA);



        TextBoxCorreo.Text = CORREOANALISTA;



        if (IsPostBack)
        {
        }
        else
        {


            //TextBoxObservaciones.Text = ContaCasoObject.TraerObservaciones(NumeroDeCaso);


            if (Roles.IsUserInRole("AreaOperativa"))
            {

                ButtonActivo.Visible = true;
                ButtonCompleto.Visible = true;
                ButtonRevisar.Visible = true;
                ButtonSusendido.Visible = true;
                ButtonFacturado.Visible = true;
                DropDownListInvestigador.Visible = true;

                ButtonPorEnviar.Visible = true;
                ButtonPagado.Visible = true;

                EnviodeInformes.Visible = false;




            }
            else
            {


                ButtonActivo.Visible = false;
                ButtonCompleto.Visible = false;
                ButtonRevisar.Visible = true;
                ButtonSusendido.Visible = false;
                ButtonFacturado.Visible = false;
                DropDownListInvestigador.Visible = false;
                Label3.Visible = false;

                ButtonPorEnviar.Visible = false;
                ButtonPagado.Visible = false;


                EnviodeInformes.Visible = false;



            }







            GridViewBitacora.EmptyDataText = "No Records Found";
            GridViewBitacora.DataSource = ContaCasoObject.BitacoraDeCaso(NumeroDeCaso);
            GridViewBitacora.DataBind();


            DropDownListInvestigador.DataSource = ContaCasoObject.CargarInvestigadores();
            DropDownListInvestigador.DataValueField = "Id_Investigador";
            DropDownListInvestigador.DataTextField = "Investigador";
            DropDownListInvestigador.DataBind();




            if (NumeroDeCaso == null)
            {



               // NumeroDeCaso = "5659";

                //idinvestigador = "31";

                /*

                if (ContaCasoObject.obtenerEstadoDeCaso(NumeroDeCaso) == "1")
                {

                    idinvestigador = ContaCasoObject.obtenerCasoAsignadoA(NumeroDeCaso);

                }
                else 
                {

                    idinvestigador = "31";

                }
                              
                */

                //CargarDatosCaso();
                //CargarInformes();
                //CargarInformesNuevo();
                //CargarAnexos();
                //CargarVideos();
                //CargarRecuinve();


                



            }
            else
            {



                idinvestigador = "31";


                /*
                if (ContaCasoObject.obtenerEstadoDeCaso(NumeroDeCaso) == "1")
                {

                    idinvestigador = ContaCasoObject.obtenerCasoAsignadoA(NumeroDeCaso);

                }
                else
                {

                    idinvestigador = "3333";

                }


                */


                CargarDatosCaso();
                //CargarInformes();
                CargarInformesNuevo();
                CargarAnexos();
                CargarVideos();
                CargarRecuinve();
               // CargarPublicados();




            }





        }

    }





    public string ObtenerEnlace(string nombrearchivo,string numerodecaso,string carpeta)
    {



        string ENLACE;
        string NUMEROENLACE;


        String strConnString = ConfigurationManager.ConnectionStrings["contacasoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_OBTENER_ENLACE";

        cmd.Parameters.Add("@NOMBREDEARCHIVO", SqlDbType.VarChar).Value = nombrearchivo;
        cmd.Parameters.Add("@NUMERODECASO", SqlDbType.VarChar).Value = numerodecaso;
        cmd.Parameters.Add("@CARPETA", SqlDbType.VarChar).Value = carpeta;


        cmd.Parameters.Add("@NUMEROENLACE", SqlDbType.BigInt);
        cmd.Parameters["@NUMEROENLACE"].Direction = ParameterDirection.Output;

        cmd.Parameters.Add("@ENLACE", SqlDbType.VarChar,50);
        cmd.Parameters["@ENLACE"].Direction = ParameterDirection.Output;


        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();

            ENLACE = cmd.Parameters["@ENLACE"].Value.ToString(); 
            NUMEROENLACE = cmd.Parameters["@NUMEROENLACE"].Value.ToString();


            con.Dispose();
        }






        if (ENLACE == "EnviaComando")
        {

            Page.Response.Redirect("~\\ConsulCaso9\\AbrirArchivos.aspxMakel" + NumeroDeCaso +"7A8B"+ NUMEROENLACE);

        }

        
               

        return ENLACE;

    }







     void GetUser_IP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        Label1.Text = "Your IP is: " + VisitorsIPAddr;

         

        
    }


    void LoadFiles(string Directorio, string Carpeta)
    {
       



        
    }



    void CargarInformesNuevo()
    {

        string Carpeta = "Informes";

        try
        {

        string Directorio = "CasosActivos";
       
        string Records = null;

        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/"+ Directorio + "/" + NumeroDeCaso + "/"+ Carpeta));
                        
        foreach (string filePath in filePaths)
        {          
            Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";            
            Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
            Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";
                                            
            PanelInformes.Controls.Add(new LiteralControl(Records));
        }


        }

        catch (Exception e)
        {
            Console.WriteLine("An error occurred: '{0}'", e);


            try
            {

                string Directorio = "SeguimientosActivos";
                
                string Records = null;

                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                foreach (string filePath in filePaths)
                {
                    Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                    Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                    Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                    PanelInformes.Controls.Add(new LiteralControl(Records));
                }


            }

            catch (Exception e2)
            {
                Console.WriteLine("An error occurred: '{0}'", e);


                try
                {

                    string Directorio = "CasosArchivados";
                    
                    string Records = null;

                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                    foreach (string filePath in filePaths)
                    {
                        Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                        Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                        Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                        PanelInformes.Controls.Add(new LiteralControl(Records));
                    }


                }

                catch (Exception e3)
                {
                    Console.WriteLine("An error occurred: '{0}'", e);





                }





            }




        }


    }




    void CargarAnexos()
    {

        string Carpeta = "Anexos";

        try
        {

            string Directorio = "CasosActivos";

            string Records = null;

            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

            foreach (string filePath in filePaths)
            {
                Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                PanelAnexos.Controls.Add(new LiteralControl(Records));
            }


        }

        catch (Exception e)
        {
            Console.WriteLine("An error occurred: '{0}'", e);


            try
            {

                string Directorio = "SeguimientosActivos";

                string Records = null;

                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                foreach (string filePath in filePaths)
                {
                    Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                    Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                    Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                    PanelAnexos.Controls.Add(new LiteralControl(Records));
                }


            }

            catch (Exception e2)
            {
                Console.WriteLine("An error occurred: '{0}'", e);


                try
                {

                    string Directorio = "CasosArchivados";

                    string Records = null;

                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                    foreach (string filePath in filePaths)
                    {
                        Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                        Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                        Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                        PanelAnexos.Controls.Add(new LiteralControl(Records));
                    }


                }

                catch (Exception e3)
                {
                    Console.WriteLine("An error occurred: '{0}'", e);





                }





            }




        }


    }



    void CargarVideos()
    {

        string Carpeta = "Videos";

        try
        {

            string Directorio = "CasosActivos";

            string Records = null;

            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

            foreach (string filePath in filePaths)
            {
                Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                Videos.Controls.Add(new LiteralControl(Records));
            }


        }

        catch (Exception e)
        {
            Console.WriteLine("An error occurred: '{0}'", e);


            try
            {

                string Directorio = "SeguimientosActivos";

                string Records = null;

                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                foreach (string filePath in filePaths)
                {
                    Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                    Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                    Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                    Videos.Controls.Add(new LiteralControl(Records));
                }


            }

            catch (Exception e2)
            {
                Console.WriteLine("An error occurred: '{0}'", e);


                try
                {

                    string Directorio = "CasosArchivados";

                    string Records = null;

                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                    foreach (string filePath in filePaths)
                    {
                        Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                        Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                        Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                        Videos.Controls.Add(new LiteralControl(Records));
                    }


                }

                catch (Exception e3)
                {
                    Console.WriteLine("An error occurred: '{0}'", e);





                }





            }




        }


    }




    void CargarRecuinve()
    {

        string Carpeta = "Recuinve";

        try
        {

            string Directorio = "CasosActivos";

            string Records = null;

            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

            foreach (string filePath in filePaths)
            {
                Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                PanelRecursos.Controls.Add(new LiteralControl(Records));
            }


        }

        catch (Exception e)
        {
            Console.WriteLine("An error occurred: '{0}'", e);


            try
            {

                string Directorio = "SeguimientosActivos";

                string Records = null;

                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                foreach (string filePath in filePaths)
                {
                    Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                    Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                    Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                    PanelRecursos.Controls.Add(new LiteralControl(Records));
                }


            }

            catch (Exception e2)
            {
                Console.WriteLine("An error occurred: '{0}'", e);


                try
                {

                    string Directorio = "CasosArchivados";

                    string Records = null;

                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                    foreach (string filePath in filePaths)
                    {
                        Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                        Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                        Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                        PanelRecursos.Controls.Add(new LiteralControl(Records));
                    }


                }

                catch (Exception e3)
                {
                    Console.WriteLine("An error occurred: '{0}'", e);





                }





            }




        }


    }





    void CargarPublicados()
    {

        string Carpeta = "Publicados";

        try
        {

            string Directorio = "CasosActivos";

            string Records = null;

            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

            foreach (string filePath in filePaths)
            {
                Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                PanelInformes.Controls.Add(new LiteralControl(Records));
            }


        }

        catch (Exception e)
        {
            Console.WriteLine("An error occurred: '{0}'", e);


            try
            {

                string Directorio = "SeguimientosActivos";

                string Records = null;

                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                foreach (string filePath in filePaths)
                {
                    Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                    Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                    Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                    PanelInformes.Controls.Add(new LiteralControl(Records));
                }


            }

            catch (Exception e2)
            {
                Console.WriteLine("An error occurred: '{0}'", e);


                try
                {

                    string Directorio = "CasosArchivados";

                    string Records = null;

                    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta));

                    foreach (string filePath in filePaths)
                    {
                        Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='any.png' style='width: 50px' /></a></td></tr>";
                        Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";
                        Records += "</table> <br />  <a href='../Condata/" + Directorio + "/" + NumeroDeCaso + "/" + Carpeta + "/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";

                        PanelInformes.Controls.Add(new LiteralControl(Records));
                    }


                }

                catch (Exception e3)
                {
                    Console.WriteLine("An error occurred: '{0}'", e);





                }





            }




        }


    }







    void CargarDatosCaso()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LEER_DATOS_CASO";
        cmd.Parameters.Add("@NUMEROCASO", SqlDbType.BigInt).Value = NumeroDeCaso;
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


                    Records2 += "<tr><td><B>" + Reader.GetValue(i) + "</B></td> </tr>";


                    // Panel1.Controls.Add(new LiteralControl(yourHTMLstring));

                    if (ColumnaNumero == 0)
                    {

                        Records1 = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='../Condata/CasosAsignados/" + idinvestigador + "/" +ValorCelda + "/Fotos/0.jpg' onerror=this.onerror=null;this.src='0.jpg' style='width: 200px' /></td></tr>";

                    }






                }



                if (Roles.IsUserInRole("AreaOperativa"))
                {

                    Records3 = "</table><br /><a target='_blank' href='https://drive.google.com/drive/folders/1gQnvKriHzQNERPY8dAcehIBiYBiTb_Lf'><h1>VER CARPETA</h1></a><br /><br /><a href='../ContaCaso/imprimir/Marcarpetas.aspx" + NumeroDeCaso + "'>MARCARPETA</a>";

                }
                else {


                    Records3 = "</table><br /><a target='_blank' href='https://drive.google.com/drive/folders/1gQnvKriHzQNERPY8dAcehIBiYBiTb_Lf'><h1>VER CARPETA</h1></a><br /><br /><a href='../ContaCaso/imprimir/Marcarpetas.aspx" + NumeroDeCaso + "'>MARCARPETA</a>";


                }








                Records = Records + Records1 + Records2 + Records3;

                Records1 = "";
                Records2 = "";

                RecordCount += 1;
            }


            //Label_TotalLegalizacion.Text = RecordCount + "Records processed:" + Records;

            PanelInformacion.Controls.Add(new LiteralControl(Records));


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







    void CargarInformes()
    {



        String strConnString = ConfigurationManager.ConnectionStrings["ConsulCaso9ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "SP_LEER_INFORMES";
        cmd.Parameters.Add("@NUMEROCASO", SqlDbType.BigInt).Value = NumeroDeCaso;
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


                    if (ColumnaNumero == 2)
                    {

                        Records2 += "<tr><td>Informe " + Reader.GetValue(i) + "</td> </tr>";


                    }



                    if (ColumnaNumero == 3)
                    {

                        Records2 += "<tr><td>" + Reader.GetValue(i) + "</td> </tr>";


                    }



                    // Panel1.Controls.Add(new LiteralControl(yourHTMLstring));

                    if (ColumnaNumero == 1)
                    {

                        Records1 = "<div class='FormatoDivGrande'><a href='../Condata/" + NumeroDeCaso + "/Informes/" + ValorCelda + "'><table style='width:100%;'><tr><td><a><img src='Informes.png' style='width: 50px' /></a></td></tr>";


                    }









                }


                Records3 = "</table></a></div><br />";





                Records = Records + Records1 + Records2 + Records3;

                Records1 = "";
                Records2 = "";

                RecordCount += 1;
            }


            //Label_TotalLegalizacion.Text = RecordCount + "Records processed:" + Records;

            PanelInformes.Controls.Add(new LiteralControl(Records));


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





    protected void Button1_Click(object sender, EventArgs e)
    {


        idinvestigador25 = ContaCasoObject.obtenerCasoAsignadoA(NumeroDeCaso);




        if (idinvestigador25 == "")
        {

            idinvestigador25 = "31";

        }





        ContaCasoObject.InsertarBitacora(NumeroDeCaso, TextBox1.Text, Convert.ToInt32(idinvestigador25));


        





        string htmlBody;
        htmlBody = "EVENTO: <br /><br />" + TextBox1.Text + " <br /><br /> Buen Día: <br /><br /> Se ha creado un nuevo evento en la bitácora de la presente investigación:  <br /><br /> Numero De Caso : " + NUMERODECASOTRAIDO + "<br /> Afiliado : " + ASEGURADO + "<br /> Documento : " + CEDULA + "<br /><br /> Siga el siguiente vinculo para ver todos los eventos de la presente investigación <br /><br />" + "http://www.consultandoweb.com/ConsulCaso9/NewVisualizadorCasos.aspx" + NUMERODECASOTRAIDO + "<br /><br /> Cordialmente <br /> CONSULTANDO LTDA <br /><br /> ";


        string CORREOINVESTIGADOR = ContaCasoObject.ObtenerCorreoInvestigador(idinvestigador25);


        EnviarCorreo(CORREOINVESTIGADOR, "NUEVO EVENTO "+ INVESTIGADOR + " CASO: " + NUMERODECASOTRAIDO + " AFILIADO: " + ASEGURADO, htmlBody);

        Session["ALERTASDECASO"] = "NUEVO EVENTO CREADO EN BITACORA INVESTIGADOR" + INVESTIGADOR + " SE ENVIO CORREO A " + CORREOINVESTIGADOR;



        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);




    }

    protected void DropDownListInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {

                
        ContaCasoObject.ActualizarAsignacionInvestigador(NumeroDeCaso, DropDownListInvestigador.SelectedValue);



        ContaCasoObject.InsertarBitacora(NumeroDeCaso, "CASO ASIGNADO AL INVESTIGADOR", Convert.ToInt32(DropDownListInvestigador.SelectedValue));


        string htmlBody;
        htmlBody = " Buen Día: <br /><br /> A continuación, le informamos que le ha sido asignada la siguiente investigación  <br /><br /> Numero De Caso : " + NUMERODECASOTRAIDO + "<br /> Afiliado : " + ASEGURADO + "<br /> Documento : " + CEDULA + "<br /><br /> Siga el siguiente vinculo para descargar los documentos necesarios para realizar la investigación <br /><br />" + "http://www.consultandoweb.com/ConsulCaso9/NewVisualizadorCasos.aspx"+ NUMERODECASOTRAIDO + "<br /><br /> Cordialmente <br /> CONSULTANDO LTDA <br /><br /> ";


        string CORREOINVESTIGADOR = ContaCasoObject.ObtenerCorreoInvestigador(DropDownListInvestigador.SelectedValue);


        EnviarCorreo(CORREOINVESTIGADOR, "CASO ASIGNADO A " + DropDownListInvestigador.SelectedItem.Text + " : " + NUMERODECASOTRAIDO + " AFILIADO: " + ASEGURADO, htmlBody);

        Session["ALERTASDECASO"] = "CASO ASIGNADO EXITOSAMENTE A " + DropDownListInvestigador.SelectedItem.Text + " SE ENVIO CORREO A " + CORREOINVESTIGADOR;




        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);




    }

    protected void ButtonActivo_Click(object sender, EventArgs e)
    {


        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 1);



        // DirectoryCopy( Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + NumeroDeCaso) , Path.Combine(Request.PhysicalApplicationPath, "Condata\\Dropbox\\" + NumeroDeCaso), true);



        //DeleteDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + NumeroDeCaso));

                
        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS ASIGNADOS)" ;
        
        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);


    }

    protected void ButtonCompleto_Click(object sender, EventArgs e)
    {


        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 2);

        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS COMPLETOS POR FACTURAR)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);




    }

    protected void ButtonRevisar_Click(object sender, EventArgs e)
    {




        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 5);


        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS POR REVISAR)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);


        
    }

    protected void ButtonSusendido_Click(object sender, EventArgs e)
    {

        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 3);

        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS SUSPENDIDOS)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);



    }

    protected void ButtonFacturado_Click(object sender, EventArgs e)
    {

        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 4);

        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS FACTURADOS)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);



    }

    protected void ButtonPagado_Click(object sender, EventArgs e)
    {


        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 6);




        // System.IO.File.Copy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Dropbox\\Formatos\\PADRES\\PlantillaPadres.docx"), Path.Combine(Request.PhysicalApplicationPath, "Condata\\Dropbox\\" + NumeroDeCaso)   );

        //DirectoryCopy(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Dropbox\\" + NumeroDeCaso), Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + NumeroDeCaso), true);



        // DeleteDirectory(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Dropbox\\" + NumeroDeCaso));


        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS PAGADOS)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);




    }



    public static void DeleteDirectory(string target_dir)
    {
        string[] files = Directory.GetFiles(target_dir);
        string[] dirs = Directory.GetDirectories(target_dir);

        foreach (string file in files)
        {
            File.SetAttributes(file, FileAttributes.Normal);
            File.Delete(file);
        }

        foreach (string dir in dirs)
        {
            DeleteDirectory(dir);
        }

        Directory.Delete(target_dir, false);
    }



    private static void DirectoryCopy(string sourceDirName, string destDirName, bool copySubDirs)
    {
        // Get the subdirectories for the specified directory.
        DirectoryInfo dir = new DirectoryInfo(sourceDirName);
        DirectoryInfo[] dirs = dir.GetDirectories();

        if (!dir.Exists)
        {
            throw new DirectoryNotFoundException(
                "Source directory does not exist or could not be found: "
                + sourceDirName);
        }

        // If the destination directory doesn't exist, create it. 
        if (!Directory.Exists(destDirName))
        {
            Directory.CreateDirectory(destDirName);
        }

        // Get the files in the directory and copy them to the new location.
        FileInfo[] files = dir.GetFiles();
        foreach (FileInfo file in files)
        {
            string temppath = Path.Combine(destDirName, file.Name);
            file.CopyTo(temppath, false);
        }

        // If copying subdirectories, copy them and their contents to new location. 
        if (copySubDirs)
        {
            foreach (DirectoryInfo subdir in dirs)
            {
                string temppath = Path.Combine(destDirName, subdir.Name);
                DirectoryCopy(subdir.FullName, temppath, copySubDirs);
            }
        }
    }




    protected void ButtonPorEnviar_Click(object sender, EventArgs e)
    {


        ContaCasoObject.ActualzarEstado(NumeroDeCaso, 7);


        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE CASOS POR ENVIAR)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);






    }





    void EnviarCorreo(string CORREO ,string ASUNTO, string MENSAJE)
    {



        try
        {


            SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
            var mail = new MailMessage();
            mail.From = new MailAddress("consultandoltda@hotmail.com");
            
            
            mail.To.Add(CORREO);
            mail.To.Add("consultando@consultandoweb.com");

            mail.Subject = ASUNTO;

            mail.IsBodyHtml = true;
                                    
            mail.Body = MENSAJE;     
            

            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential("consultandoltda@hotmail.com", "61RPG6rbb14saj1q");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);

        }

        catch (Exception err)
        {            
           // Label6.Text = Convert.ToString(err);
        }


    }






    protected void Button2_Click(object sender, EventArgs e)
    {





        


                        


        try
        {



        SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
        var mail = new MailMessage();
        mail.From = new MailAddress("consultandoltda@hotmail.com");


            mail.To.Add("carloxmario3@gmail.com");

            mail.To.Add("consultandoltda@hotmail.com");
            //mail.To.Add("consultando@consultandoweb.com");

            //    mail.To.Add(TextBoxCorreo.Text);


            mail.Subject = "INFORME AFILIADO " + ASEGURADO;

        mail.IsBodyHtml = true;
        string htmlBody;
        htmlBody = " Respetados Señores: <br /><br /> Adjunto estamos enviando el informe y los anexos correspondientes a la presente investigación  <br /><br /> Numero De Caso : " + NUMERODECASOTRAIDO + "<br /> Afiliado : " + ASEGURADO + "<br /> Documento : " + CEDULA + "<br /><br /> Cordialmente <br /> CONSULTANDO LTDA <br /><br /> " + TextBoxContenidoCorreo.Text;


        
            

            mail.Body = htmlBody;


            /*

        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/Dropbox/" + NumeroDeCaso + "/Publicado"));



        foreach (string filePath in filePaths)
        {

         
            mail.Attachments.Add(new Attachment(Path.Combine(Request.PhysicalApplicationPath, "Condata\\Dropbox\\" + NumeroDeCaso + "\\Publicado\\" + Path.GetFileName(filePath))));


        }


    */

      


        
        SmtpServer.Port = 587;
        SmtpServer.UseDefaultCredentials = false;
        SmtpServer.Credentials = new System.Net.NetworkCredential("consultandoltda@hotmail.com", "61RPG6rbb14saj1q");
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);





      





        }

        catch (Exception err)
        {



            Label4.Text = Convert.ToString(err);

        }




        //Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);







    }

    protected void ButtonActualizar_Click(object sender, EventArgs e)
    {

       // ContaCasoObject.ACTUALZAR_OBSERVACION(NumeroDeCaso, TextBoxObservaciones.Text);


        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);

    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //Page.Response.Redirect("~\\ConsulCaso9\\PanelDeControlSimple.aspx");
        Response.Redirect(Request.UrlReferrer.ToString());
    }

    protected void ButtonSI_Click(object sender, EventArgs e)
    {
        ContaCasoObject.ActualzarLaborales(NumeroDeCaso, 1);
        LabeLMensajeLaboral.Text = "Caso Actualizado";


        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO  AHORA SE ENCUENTRA EN LA (LISTA DE PENDIENTES LABORALES)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);



    }

    protected void ButtonNO_Click(object sender, EventArgs e)
    {
        ContaCasoObject.ActualzarLaborales(NumeroDeCaso, 0);
        LabeLMensajeLaboral.Text = "Caso Actualizado";


        Session["ALERTASDECASO"] = "CAMBIO DE ESTADO CORRECTO AHORA ESTE CASO YA NO SE ENCUENTRA EN LA (LISTA DE PENDIENTES LABORALES)";

        Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + NumeroDeCaso);

    }
}