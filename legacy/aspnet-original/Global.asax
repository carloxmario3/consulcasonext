<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {

        System.Web.Routing.RouteTable.Routes.MapPageRoute("Marcarpeta", "ContaCaso/imprimir/Marcarpetas.aspx{NumeroCasoMarcarpeta}", "~/ContaCaso/imprimir/Marcarpetas.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("AbrirCarpeta", "ContaCaso/imprimir/AbrirCarpeta.aspx{NumeroCasoAbrirCarpeta}", "~/ContaCaso/imprimir/AbrirCarpeta.aspx");

              

        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevosCasos","nuevocaso/{casoID}", "~/Contenidos/NuevoCasoPage.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("informacionlaboral", "infolaboral/{infoID}", "~/Contenidos/InfoLaboralPage.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("Visualizador", "VisualizadorDeCasos.aspx{casovisualID}punto{anclaID}", "~/VisualizadorDeCasos.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("VerTodosLosCasos", "ConsulCaso9/VerTodosLosCasos.aspx{casovisualNewID}", "~/ConsulCaso9/VerTodosLosCasos.aspx");
                
        
        
        System.Web.Routing.RouteTable.Routes.MapPageRoute("NewVisualizadorCasos", "ConsulCaso9/NewVisualizadorCasos.aspx{casovisualNewID}", "~/ConsulCaso9/NewVisualizadorCasos.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("AbrirArchivos", "ConsulCaso9/AbrirArchivos.aspx{NombreFilexx}", "~/ConsulCaso9/AbrirArchivos.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("LegalizacionCaso", "ContaCaso/LegalizacionCaso.aspx{NumeroCasoLegalizaciones}", "~/ContaCaso/LegalizacionCaso.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("FaturacionCaso", "ContaCaso/Facturacion/FacturacionCaso.aspx{NumeroCasoFactura}", "~/ContaCaso/Facturacion/FacturacionCaso.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevaLegalizacion", "ContaCaso/NuevaLegalizacion.aspx{NumeroCasoNuevale}y{Idlegalizaok}", "~/ContaCaso/NuevaLegalizacion.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("ImprimirLegalizacion", "ContaCaso/imprimir/ImprimirLegalizacion.aspx{NumeroCasoNuevale}y{Idlegalizaok}", "~/ContaCaso/imprimir/ImprimirLegalizacion.aspx");
        
        
        
        System.Web.Routing.RouteTable.Routes.MapPageRoute("GastosInvestigacion", "ContaCaso/GastosInvestigacion.aspx{NumeroCasoGastos}", "~/ContaCaso/GastosInvestigacion.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("FacturacionIndividual", "ContaCaso/Facturacion/FacturacionIndividual.aspx{NumeroCasoFacturacion}y{NumeroDeFacturaPa}", "~/ContaCaso/Facturacion/FacturacionIndividual.aspx");
        

        System.Web.Routing.RouteTable.Routes.MapPageRoute("FacturacioMultiple", "ContaCaso/Facturacion/FacturacioMultiple.aspx{NumeroDeFacturaPa2}", "~/ContaCaso/Facturacion/FacturacioMultiple.aspx");
        

        // System.Web.Routing.RouteTable.Routes.MapPageRoute("ListaDeCasos", "ListaDeCasos/{listaID}", "~/ListaDeCasosPage.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("ListaDeInformes", "ListaDeInformes/{ingresoID}", "~/InformesPage.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("RevisorDeCasos", "RevisorCasosPage.aspx{tipoID}punto{ancla2ID}", "~/RevisorCasosPage.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevoAnexo", "NuevoAnexo/{actuID}", "~/Documentacion/NuevoAnexo.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevoRecurso", "NuevoRecurso/{recuirID}", "~/Documentacion/NuevoRecurso.aspx");
       
        System.Web.Routing.RouteTable.Routes.MapPageRoute("Nuevoinforme", "Nuevoinforme/{inforsID}", "~/Documentacion/NuevoInforme.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevoVideo", "NuevoVideo/{videID}", "~/Multimedia/VideosPageOk.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevaFoto", "NuevaFoto/{fotofID}", "~/Multimedia/NuevasFotos.aspx");


        System.Web.Routing.RouteTable.Routes.MapPageRoute("NuevoPublicado", "NuevoPublicado/{nuevopubID}", "~/Documentacion/InformesPublicadosNuevos.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("Resumenes", "Resumenes/{nuevoresID}", "~/Contenidos/ResumenesPage.aspx");

        System.Web.Routing.RouteTable.Routes.MapPageRoute("Usuarios", "Usuarios/{UsuariosxID}", "~/Administracion/UsuariosPage.aspx");
        
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Código que se ejecuta cuando se cierra la aplicación

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Código que se ejecuta al producirse un error no controlado

    }

    void Session_Start(object sender, EventArgs e) 
    {
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

        Session["estadoderesumeninformes"] = "";

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
        
        
        // asignaciones

        Session["tb_nombre"] = "nombre";
        Session["tb_apellido"] = "apellido";
        Session["tb_cedula"] = "1111";
        Session["TextBox1"] = "observaciones";


        // citas seguimientosdecasos

        Session["fechacitas"] = "";
        
        
        // Capacitaciones


        Session["capacitavideo"] = "Bienvenido.mp4";


        Session["usuariocapacita"] = "";

        Session["pruebahtml"] = "<div class='titulos'>   modificado ok   </div> <br/>";
                
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Código que se ejecuta cuando finaliza una sesión. 
        // Nota: El evento Session_End se desencadena sólo con el modo sessionstate
        // se establece como InProc en el archivo Web.config. Si el modo de sesión se establece como StateServer 
        // o SQLServer, el evento no se genera.

    }
       
</script>
