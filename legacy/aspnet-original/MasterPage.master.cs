using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        string var1 = Convert.ToString(Session["tipodecaso"]);

        string var2 = Convert.ToString(Session["vermenu"]);
       

      

        if (Roles.IsUserInRole("Analista") )
        
        {
            Label1.Text = "Analista";
            


          

                MenuAnalistas.Visible = true;


         




            if (var1 == "Padres")
            {

               
                //MenuAnalista();

            }

            if (var1 == "Compa&#241;era")
            {
                
                //MenuAnalista();
            }

            if (var1 == "Conyuge")
            {
                
                //MenuAnalista();
            }

            if (var1 == "Arp")
            {

               
                //MenuAnalista();

            }


            if (var1 == "Seguimiento")
            {

               
                
                //MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

                //MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

                //MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

                //MenuCasos.Items.Add(new MenuItem("Citas Seguimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaSeguimiento" + "#AnclaSeguimiento"));

               // MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

               // MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

                //MenuCasos.Items.Add(new MenuItem("Videos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo"));

               // MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

                //MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));
                       

            }


        }

        if (Roles.IsUserInRole("JefeAnalista") )
        
        {
            Label1.Text = "JefeAnalista";
            

          

                MenuJefeAnalistas.Visible = true;


           


            if (var1 == "Padres")
            {
               

                //MenuJefeAnalista();

            }

            if (var1 == "Compa&#241;era")
            {
               
                //MenuJefeAnalista();

            }

            if (var1 == "Conyuge")
            {

               
                //MenuJefeAnalista();
            }

            if (var1 == "Arp")
            {
               
                //MenuJefeAnalista();

            }


            if (var1 == "Seguimiento")
            {


               

                //MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

                //MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

                //MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

                //MenuCasos.Items.Add(new MenuItem("Citas Seguimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaSeguimiento" + "#AnclaSeguimiento"));

                // MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

                // MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

                //MenuCasos.Items.Add(new MenuItem("Videos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo"));

                // MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

                //MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));
                      

            }
        }

        if (Roles.IsUserInRole("AreaOperativa"))

        {
            Label1.Text = "AreaOperativa";



            

                MenuAreaOperativa.Visible = true;


            
           

            if (var1 == "Padres")
            {

              
                //MenuAreaoperativa();
               

            }

            if (var1 == "Compañera")
            {

                
                //MenuAreaoperativa();
                
              
            }

            if (var1 == "Conyuge")
            {
                
                //MenuAreaoperativa();
                

            }

            if (var1 == "Arp")
            {
                
                //MenuAreaoperativa();
                
                
            }


            if (var1 == "Seguimiento")
            {

                
                //MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

                //MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

                //MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

                //MenuCasos.Items.Add(new MenuItem("Citas Seguimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaSeguimiento" + "#AnclaSeguimiento"));

                //MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

                //MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

                //MenuCasos.Items.Add(new MenuItem("Videos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo"));

                //MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

                //MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));
                       
            }

        }


        if (Roles.IsUserInRole("Investigador"))
        {
            Label1.Text = "Investigador";


            
                MenuInvestigadores.Visible = true;
            


            if (var1 == "Padres")
            {
                
                //MenuInvestigador();

            }

            if (var1 == "Compañera")
            {

               
                //MenuInvestigador();

            }

            if (var1 == "Conyuge")
            {
                
                //MenuInvestigador();

            }

            if (var1 == "Arp")
            {
                
                //MenuInvestigador();

            }


            if (var1 == "Seguimiento")
            {

               
                //MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

                //MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

                //MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

                //MenuCasos.Items.Add(new MenuItem("Citas Seguimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaSeguimiento" + "#AnclaSeguimiento"));

                //MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

                //MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

                //MenuCasos.Items.Add(new MenuItem("Videos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaVideo" + "#AnclaVideo"));

                //MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

                //MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));
                       

            }




        }


        //Session["tipodecaso"] = "";

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
      





        // Resetea todas las variables de inicio de sesion --------------------------------------------------------------


        // Código que se ejecuta cuando se inicia una nueva sesión

        //Variables De Lista de caso

        Session["estadorevicasos"] = "";

        //Variables DeInformes Page

        Session["estadoreviinformes"] = "";


        //Variables De Tipo De Caso

        Session["tipodecaso"] = "";


        //ClientesPage Variables

        Session["nombrecliente"] = "%";


        //DepartamentosPage Variables


        Session["departamento"] = "1";

        //OficinasPage Variables

        Session["idcliente"] = "";
        Session["nombreclienteoficina"] = "";

        //AnalistasPage Variables

        Session["codigooficina"] = "";
        Session["ciudad"] = "";

        //Usuarios Page variables

        Session["nombredeusuario"] = "";

        //NuevosCasos Page variables

        Session["ComboIdCompania"] = "";

        Session["ComboIdOficina"] = "";

        Session["NumeroDeCaso"] = "";

        Session["casonuevo"] = "";


        // Numero de informe para Fotos Videos y Anexos

        Session["NumeroDeInforme"] = "";


        //informacion laboral





        Session["identifiafiliado"] = "";
        Session["identifireclamantes"] = "";

        //videospge

        Session["rutavideo"] = "";


        //visualizacion de caso

        Session["anclona"] = "";

        Session["vermenu"] = "si";


        //Revisor de Casos

        Session["anclona2"] = "";

        Session["estadodocumentoss"] = "";

        Session["revisordecasossi"] = "";

        Session["revisordecasoretorno"] = "";


        //Nuevo Anexo

        Session["codigoanexoo"] = "";

        // nuevo recuinve

        Session["codigorecuinve"] = "";

        // nuevo Informe

        Session["codigoinforme"] = "";

        // nuevo video

        Session["codigovideo"] = "";
        Session["vervideo"] = "";


        // nuevo video

        Session["Verfoto"] = "";
        Session["codigofotoa"] = "";


        // nuevo publicado

        Session["Verpublicado"] = "";
        Session["codigopublicado"] = "";


        // resumenes de caso

        Session["codigoresumen"] = "";

        Session["estadoresumen567"] = "";

        Session["investigadorresumenes"] = "";


        // asignador de casos


        Session["estadodecasoaa"] = "";

        Session["asignadoaa"] = "31";


        // cambiar estado

        Session["estadocaso"] = "1";

        // lista de casos page

        Session["cedulalista"] = "%";


        Session["afiliadolista"] = "%";


        Session["estadocasolistade"] = "1";


        Session["investigadorlista"] = "";

        Session["analistalista"] = "";



        Session["aseguradora56"] = "";

        Session["iddeoficinaaa"] = "";


        Session["analista222"] = "%";

        Session["estadoderesumen45"] = "";

        Session["tipodecasorevisor"] = "";

        Session["investigadorrevicion"] = "";

        // busquedas ok

        Session["busquedasnumerodecaso"] = "";

        Session["busquedasafiliado"] = "";

        Session["busquedasafiliadocedula"] = "";


        Session["busquedasReclamante"] = "";

        Session["busquedasReclamantecedula"] = "";


        Session["busquedasEmpresa"] = "";

        // Filtro por cliente

        Session["filtroclientenombre"] = "";


        Session["filtroclienteEstado"] = "";



        Session["filtroInvestigadorNombre"] = "";


        Session["filtroInvestigadorEstado"] = "";









        FormsAuthentication.SignOut();
        Response.Redirect("~/Login.aspx");





    }
    protected void MenuInveOper1_MenuItemClick(object sender, MenuEventArgs e)
    {
        

    }



    


    public void MenuAreaoperativa()
    {

        MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

        MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

        MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));
        
        MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

        MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

        MenuCasos.Items.Add(new MenuItem("Fotos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaFotos" + "#AnclaFotos"));

        MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));
        
        MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));
        
        MenuCasos.Items.Add(new MenuItem("Detalles Fallecimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDfallecimiento" + "#AnclaDfallecimiento"));
        
        MenuCasos.Items.Add(new MenuItem("Reclamantes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaReclamantes" + "#AnclaReclamantes"));
        
               
        

      

    }

  


      


  


    public void MenuInvestigador()
    {

        MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

        MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

        MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

        MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

        MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

        MenuCasos.Items.Add(new MenuItem("Fotos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaFotos" + "#AnclaFotos"));

        MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

        MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));

        MenuCasos.Items.Add(new MenuItem("Detalles Fallecimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDfallecimiento" + "#AnclaDfallecimiento"));

        MenuCasos.Items.Add(new MenuItem("Reclamantes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaReclamantes" + "#AnclaReclamantes"));
        


    }

    public void MenuAnalista() 
        
    {
        MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

        MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

        MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

       // MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

       // MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

        MenuCasos.Items.Add(new MenuItem("Fotos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaFotos" + "#AnclaFotos"));

       // MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

        MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));

        MenuCasos.Items.Add(new MenuItem("Detalles Fallecimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDfallecimiento" + "#AnclaDfallecimiento"));

        MenuCasos.Items.Add(new MenuItem("Reclamantes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaReclamantes" + "#AnclaReclamantes"));
        
               
        
    
    
    }


    public void MenuJefeAnalista()
    {
        MenuCasos.Items.Add(new MenuItem("Detalles De Caso", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDcaso" + "#AnclaDcaso"));

        MenuCasos.Items.Add(new MenuItem("Informes Publicados", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "Anclainfop" + "#Anclainfop"));

        MenuCasos.Items.Add(new MenuItem("Resumenes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaResumenes" + "#AnclaResumenes"));

        // MenuCasos.Items.Add(new MenuItem("Informes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaInformes" + "#AnclaInformes"));

        // MenuCasos.Items.Add(new MenuItem("Anexos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaAnexos" + "#AnclaAnexos"));

        MenuCasos.Items.Add(new MenuItem("Fotos", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaFotos" + "#AnclaFotos"));

        // MenuCasos.Items.Add(new MenuItem("Recusos Investigador", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaRinvestigador" + "#AnclaRinvestigador"));

        MenuCasos.Items.Add(new MenuItem("Detalles Afiliado", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDafiliado" + "#AnclaDafiliado"));

        MenuCasos.Items.Add(new MenuItem("Detalles Fallecimiento", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDfallecimiento" + "#AnclaDfallecimiento"));

        MenuCasos.Items.Add(new MenuItem("Reclamantes", "1", "", "~/VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaReclamantes" + "#AnclaReclamantes"));





    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~\\Default.aspx");  
    }
}
