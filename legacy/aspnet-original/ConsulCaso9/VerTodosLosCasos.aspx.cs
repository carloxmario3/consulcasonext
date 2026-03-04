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

public partial class ConsulCaso9_NewVisualizadorCasos : System.Web.UI.Page
{



    ClaseContaCaso ContaCasoObject = new ClaseContaCaso();

    string NumeroDeCaso;
    string correoinvestigador;
    string idinvestigador;

    protected void Page_Load(object sender, EventArgs e)
    {



        GetUser_IP();


        NumeroDeCaso = (string)Page.RouteData.Values["casovisualNewID"];

        //correoinvestigador = Convert.ToString(System.Web.Security.Membership.GetUser());
        //idinvestigador = ContaCasoObject.obteneridinvestigador(correoinvestigador);




        if (IsPostBack)
        {
        }
        else
        {



            if (NumeroDeCaso == null)
            {


                DivBusqueda.Visible = true;




            }
            else
            {


                DivBusqueda.Visible = false;


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



    void CargarInformesNuevo()
    {

            
        string Carpeta = "Informes";

        string Records = null;


        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + NumeroDeCaso + "/Informes"));

                


        
        foreach (string filePath in filePaths)
        {


            string IDARCHIVO = ObtenerEnlace(Path.GetFileName(filePath), NumeroDeCaso, Carpeta);


            Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='Word-icon.png' style='width: 150px' /></a></td></tr>";

            
            Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";

            Records += "</table> <br />  <a href='../Condata/" + NumeroDeCaso + "/Informes/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";


           
                                    

            //Records += "</table> <br /> <a href='../ConsulCaso9/AbrirArchivos.aspxAbrir" + idinvestigador + "7A8B" + NumeroDeCaso + "7A8B" + Carpeta + "7A8B" + Path.GetFileName(filePath) + "'>VER</a> <br /><br />  <a href='https://drive.google.com/file/d/" + IDARCHIVO + "/view?usp=sharing'>VER EN LINEA</a> <br /><br /> <a href='https://drive.google.com/uc?export=download&id=" + IDARCHIVO + "'>DESCARGAR</a>	<br /><br /> </div><br />";

            PanelInformes.Controls.Add(new LiteralControl(Records));


        }

        
    }




    void CargarAnexos()
    {


        string Carpeta = "Anexos";

        string Records = null;


        

        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + NumeroDeCaso + "/Anexos"));



        foreach (string filePath in filePaths)
        {

            string IDARCHIVO = ObtenerEnlace(Path.GetFileName(filePath), NumeroDeCaso, Carpeta);
            
            Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='Adobe-Reader.png' style='width: 150px' /></a></td></tr>";


            Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";


            Records += "</table> <br />  <a href='../Condata/" + NumeroDeCaso + "/Anexos/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";



            //Records += "</table> <br /> <a href='../ConsulCaso9/AbrirArchivos.aspxAbrir" + idinvestigador + "7A8B" + NumeroDeCaso + "7A8B" + Carpeta + "7A8B" + Path.GetFileName(filePath) + "'>VER</a> <br /><br />  <a href='https://drive.google.com/file/d/" + IDARCHIVO + "/view?usp=sharing'>VER EN LINEA</a> <br /><br /> <a href='https://drive.google.com/uc?export=download&id=" + IDARCHIVO + "'>DESCARGAR</a>	<br /><br /> </div><br />";


            PanelAnexos.Controls.Add(new LiteralControl(Records));


        }


    }



    void CargarVideos()
    {


        string Carpeta = "Videos";

        string Records = null;


        
        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + NumeroDeCaso + "/Videos"));

        


        foreach (string filePath in filePaths)
        {

            string IDARCHIVO = ObtenerEnlace(Path.GetFileName(filePath), NumeroDeCaso, Carpeta);

            Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='Youtube_Icon.png' style='width: 150px' /></a></td></tr>";


            Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";


            Records += "</table> <br />  <a href='../Condata/" + NumeroDeCaso + "/Videos/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";


            //Records += "</table> <br /> <a href='../ConsulCaso9/AbrirArchivos.aspxAbrir" + idinvestigador + "7A8B" + NumeroDeCaso + "7A8B" + Carpeta + "7A8B" + Path.GetFileName(filePath) + "'>VER</a> <br /><br />  <a href='https://drive.google.com/file/d/" + IDARCHIVO + "/view?usp=sharing'>VER EN LINEA</a> <br /><br /> <a href='https://drive.google.com/uc?export=download&id=" + IDARCHIVO + "'>DESCARGAR</a>	<br /><br /> </div><br />";

            Videos.Controls.Add(new LiteralControl(Records));


        }


    }



    void CargarRecuinve()
    {


        string Carpeta = "Recuinve";

        string Records = null;


        
        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/" + NumeroDeCaso + "/Recuinve"));



        foreach (string filePath in filePaths)
        {

            
            string IDARCHIVO = "no Download";
            
            Records = "<div class='FormatoDivGrande'><table style='width:100%;'><tr><td><a><img src='WindowsUnknown.png' style='width: 150px' /></a></td></tr>";


            Records += "<tr><td>" + Path.GetFileName(filePath) + "</td> </tr>";


            Records += "</table> <br />  <a href='../Condata/" + NumeroDeCaso + "/Recuinve/" + Path.GetFileName(filePath) + "'>DESCARGAR</a> <br /><br /> </div><br />";


            //Records += "</table> <br /> <a href='../ConsulCaso9/AbrirArchivos.aspxAbrir" + idinvestigador + "7A8B" + NumeroDeCaso + "7A8B" + Carpeta + "7A8B" + Path.GetFileName(filePath) + "'>VER</a> <br /><br />  <a href='https://drive.google.com/file/d/" + IDARCHIVO + "/view?usp=sharing'>VER EN LINEA</a> <br /><br /> <a href='https://drive.google.com/uc?export=download&id=" + IDARCHIVO + "'>DESCARGAR</a>	<br /><br /> </div><br />";


            PanelRecursos.Controls.Add(new LiteralControl(Records));


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


                Records3 = "</table><br /><a href='../ContaCaso/LegalizacionCaso.aspx" + NumeroDeCaso + "'>LEGALIZACIONES</a><br /></div><br />";


                




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

                        Records1 = "<div class='FormatoDivGrande'><a href='../Condata/" + NumeroDeCaso + "/Informes/" + ValorCelda + "'><table style='width:100%;'><tr><td><a><img src='Informes.png' style='width: 150px' /></a></td></tr>";


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
                
        Page.Response.Redirect("~/ConsulCaso9/VerTodosLosCasos.aspx" + TextBox1.Text);

    }
}