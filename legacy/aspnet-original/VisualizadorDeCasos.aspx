<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="VisualizadorDeCasos.aspx.cs" Inherits="VisualizadorDeCasos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
    
    
    
    
    <script type='text/javascript' src='jwplayer.js'></script> 

 

      <script type="text/javascript">


          function mifuncion() 
          
          {

             
                           

              document.location.href = "<%Response.Write(anclita());%>";



          }

          mifuncion();


         
        
        </script>
        


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<%--Needed for JavaScript IntelliSense in VS2010--%>
			<%--For VS2008 replace RadScriptManager with ScriptManager--%>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>
	<script type="text/javascript">
	    //Put your Java Script code here.
    </script>
	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
	</telerik:RadAjaxManager>
	
    

 





    <script type="text/javascript">
        //<![CDATA[
        function openWin() {
            var oWnd = radopen("Contenidos/InfoFallecimientoPage.aspx", "RadWindow1");
        }

        function OnClientClose(oWnd, args) {
            //get the transferred arguments
            var arg = args.get_argument();

            if (arg) {
                var cityName = arg.cityName;
                var seldate = arg.selDate;

                //$get("order").innerHTML = "You chose to fly to <strong>" + cityName + "</strong> on <strong>" + seldate + "</strong>";




                location.reload();
                    
                                    
                
                  //  window.navigate("<%Response.Write(fallecimiento());%>");

                
                

                

            }
        }
        //]]>
    </script>


    
   <telerik:RadWindowManager ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
        ReloadOnShow="true" runat="server" Skin="Sunset">
        <Windows>
            <telerik:RadWindow ID="RadWindow1" Behaviors="Close" OnClientClose="OnClientClose" Width="850" Height="445" Modal="true"
                NavigateUrl="InfoFallecimientoPage.aspx">
            </telerik:RadWindow>
            
        </Windows>
    </telerik:RadWindowManager>
  
  
    <div align="center">

  



        <asp:Label ID="lb_ncaso0" runat="server" CssClass="titulos">Misión</asp:Label>



    &nbsp;
        <asp:Label ID="lb_ncaso" runat="server" CssClass="titulos"></asp:Label>



   
        



   
      



   
        



   
        <br />



   
        



   
      



   
        



   
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True" NavigateUrl="~/ListaDeCasosPage.aspx">Atras</asp:HyperLink>
        

     

       

      

        
                  <div align="center">
    <asp:Panel ID="pn_Video" runat="server" Visible="False">
        <div align="center" style="margin-left: 40px">
    
  <script runat="server">
       string mivar;
       string enlace()
       {



           mivar = System.Web.Configuration.WebConfigurationManager.AppSettings["RutaPagina"] + "/Condata/" + Convert.ToString(Session["NumeroDeCaso"]) + "/Videos/" ;

           return mivar;
            
       }

       string mivar85;
       
      string fallecimiento()
       {



           mivar85 = "VisualizadorDeCasos.aspx" + Convert.ToString(Session["NumeroDeCaso"]) + "punto" + "AnclaDfallecimiento" + "#AnclaDfallecimiento";

           return mivar85;

       }

       string mivar2;
       string anclita()
       {



           mivar2 = "#" + Convert.ToString(Session["anclona"]);

           return mivar2;

       }




       string mivar3;

       string videoexiste(ref int infon)
       {

           if (System.IO.File.Exists(System.IO.Path.Combine(Request.PhysicalApplicationPath, "Condata\\" + Convert.ToString(Session["NumeroDeCaso"]) + "\\Videos\\" + infon + ".mp4")))
           {
               infon = infon + 1;
               
               mivar3 = "Video " + Convert.ToString(infon);

           }

           else 
           
           {

               mivar3 = "";
           
           }
           
           return mivar3;
           
           
           

       }
      
      
      
   </script>



        <a name="AnclaVideo"></a>
            

    	    <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -->
	<!-- END OF THE PLAYER EMBEDDING -->
	
            <div ID="mediaplayer">
            </div>
	
          <script type="text/javascript">
    jwplayer('mediaplayer').setup({
        'flashplayer': 'player.swf',
        'id': 'playerID',
        'width': '680',
        'height': '330',
        'skin': 'whotube.zip',
        'screencolor': '000000',
        'playlist.position': 'right',
        'playlist.size': '100',
        'playlist': [
        {
            'file': '<%Response.Write(enlace());%>0.mp4',
            'title': '<% int cero = 0; Response.Write(videoexiste(ref cero));%>',
            'provider': 'http',
            

        },
        {
            'file': '<%Response.Write(enlace());%>1.mp4',
            'title': '<% int uno = 1; Response.Write(videoexiste(ref uno));%>',
            'provider': 'http',
            

        },
        {
            'file': '<%Response.Write(enlace());%>2.mp4',
            'title': '<% int dos = 2; Response.Write(videoexiste(ref dos));%>',
            'provider': 'http',
            
        },
        {
            'file': '<%Response.Write(enlace());%>3.mp4',
            'title': '<% int tres = 3; Response.Write(videoexiste(ref tres));%>',
            'provider': 'http',
            
        }
    ]
    }); 
</script>

            
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Actualizar Videos" 
                Visible="False" />
            
	
    </div>
    </asp:Panel>

    </div>
               
       
                <div align="center">

     <asp:Panel ID="pn_Informes" runat="server" BackColor="#FFCC00" Visible="False">
         <asp:Label ID="Label10" runat="server" CssClass="titulos" Text="Informes"></asp:Label>
         <a name="AnclaInformes"></a>
        <br />
         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Id_informe" DataSourceID="SqlDataSource20" 
             EmptyDataText="No hay registros de datos para mostrar." 
             onrowcommand="GridView3_RowCommand" CellPadding="4" ForeColor="#333333">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:Button ID="AddButton3" runat="server" 
                             CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                             CommandName="VerAnexo" Text="Ver" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="Id_informe" HeaderText="Codigo Informe" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_informe" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                     SortExpression="Id_numero_de_Caso" />
                 <asp:BoundField DataField="Ruta_word" HeaderText="Archivo" 
                     SortExpression="Ruta_word" />
                 <asp:BoundField DataField="Nombre" HeaderText="Tipo De Informe" 
                     SortExpression="Nombre" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Expr1" HeaderText="Estado Informe" 
                     SortExpression="Expr1" >
                 
                 <ItemStyle Font-Bold="True" ForeColor="#0066FF" />
                 </asp:BoundField>
                 
                 <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Actualizara" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="ActualizarAnexo" Text="Actualizar" />
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Corregir" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="Corregir" Text="Corregir" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Revisar" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="Revisar" Text="Revisar" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Publicar" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="Publicar" Text="Publicar" />
                                </ItemTemplate>
                            </asp:TemplateField>

             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource20" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_informes] WHERE [Id_informe] = @Id_informe" 
             InsertCommand="INSERT INTO [Tabla_informes] ([Id_tipoinforme], [Id_numero_de_Caso], [Ruta_Pdf], [Ruta_word], [Id_estadodocus]) VALUES (@Id_tipoinforme, @Id_numero_de_Caso, @Ruta_Pdf, @Ruta_word, @Id_estadodocus)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_informes.Id_informe, Tabla_informes.Id_numero_de_Caso, Tabla_informes.Ruta_word, Tabla_Tipodeinforme.Nombre, Tabla_estadodocus.Nombre AS Expr1 FROM Tabla_informes INNER JOIN Tabla_Tipodeinforme ON Tabla_informes.Id_tipoinforme = Tabla_Tipodeinforme.Id_tipoinforme INNER JOIN Tabla_estadodocus ON Tabla_informes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_informes.Id_numero_de_Caso = @sdfs) AND (Tabla_estadodocus.Nombre LIKE '%' + @estadoo43 + '%')" 
             
             UpdateCommand="UPDATE [Tabla_informes] SET [Id_tipoinforme] = @Id_tipoinforme, [Id_numero_de_Caso] = @Id_numero_de_Caso, [Ruta_Pdf] = @Ruta_Pdf, [Ruta_word] = @Ruta_word, [Id_estadodocus] = @Id_estadodocus WHERE [Id_informe] = @Id_informe">
             <DeleteParameters>
                 <asp:Parameter Name="Id_informe" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_tipoinforme" Type="Int32" />
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Ruta_Pdf" Type="String" />
                 <asp:Parameter Name="Ruta_word" Type="String" />
                 <asp:Parameter Name="Id_estadodocus" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="sdfs" SessionField="NumeroDeCaso" />
                 <asp:SessionParameter Name="estadoo43" SessionField="estadoderesumeninformes" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_tipoinforme" Type="Int32" />
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Ruta_Pdf" Type="String" />
                 <asp:Parameter Name="Ruta_word" Type="String" />
                 <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                 <asp:Parameter Name="Id_informe" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button10" runat="server" 
             Text="Nuevo Informe" Visible="False" onclick="Button10_Click" />
    </asp:Panel>

    </div>

    <asp:Panel ID="pn_Fotos" runat="server" Visible="False">
       
        <a  id ="AnclaFotos"></a>
               
        <div align="center">
            <asp:Image ID="Image1" runat="server" BorderStyle="Double" 
                ImageUrl="http://consultandoweb.com/consulcaso/logo.png" />
            <br />
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                PostBackUrl="~/NuevaFoto/nuevo" Text="Actualizar Foto" Visible="False" />
            <br />
        </div>
    </asp:Panel>

       

        <br />

     <asp:Panel ID="pn_Rinvestigador0" runat="server" BackColor="#FFCC00" 
        Visible="False">
         
         <a name="AnclaRinvestigador"></a>
         
         <asp:Label ID="Label19" runat="server" CssClass="titulos" 
             Text="Recursos Del Investigador"></asp:Label>
         <br />
         <asp:Label ID="Label20" runat="server" ForeColor="Red" 
             
             Text="Mensaje Importante: Para subir los documentos necesarios para realizar la investigación se debe realizar clic en el botón SUBIR ARCHIVOS de esta sección Luego escribir la describcion del recurso y acontinuacion clic en SELECCIONAR  para seleccionar el archivo correspondiente y luego clic en SUBIR "></asp:Label>
         <br />
         <br />
         <asp:GridView ID="GridView25" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Id_Recinve" DataSourceID="SqlDataSource23" 
             EmptyDataText="No hay registros de datos para mostrar." 
             onrowcommand="GridView19_RowCommand" CellPadding="4" ForeColor="#333333" 
             GridLines="Both">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:Button ID="AddButton4" runat="server" 
                             CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                             CommandName="VerAnexo" Text="Ver" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="Id_Recinve" HeaderText="Codigo Recurso
" ReadOnly="True" 
                     SortExpression="Id_Recinve" />
                 <asp:BoundField DataField="Tipodedocumento" HeaderText="Tipo De Recurso
" 
                     SortExpression="Tipodedocumento" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso
" 
                     SortExpression="Id_numero_de_Caso" />
                 <asp:BoundField DataField="Ruta" HeaderText="Archivo
" SortExpression="Ruta" />
                 
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource23" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Recuinve] WHERE [Id_Recinve] = @Id_Recinve" 
             InsertCommand="INSERT INTO [Tabla_Recuinve] ([Tipodedocumento], [Id_numero_de_Caso], [Ruta]) VALUES (@Tipodedocumento, @Id_numero_de_Caso, @Ruta)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Id_Recinve, Tipodedocumento, Id_numero_de_Caso, Ruta, SubidoPor FROM dbo.Tabla_Recuinve WHERE (Id_numero_de_Caso = @sdf) AND (SubidoPor = 'JefeAnalista')" 
             
             
             UpdateCommand="UPDATE [Tabla_Recuinve] SET [Tipodedocumento] = @Tipodedocumento, [Id_numero_de_Caso] = @Id_numero_de_Caso, [Ruta] = @Ruta WHERE [Id_Recinve] = @Id_Recinve">
             <DeleteParameters>
                 <asp:Parameter Name="Id_Recinve" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Tipodedocumento" Type="String" />
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Ruta" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="sdf" SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Tipodedocumento" Type="String" />
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Ruta" Type="String" />
                 <asp:Parameter Name="Id_Recinve" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button28" runat="server" 
             Text="Subir Archivos" Visible="False" onclick="Button28_Click" />
    </asp:Panel>
                

        <br />
        <table border="1">
            <tr>
                <td>

                 <div align="center">

     <asp:Panel ID="pn_Dcaso" runat="server" BackColor="#FFCC00" Visible="False">
         <asp:Label ID="Label4" runat="server" CssClass="titulos" 
             Text="Detalles Del Caso"></asp:Label>
         <a name="AnclaDcaso"></a>
        <br />
         <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource12" 
             EmptyDataText="No hay registros de datos para mostrar." 
             ForeColor="#333333" onselectedindexchanged="GridView1_SelectedIndexChanged">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Estado" HeaderText="Estado" 
                     SortExpression="Estado" />
                 <asp:BoundField DataField="tipodecaso" HeaderText="Tipo De Caso" 
                     SortExpression="tipodecaso" />
                 <asp:BoundField DataField="afiadonombre" HeaderText="Nombre Afiliado" 
                     SortExpression="afiadonombre" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="afiliadoapellido" HeaderText="Apellido Afiliado" 
                     SortExpression="afiliadoapellido" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                     SortExpression="Cedula" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Compania" HeaderText="Compañia" 
                     SortExpression="Compania">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="analistanombre" HeaderText="Nombre Analista" 
                     SortExpression="analistanombre" />
                 <asp:BoundField DataField="analistaapellido" HeaderText="Apellido Analista" 
                     SortExpression="analistaapellido" />
                 <asp:BoundField DataField="Correo" HeaderText="Analista Correo" 
                     SortExpression="Correo" />
                 <asp:BoundField DataField="investigadornombre" HeaderText="Investigador Nombre" 
                     SortExpression="investigadornombre" />
                 <asp:BoundField DataField="investigadorapellido" 
                     HeaderText="Investigador Apellido" SortExpression="investigadorapellido" />
                 <asp:BoundField DataField="Expr1" HeaderText="Correo Investigador" 
                     SortExpression="Expr1" />
                 <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" 
                     SortExpression="Observaciones" />
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
             ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
             DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
             InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
             ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
             SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres AS analistanombre, Tabla_Investigador.Nombres AS investigadornombre, Tabla_Analista.Apellidos AS analistaapellido, Tabla_Investigador.Apellidos AS investigadorapellido, Tabla_Afiliado.Cedula, Tabla_Afiliado.Nombre AS afiadonombre, Tabla_Afiliado.Apellido AS afiliadoapellido, Tabla_Compania.Nombre AS Compania, Tabla_Analista.Correo, Tabla_Investigador.Correo AS Expr1 FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania WHERE (Tabla_Casos.Id_Numero_Caso = @varnume)" 
             
             
             UpdateCommand="UPDATE [Tabla_Casos] SET [Id_tipocaso] = @Id_tipocaso, [Id_estado] = @Id_estado, [Id_analista] = @Id_analista, [Id_investigador] = @Id_investigador, [Fecha_asignacion] = @Fecha_asignacion, [Fecha_posibleentrega] = @Fecha_posibleentrega, [Fecha_entregareal] = @Fecha_entregareal, [Observaciones] = @Observaciones WHERE [Id_Numero_Caso] = @Id_Numero_Caso">
             <DeleteParameters>
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                 <asp:Parameter Name="Id_estado" Type="Int32" />
                 <asp:Parameter Name="Id_analista" Type="Int32" />
                 <asp:Parameter Name="Id_investigador" Type="Int32" />
                 <asp:Parameter Name="Fecha_asignacion" Type="String" />
                 <asp:Parameter Name="Fecha_posibleentrega" Type="String" />
                 <asp:Parameter Name="Fecha_entregareal" Type="String" />
                 <asp:Parameter Name="Observaciones" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="varnume" SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                 <asp:Parameter Name="Id_estado" Type="Int32" />
                 <asp:Parameter Name="Id_analista" Type="Int32" />
                 <asp:Parameter Name="Id_investigador" Type="Int32" />
                 <asp:Parameter Name="Fecha_asignacion" Type="String" />
                 <asp:Parameter Name="Fecha_posibleentrega" Type="String" />
                 <asp:Parameter Name="Fecha_entregareal" Type="String" />
                 <asp:Parameter Name="Observaciones" Type="String" />
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button4" runat="server" 
             PostBackUrl="~/Contenidos/NuevoCasoPage.aspx" 
             Text="Actualizar Detalles" onclick="Button4_Click" Visible="False" />
         <br />
         <asp:Label ID="Label18" runat="server" CssClass="titulos" Text="Terminos"></asp:Label>
         <asp:GridView ID="GridView24" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource12" 
             EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
             onselectedindexchanged="GridView1_SelectedIndexChanged">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Fecha_asignacion" HeaderText="Fecha De Asignacion" 
                     SortExpression="Fecha_asignacion" />
                 <asp:BoundField DataField="Fecha_posibleentrega" HeaderText="Fecha De Entrega" 
                     SortExpression="Fecha_posibleentrega" />
                 <asp:BoundField DataField="Fecha_entregareal" HeaderText="Fecha De Radicado" 
                     SortExpression="Fecha_entregareal" />
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
    </asp:Panel>

    </div>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">

     <asp:Panel ID="pn_Resumenes" runat="server" BackColor="#FFCC00" 
        Visible="False">
         <asp:Label ID="Label9" runat="server" CssClass="titulos" 
             Text="Bitacora Del Caso"></asp:Label>
         <a name="AnclaResumenes"></a>
        <br />
         <asp:GridView ID="GridView20" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataKeyNames="Id_resumenes" DataSourceID="SqlDataSource19" 
             EmptyDataText="No hay registros de datos para mostrar." 
             ForeColor="#333333" >
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 
                 <asp:BoundField DataField="Id_resumenes" HeaderText="Codigo Resumen" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_resumenes" 
                     Visible="False" />
                 <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                     SortExpression="Id_numero_de_Caso" Visible="False" />
                 <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                 <asp:BoundField DataField="Informe" HeaderText="Apunte Bitacora" 
                     SortExpression="Informe" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Nombre" HeaderText="Estado Apunte" 
                     SortExpression="Nombre" >
                 <ItemStyle Font-Bold="True" ForeColor="#0066FF" />
                 </asp:BoundField>
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource19" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Resumenes] WHERE [Id_resumenes] = @Id_resumenes" 
             InsertCommand="INSERT INTO [Tabla_Resumenes] ([Id_numero_de_Caso], [Fecha], [Informe], [Id_estadodocus]) VALUES (@Id_numero_de_Caso, @Fecha, @Informe, @Id_estadodocus)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_Resumenes.Id_resumenes, Tabla_Resumenes.Id_numero_de_Caso, Tabla_Resumenes.Fecha, Tabla_Resumenes.Informe, Tabla_estadodocus.Nombre, Tabla_Analista.Correo, Tabla_Afiliado.Nombre AS Expr1, Tabla_Afiliado.Apellido FROM Tabla_Resumenes INNER JOIN Tabla_estadodocus ON Tabla_Resumenes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus INNER JOIN Tabla_Casos ON Tabla_Resumenes.Id_numero_de_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso WHERE (Tabla_Resumenes.Id_numero_de_Caso = @ddd) AND (Tabla_estadodocus.Nombre LIKE '%' + @estadoo43 + '%')" 
             
             
             UpdateCommand="UPDATE [Tabla_Resumenes] SET [Id_numero_de_Caso] = @Id_numero_de_Caso, [Fecha] = @Fecha, [Informe] = @Informe, [Id_estadodocus] = @Id_estadodocus WHERE [Id_resumenes] = @Id_resumenes">
             <DeleteParameters>
                 <asp:Parameter Name="Id_resumenes" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Fecha" Type="String" />
                 <asp:Parameter Name="Informe" Type="String" />
                 <asp:Parameter Name="Id_estadodocus" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="ddd" SessionField="NumeroDeCaso" />
                 <asp:SessionParameter Name="estadoo43" SessionField="estadoderesumen45" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Fecha" Type="String" />
                 <asp:Parameter Name="Informe" Type="String" />
                 <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                 <asp:Parameter Name="Id_resumenes" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button9" runat="server" 
             PostBackUrl="~/Resumenes/Casos" 
             Text="Actualizar Apuntes" Visible="False" onclick="Button9_Click" />
    </asp:Panel>

    </div>
                </td>
            </tr>
        </table>
        <br />

        <table border="1">
            <tr>
                <td>

     <asp:Panel ID="pn_Seguimiento" runat="server" BackColor="#FFCC00" 
        Visible="False">
         <asp:Label ID="Label3" runat="server" CssClass="titulos" 
             Text="Citas Seguimiento"></asp:Label>
         <a name="AnclaSeguimiento"></a>
        <br />
         <br />
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataSourceID="SqlDataSource1" 
             EmptyDataText="No hay registros de datos para mostrar." 
             ForeColor="#333333">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Id_seguimientos" HeaderText="Codigo Seguimiento" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_seguimientos" />
                 <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                     SortExpression="Id_afiliado" />
                 <asp:BoundField DataField="Nombre_contacto" HeaderText="Nombre De Contacto" 
                     SortExpression="Nombre_contacto" />
                 <asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                     SortExpression="Entidad" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                     SortExpression="Direccion" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="departamento" HeaderText="Departamento" 
                     SortExpression="departamento" />
                 <asp:BoundField DataField="ciudad1" HeaderText="Ciudad" 
                     SortExpression="ciudad1" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                     SortExpression="Telefono" />
                 <asp:BoundField DataField="Extencion" HeaderText="Extencion" 
                     SortExpression="Extencion" />
                 <asp:BoundField DataField="Celular" HeaderText="Celular" 
                     SortExpression="Celular" />
                 <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Seguimientos] WHERE [Id_seguimientos] = @Id_seguimientos" 
             InsertCommand="INSERT INTO [Tabla_Seguimientos] ([Id_afiliado], [Celular], [Ciudad], [Direccion], [Entidad], [Extencion], [Fecha], [Hora], [Nombre_contacto], [Telefono]) VALUES (@Id_afiliado, @Celular, @Ciudad, @Direccion, @Entidad, @Extencion, @Fecha, @Hora, @Nombre_contacto, @Telefono)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_Seguimientos.Id_seguimientos, Tabla_Seguimientos.Id_afiliado, Tabla_Seguimientos.Celular, Tabla_Seguimientos.Ciudad, Tabla_Seguimientos.Direccion, Tabla_Seguimientos.Entidad, Tabla_Seguimientos.Extencion, Tabla_Seguimientos.Fecha, Tabla_Seguimientos.Hora, Tabla_Seguimientos.Nombre_contacto, Tabla_Seguimientos.Telefono, Tabla_Casos.Id_Numero_Caso, Tabla_departamentos.Nombre AS ciudad, Tabla_Ciudades.Ciudad AS departamento FROM Tabla_Seguimientos INNER JOIN Tabla_Ciudades ON Tabla_Seguimientos.Ciudad = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento INNER JOIN Tabla_Afiliado ON Tabla_Seguimientos.Id_afiliado = Tabla_Afiliado.Id_afiliado INNER JOIN Tabla_Casos ON Tabla_Afiliado.Id_Numero_Caso = Tabla_Casos.Id_Numero_Caso WHERE (Tabla_Casos.Id_Numero_Caso = @numeroc)" 
             UpdateCommand="UPDATE [Tabla_Seguimientos] SET [Id_afiliado] = @Id_afiliado, [Celular] = @Celular, [Ciudad] = @Ciudad, [Direccion] = @Direccion, [Entidad] = @Entidad, [Extencion] = @Extencion, [Fecha] = @Fecha, [Hora] = @Hora, [Nombre_contacto] = @Nombre_contacto, [Telefono] = @Telefono WHERE [Id_seguimientos] = @Id_seguimientos">
             <DeleteParameters>
                 <asp:Parameter Name="Id_seguimientos" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Entidad" Type="String" />
                 <asp:Parameter Name="Extencion" Type="Int32" />
                 <asp:Parameter Name="Fecha" Type="String" />
                 <asp:Parameter Name="Hora" Type="String" />
                 <asp:Parameter Name="Nombre_contacto" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="numeroc" SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Entidad" Type="String" />
                 <asp:Parameter Name="Extencion" Type="Int32" />
                 <asp:Parameter Name="Fecha" Type="String" />
                 <asp:Parameter Name="Hora" Type="String" />
                 <asp:Parameter Name="Nombre_contacto" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
                 <asp:Parameter Name="Id_seguimientos" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button3" runat="server" Text="Actualizar Citas" 
             PostBackUrl="~/Contenidos/SeguimientosPage.aspx" Visible="False" 
             onclick="Button3_Click" />
    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />

       

      

        <br />
        <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">

     <asp:Panel ID="pn_Rinvestigador" runat="server" BackColor="#FFCC00" 
        Visible="False">
         
         <a name="AnclaRinvestigador"></a>
         
         <asp:Label ID="Label8" runat="server" CssClass="titulos" 
             Text="Recursos Del Investigador"></asp:Label>
         <br />
         <br />
         <asp:Button ID="Button14" runat="server" onclick="Button14_Click" 
             Text="Marcarpeta" />
         <br />

         <asp:Panel ID="pn_rsuperinves" runat="server" BackColor="#99FF66" 
        Visible="False">

         <table border="1" cellspacing="5" style="height: 71px">
             <tr>
                 <td class="style1">
                     &nbsp;</td>
                 <td class="style1">
                     Documentos a Generar</td>
                 <td class="style1">
                     Documentos A Solicitar</td>
                 <td class="style1">
                     Documentos a Consultar</td>
             </tr>
             <tr>
                 <td class="style1">
                     &nbsp;</td>
                 <td class="style1">
                     &nbsp;</td>
                 <td class="style1">
                     <asp:Button ID="Button16" runat="server" onclick="Button16_Click" 
                         Text="Solicitud Cifin" />
                 </td>
                 <td class="style1">
                     <asp:HyperLink ID="HyperLink2" runat="server" 
                         NavigateUrl="http://www.fosyga.gov.co/Consultas/AfiliadosCompensados/MaestroAfiliadosCompensados/tabid/439/Default.aspx" 
                         Target="_blank">Fosiga</asp:HyperLink>
                 </td>
             </tr>
             <tr>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     <asp:Button ID="Button15" runat="server" onclick="Button15_Click" 
                         Text="Preliminares" />
                 </td>
                 <td class="style2">
                     <asp:Button ID="Button18" runat="server" 
                         Text="Solicitud De Documentos Laborales" />
                 </td>
                 <td class="style2" style="margin-left: 40px">
                     <asp:HyperLink ID="HyperLink3" runat="server" 
                         NavigateUrl="http://aplica.ccb.org.co/ccbconsultas/consultas/RUE/consulta_empresa.aspx" 
                         Target="_blank">Camara De Comercio</asp:HyperLink>
                 </td>
             </tr>
             <tr>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     <asp:TextBox ID="TextBox1" runat="server" Height="86px" TextMode="MultiLine" 
                         Width="306px"></asp:TextBox>
                 </td>
                 <td class="style2">
                     &nbsp;</td>
             </tr>
             <tr>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     <asp:Button ID="Button17" runat="server" onclick="Button17_Click" 
                         Text="Solicitar Certificaciones Eps" />
                 </td>
                 <td class="style2">
                     &nbsp;</td>
             </tr>
             <tr>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     <asp:Button ID="Button19" runat="server" onclick="Button19_Click" 
                         Text="Solicitar Instrumentos Publicos" />
                 </td>
                 <td class="style2">
                     &nbsp;</td>
             </tr>
             <tr>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     &nbsp;</td>
                 <td class="style2">
                     <asp:Button ID="Button20" runat="server" onclick="Button20_Click" 
                         Text="Solicitar No Pension Seguros Sociales" />
                 </td>
                 <td class="style2">
                     &nbsp;</td>
             </tr>
         </table>
         
         </asp:Panel>
         
         <br />
         <br />
         <asp:GridView ID="GridView19" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Id_Recinve" DataSourceID="SqlDataSource18" 
             EmptyDataText="No hay registros de datos para mostrar." 
             onrowcommand="GridView19_RowCommand" CellPadding="4" ForeColor="#333333" 
             GridLines="Both">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:Button ID="AddButton2" runat="server" 
                             CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                             CommandName="VerAnexo" Text="Ver" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="Id_Recinve" HeaderText="Codigo Recurso
" ReadOnly="True" 
                     SortExpression="Id_Recinve" />
                 <asp:BoundField DataField="Tipodedocumento" HeaderText="Tipo De Recurso
" 
                     SortExpression="Tipodedocumento" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso
" 
                     SortExpression="Id_numero_de_Caso" />
                 <asp:BoundField DataField="Ruta" HeaderText="Archivo
" SortExpression="Ruta" />
                 
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource18" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Recuinve] WHERE [Id_Recinve] = @Id_Recinve" 
             InsertCommand="INSERT INTO [Tabla_Recuinve] ([Tipodedocumento], [Id_numero_de_Caso], [Ruta]) VALUES (@Tipodedocumento, @Id_numero_de_Caso, @Ruta)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Id_Recinve, Tipodedocumento, Id_numero_de_Caso, Ruta FROM Tabla_Recuinve WHERE (Id_numero_de_Caso = @sdf)" 
             UpdateCommand="UPDATE [Tabla_Recuinve] SET [Tipodedocumento] = @Tipodedocumento, [Id_numero_de_Caso] = @Id_numero_de_Caso, [Ruta] = @Ruta WHERE [Id_Recinve] = @Id_Recinve">
             <DeleteParameters>
                 <asp:Parameter Name="Id_Recinve" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Tipodedocumento" Type="String" />
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Ruta" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="sdf" SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Tipodedocumento" Type="String" />
                 <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                 <asp:Parameter Name="Ruta" Type="String" />
                 <asp:Parameter Name="Id_Recinve" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button8" runat="server" 
             PostBackUrl="~/Documentacion/RecursosPageok.aspx" 
             Text="Actualizar Recursos" Visible="False" onclick="Button8_Click" />
    </asp:Panel>

    </div>
                </td>
            </tr>
        </table>
       

        <br />

        <table border="1">
            <tr>
                <td>

     <asp:Panel ID="pn_Dafiliado" runat="server" BackColor="#FFCC00" 
        Visible="False">
         <asp:Label ID="Label6" runat="server" CssClass="titulos" 
             Text="Detalles Del Afiliado"></asp:Label>
         <a name="AnclaDafiliado"></a>
         <br />
         <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Id_afiliado" DataSourceID="SqlDataSource11" 
             EmptyDataText="No hay registros de datos para mostrar." 
             onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
             ForeColor="#333333" onload="GridView10_Load">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:CommandField SelectText="Actualizar Info Laboral" 
                     ShowSelectButton="True" >
                 <ItemStyle Font-Bold="True" />
                 </asp:CommandField>
                 <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                     ReadOnly="True" SortExpression="Id_afiliado" />
                 <asp:BoundField DataField="Id_laborales" HeaderText="Codigo Laborales" 
                     SortExpression="Id_laborales" />
                 <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero Caso" 
                     SortExpression="Id_Numero_Caso" />
                 <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                     SortExpression="Nombre" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Apellido" HeaderText="Apellido" 
                     SortExpression="Apellido" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                     SortExpression="Cedula" />
                 <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                     SortExpression="Ciudad" />
                 <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                     SortExpression="Direccion" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Barrio" HeaderText="Barrio" 
                     SortExpression="Barrio" />
                 <asp:BoundField DataField="Celular" HeaderText="Celular" 
                     SortExpression="Celular" />
                 <asp:BoundField DataField="Telefono" HeaderText="Telefono Fijo" 
                     SortExpression="Telefono" />
             
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
             ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
             DeleteCommand="DELETE FROM [Tabla_Afiliado] WHERE [Id_afiliado] = @Id_afiliado" 
             InsertCommand="INSERT INTO [Tabla_Afiliado] ([Id_laborales], [Id_Numero_Caso], [Apellido], [Barrio], [Cedula], [Celular], [Ciudad], [Direccion], [Nombre], [Telefono]) VALUES (@Id_laborales, @Id_Numero_Caso, @Apellido, @Barrio, @Cedula, @Celular, @Ciudad, @Direccion, @Nombre, @Telefono)" 
             ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
             SelectCommand="SELECT Tabla_Afiliado.Id_afiliado, Tabla_Afiliado.Id_laborales, Tabla_Afiliado.Id_Numero_Caso, Tabla_Afiliado.Apellido, Tabla_Afiliado.Barrio, Tabla_Afiliado.Cedula, Tabla_Afiliado.Celular, Tabla_Ciudades.Ciudad + ' ' + Tabla_departamentos.Nombre AS Ciudad, Tabla_Afiliado.Direccion, Tabla_Afiliado.Nombre, Tabla_Afiliado.Telefono FROM Tabla_Afiliado INNER JOIN Tabla_Ciudades ON Tabla_Afiliado.Ciudad = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_Afiliado.Id_Numero_Caso = @unnumero)" 
             
             UpdateCommand="UPDATE [Tabla_Afiliado] SET [Id_laborales] = @Id_laborales, [Id_Numero_Caso] = @Id_Numero_Caso, [Apellido] = @Apellido, [Barrio] = @Barrio, [Cedula] = @Cedula, [Celular] = @Celular, [Ciudad] = @Ciudad, [Direccion] = @Direccion, [Nombre] = @Nombre, [Telefono] = @Telefono WHERE [Id_afiliado] = @Id_afiliado">
             <DeleteParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
                 <asp:Parameter Name="Apellido" Type="String" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cedula" Type="Int64" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Nombre" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="unnumero" SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
                 <asp:Parameter Name="Apellido" Type="String" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cedula" Type="Int64" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Nombre" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button5" runat="server" 
             PostBackUrl="~/Contenidos/InfoAfiliadoPage.aspx" 
             Text="Actualizar Detalles" onclick="Button5_Click" Visible="False" />
         <br />
         <br />
         <asp:Label ID="Label16" runat="server" CssClass="titulos" 
             Text="Informacion Laboral Afiliado" Font-Size="X-Large"></asp:Label>
         <br />
         <asp:GridView ID="GridView22" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataKeyNames="Id_laborales" DataSourceID="SqlDataSource22" 
             EmptyDataText="No hay registros de datos para mostrar." 
             ForeColor="#333333" onload="GridView22_Load">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Id_laborales" HeaderText="Codigo Laborales" 
                     ReadOnly="True" SortExpression="Id_laborales" />
                 <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                     SortExpression="Id_afiliado" />
                 <asp:BoundField DataField="Id_reclamantes" HeaderText="Codigo Reclamantes" 
                     SortExpression="Id_reclamantes" />
                 <asp:BoundField DataField="Nombre_empresa" HeaderText="Empresa" 
                     SortExpression="Nombre_empresa">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                     SortExpression="Direccion" />
                 <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                     SortExpression="Telefono" />
                 <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                 <asp:BoundField DataField="Barrio" HeaderText="Barrio" 
                     SortExpression="Barrio" />
                 <asp:BoundField DataField="Email_empresa" HeaderText="Email Empresa" 
                     SortExpression="Email_empresa">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                     SortExpression="Ciudad" />
                 <asp:BoundField DataField="Persona_Contacto" HeaderText="Persona Contacto" 
                     SortExpression="Persona_Contacto">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Extencion" HeaderText="Extencion" 
                     SortExpression="Extencion" />
                 <asp:BoundField DataField="Celular" HeaderText="Celular" 
                     SortExpression="Celular" />
                 <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Email_contacto" HeaderText="Email Contacto" 
                     SortExpression="Email_contacto">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <br />
         <br />
         <br />
         <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_laborales] WHERE [Id_laborales] = @Id_laborales" 
             InsertCommand="INSERT INTO [Tabla_laborales] ([Id_afiliado], [Id_reclamantes], [Barrio], [Cargo], [Celular], [Ciudad], [Direccion], [Email_contacto], [Email_empresa], [Extencion], [Fax], [Nombre_empresa], [Persona_Contacto], [Telefono]) VALUES (@Id_afiliado, @Id_reclamantes, @Barrio, @Cargo, @Celular, @Ciudad, @Direccion, @Email_contacto, @Email_empresa, @Extencion, @Fax, @Nombre_empresa, @Persona_Contacto, @Telefono)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_laborales.Id_laborales, Tabla_laborales.Id_afiliado, Tabla_laborales.Id_reclamantes, Tabla_laborales.Barrio, Tabla_laborales.Cargo, Tabla_laborales.Celular, Tabla_laborales.Direccion, Tabla_laborales.Email_contacto, Tabla_laborales.Email_empresa, Tabla_laborales.Extencion, Tabla_laborales.Fax, Tabla_laborales.Nombre_empresa, Tabla_laborales.Persona_Contacto, Tabla_laborales.Telefono, Tabla_Ciudades.Ciudad FROM Tabla_laborales INNER JOIN Tabla_Ciudades ON Tabla_laborales.Ciudad = Tabla_Ciudades.Id_ciudad WHERE (Tabla_laborales.Id_afiliado = @fdgsfd)" 
             UpdateCommand="UPDATE [Tabla_laborales] SET [Id_afiliado] = @Id_afiliado, [Id_reclamantes] = @Id_reclamantes, [Barrio] = @Barrio, [Cargo] = @Cargo, [Celular] = @Celular, [Ciudad] = @Ciudad, [Direccion] = @Direccion, [Email_contacto] = @Email_contacto, [Email_empresa] = @Email_empresa, [Extencion] = @Extencion, [Fax] = @Fax, [Nombre_empresa] = @Nombre_empresa, [Persona_Contacto] = @Persona_Contacto, [Telefono] = @Telefono WHERE [Id_laborales] = @Id_laborales">
             <DeleteParameters>
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Id_reclamantes" Type="Int32" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cargo" Type="String" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Email_contacto" Type="String" />
                 <asp:Parameter Name="Email_empresa" Type="String" />
                 <asp:Parameter Name="Extencion" Type="Int32" />
                 <asp:Parameter Name="Fax" Type="Int32" />
                 <asp:Parameter Name="Nombre_empresa" Type="String" />
                 <asp:Parameter Name="Persona_Contacto" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="fdgsfd" SessionField="identifiafiliado" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Id_reclamantes" Type="Int32" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cargo" Type="String" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Email_contacto" Type="String" />
                 <asp:Parameter Name="Email_empresa" Type="String" />
                 <asp:Parameter Name="Extencion" Type="Int32" />
                 <asp:Parameter Name="Fax" Type="Int32" />
                 <asp:Parameter Name="Nombre_empresa" Type="String" />
                 <asp:Parameter Name="Persona_Contacto" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    </asp:Panel>
                </td>
            </tr>
        </table>

       

    <br />

        <table border="1">
            <tr>
                <td>

     <asp:Panel ID="pn_Dfallecimiento" runat="server" BackColor="#FFCC00" 
        Visible="False">
         <asp:Label ID="Label5" runat="server" CssClass="titulos" 
             Text="Detalles Del Fallecimiento"></asp:Label>
         <a name="AnclaDfallecimiento"></a>
        <br />
         <br />
         <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataSourceID="SqlDataSource13" 
             EmptyDataText="No hay registros de datos para mostrar." 
             ForeColor="#333333">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Id_fallecimiento" HeaderText="Codigo Fallecimiento" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_fallecimiento" 
                     Visible="False" />
                 <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                     SortExpression="Id_afiliado" Visible="False" />
                 <asp:BoundField DataField="Causa_muerte" HeaderText="Causa De La Muerte" 
                     SortExpression="Causa_muerte" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Circustancias" HeaderText="Circustancias" 
                     SortExpression="Circustancias" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                 <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                 <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                     SortExpression="Ciudad" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Nombre" HeaderText="Departamento" 
                     SortExpression="Nombre" />
                 <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" 
                     Visible="False" />
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Muerte] WHERE [Id_fallecimiento] = @Id_fallecimiento" 
             InsertCommand="INSERT INTO [Tabla_Muerte] ([Id_afiliado], [Causa_muerte], [Circustancias], [Fecha], [Hora], [Lugar]) VALUES (@Id_afiliado, @Causa_muerte, @Circustancias, @Fecha, @Hora, @Lugar)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_Muerte.Id_fallecimiento, Tabla_Muerte.Id_afiliado, Tabla_Muerte.Causa_muerte, Tabla_Muerte.Circustancias, Tabla_Muerte.Fecha, Tabla_Muerte.Hora, Tabla_Muerte.Lugar, Tabla_Casos.Id_Numero_Caso, Tabla_Ciudades.Ciudad, Tabla_departamentos.Nombre FROM Tabla_Muerte INNER JOIN Tabla_Afiliado ON Tabla_Muerte.Id_afiliado = Tabla_Afiliado.Id_afiliado INNER JOIN Tabla_Casos ON Tabla_Afiliado.Id_Numero_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Ciudades ON Tabla_Muerte.Lugar = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_Casos.Id_Numero_Caso = @fikltro)" 
             UpdateCommand="UPDATE [Tabla_Muerte] SET [Id_afiliado] = @Id_afiliado, [Causa_muerte] = @Causa_muerte, [Circustancias] = @Circustancias, [Fecha] = @Fecha, [Hora] = @Hora, [Lugar] = @Lugar WHERE [Id_fallecimiento] = @Id_fallecimiento">
             <DeleteParameters>
                 <asp:Parameter Name="Id_fallecimiento" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Causa_muerte" Type="String" />
                 <asp:Parameter Name="Circustancias" Type="String" />
                 <asp:Parameter Name="Fecha" Type="String" />
                 <asp:Parameter Name="Hora" Type="String" />
                 <asp:Parameter Name="Lugar" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="fikltro" SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Causa_muerte" Type="String" />
                 <asp:Parameter Name="Circustancias" Type="String" />
                 <asp:Parameter Name="Fecha" Type="String" />
                 <asp:Parameter Name="Hora" Type="String" />
                 <asp:Parameter Name="Lugar" Type="String" />
                 <asp:Parameter Name="Id_fallecimiento" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         &nbsp;
         <button onclick="openWin(); return false;">
             Actualiza Detalles
         </button>
         &nbsp;</asp:Panel>
                </td>
            </tr>
        </table>

   

    <br />

        <table border="1">
            <tr>
                <td>

     <asp:Panel ID="pn_Reclamantes" runat="server" BackColor="#FFCC00" 
        Visible="False">
         <asp:Label ID="Label7" runat="server" CssClass="titulos" Text="Reclamantes"></asp:Label>
         <a name="AnclaReclamantes"></a>
        <br />
         <br />
         <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Id_reclamantes" DataSourceID="SqlDataSource14" 
             EmptyDataText="No hay registros de datos para mostrar." 
             onselectedindexchanged="GridView13_SelectedIndexChanged" CellPadding="4" 
             ForeColor="#333333" >
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:CommandField SelectText="Actualizar  Info Laboral" 
                     ShowSelectButton="True" >
                 <ItemStyle Font-Bold="True" />
                 </asp:CommandField>
                 <asp:BoundField DataField="Id_reclamantes" HeaderText="Codigo Reclamantes" 
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_reclamantes" />
                 <asp:BoundField DataField="Id_laborales" 
                     HeaderText="Codigo Documentos Laborales" SortExpression="Id_laborales" />
                 <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                     SortExpression="Id_afiliado" />
                 <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                     SortExpression="Id_Numero_Caso" />
                 <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                     SortExpression="Nombre" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Apellido" HeaderText="Apellido" 
                     SortExpression="Apellido" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                     SortExpression="Cedula" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Expr1" HeaderText="Ciudad" SortExpression="Expr1">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Expr2" HeaderText="Departamento" 
                     SortExpression="Expr2" />
                 <asp:BoundField DataField="Parentesco" HeaderText="Parentesco" 
                     SortExpression="Parentesco" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                     SortExpression="Direccion" />
                 <asp:BoundField DataField="Barrio" HeaderText="Barrio" 
                     SortExpression="Barrio" />
                 <asp:BoundField DataField="Celular" HeaderText="Celular" 
                     SortExpression="Celular" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                     SortExpression="Telefono" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Reclamantes] WHERE [Id_reclamantes] = @Id_reclamantes" 
             InsertCommand="INSERT INTO [Tabla_Reclamantes] ([Id_laborales], [Id_afiliado], [Id_Numero_Caso], [Apellido], [Barrio], [Cedula], [Celular], [Ciudad], [Direccion], [Nombre], [Parentesco], [Telefono]) VALUES (@Id_laborales, @Id_afiliado, @Id_Numero_Caso, @Apellido, @Barrio, @Cedula, @Celular, @Ciudad, @Direccion, @Nombre, @Parentesco, @Telefono)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_Reclamantes.Id_reclamantes, Tabla_Reclamantes.Id_laborales, Tabla_Reclamantes.Id_afiliado, Tabla_Reclamantes.Id_Numero_Caso, Tabla_Reclamantes.Apellido, Tabla_Reclamantes.Barrio, Tabla_Reclamantes.Cedula, Tabla_Reclamantes.Celular, Tabla_Reclamantes.Ciudad, Tabla_Reclamantes.Direccion, Tabla_Reclamantes.Nombre, Tabla_Reclamantes.Parentesco, Tabla_Reclamantes.Telefono, Tabla_Ciudades.Ciudad AS Expr1, Tabla_departamentos.Nombre AS Expr2 FROM Tabla_Reclamantes INNER JOIN Tabla_Ciudades ON Tabla_Reclamantes.Ciudad = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_Reclamantes.Id_Numero_Caso = @mifuk)" 
             UpdateCommand="UPDATE [Tabla_Reclamantes] SET [Id_laborales] = @Id_laborales, [Id_afiliado] = @Id_afiliado, [Id_Numero_Caso] = @Id_Numero_Caso, [Apellido] = @Apellido, [Barrio] = @Barrio, [Cedula] = @Cedula, [Celular] = @Celular, [Ciudad] = @Ciudad, [Direccion] = @Direccion, [Nombre] = @Nombre, [Parentesco] = @Parentesco, [Telefono] = @Telefono WHERE [Id_reclamantes] = @Id_reclamantes">
             <DeleteParameters>
                 <asp:Parameter Name="Id_reclamantes" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
                 <asp:Parameter Name="Apellido" Type="String" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cedula" Type="Int64" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Nombre" Type="String" />
                 <asp:Parameter Name="Parentesco" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter DefaultValue="NumeroDeCaso" Name="mifuk" 
                     SessionField="NumeroDeCaso" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
                 <asp:Parameter Name="Apellido" Type="String" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cedula" Type="Int64" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Nombre" Type="String" />
                 <asp:Parameter Name="Parentesco" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
                 <asp:Parameter Name="Id_reclamantes" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button7" runat="server" 
             PostBackUrl="~/Contenidos/InfoReclamantesPage.aspx" 
             Text="Actualizar Reclamantes " Visible="False" onclick="Button7_Click" />
         <br />
         <br />
         <asp:Label ID="Label17" runat="server" CssClass="titulos" 
             Text="Informacion Laboral Reclamante" Font-Size="X-Large"></asp:Label>
         <br />
         <asp:GridView ID="GridView23" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataKeyNames="Id_laborales" DataSourceID="SqlDataSource4" 
             EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Id_laborales" HeaderText="Codigo Laborales" 
                     ReadOnly="True" SortExpression="Id_laborales" />
                 <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                     SortExpression="Id_afiliado" />
                 <asp:BoundField DataField="Id_reclamantes" HeaderText="Codigo Reclamantes" 
                     SortExpression="Id_reclamantes" />
                 <asp:BoundField DataField="Nombre_empresa" HeaderText="Empresa" 
                     SortExpression="Nombre_empresa">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                     SortExpression="Direccion" />
                 <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                     SortExpression="Telefono" />
                 <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                 <asp:BoundField DataField="Barrio" HeaderText="Barrio" 
                     SortExpression="Barrio" />
                 <asp:BoundField DataField="Email_empresa" HeaderText="Email Empresa" 
                     SortExpression="Email_empresa">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                     SortExpression="Ciudad" />
                 <asp:BoundField DataField="Persona_Contacto" HeaderText="Persona Contacto" 
                     SortExpression="Persona_Contacto">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Extencion" HeaderText="Extencion" 
                     SortExpression="Extencion" />
                 <asp:BoundField DataField="Celular" HeaderText="Celular" 
                     SortExpression="Celular" />
                 <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Email_contacto" HeaderText="Email Contacto" 
                     SortExpression="Email_contacto">
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
             </Columns>
             <EditRowStyle BackColor="#999999" />
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#E9E7E2" />
             <SortedAscendingHeaderStyle BackColor="#506C8C" />
             <SortedDescendingCellStyle BackColor="#FFFDF8" />
             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_laborales] WHERE [Id_laborales] = @Id_laborales" 
             InsertCommand="INSERT INTO [Tabla_laborales] ([Id_afiliado], [Id_reclamantes], [Barrio], [Cargo], [Celular], [Ciudad], [Direccion], [Email_contacto], [Email_empresa], [Extencion], [Fax], [Nombre_empresa], [Persona_Contacto], [Telefono]) VALUES (@Id_afiliado, @Id_reclamantes, @Barrio, @Cargo, @Celular, @Ciudad, @Direccion, @Email_contacto, @Email_empresa, @Extencion, @Fax, @Nombre_empresa, @Persona_Contacto, @Telefono)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_laborales.Id_laborales, Tabla_laborales.Id_afiliado, Tabla_laborales.Id_reclamantes, Tabla_laborales.Barrio, Tabla_laborales.Cargo, Tabla_laborales.Celular, Tabla_laborales.Direccion, Tabla_laborales.Email_contacto, Tabla_laborales.Email_empresa, Tabla_laborales.Extencion, Tabla_laborales.Fax, Tabla_laborales.Nombre_empresa, Tabla_laborales.Persona_Contacto, Tabla_laborales.Telefono, Tabla_Ciudades.Ciudad FROM Tabla_laborales INNER JOIN Tabla_Ciudades ON Tabla_laborales.Ciudad = Tabla_Ciudades.Id_ciudad WHERE (Tabla_laborales.Id_reclamantes = @recla)" 
             UpdateCommand="UPDATE [Tabla_laborales] SET [Id_afiliado] = @Id_afiliado, [Id_reclamantes] = @Id_reclamantes, [Barrio] = @Barrio, [Cargo] = @Cargo, [Celular] = @Celular, [Ciudad] = @Ciudad, [Direccion] = @Direccion, [Email_contacto] = @Email_contacto, [Email_empresa] = @Email_empresa, [Extencion] = @Extencion, [Fax] = @Fax, [Nombre_empresa] = @Nombre_empresa, [Persona_Contacto] = @Persona_Contacto, [Telefono] = @Telefono WHERE [Id_laborales] = @Id_laborales">
             <DeleteParameters>
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Id_reclamantes" Type="Int32" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cargo" Type="String" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Email_contacto" Type="String" />
                 <asp:Parameter Name="Email_empresa" Type="String" />
                 <asp:Parameter Name="Extencion" Type="Int32" />
                 <asp:Parameter Name="Fax" Type="Int32" />
                 <asp:Parameter Name="Nombre_empresa" Type="String" />
                 <asp:Parameter Name="Persona_Contacto" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="recla" SessionField="identifireclamantes" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_afiliado" Type="Int32" />
                 <asp:Parameter Name="Id_reclamantes" Type="Int32" />
                 <asp:Parameter Name="Barrio" Type="String" />
                 <asp:Parameter Name="Cargo" Type="String" />
                 <asp:Parameter Name="Celular" Type="Int64" />
                 <asp:Parameter Name="Ciudad" Type="String" />
                 <asp:Parameter Name="Direccion" Type="String" />
                 <asp:Parameter Name="Email_contacto" Type="String" />
                 <asp:Parameter Name="Email_empresa" Type="String" />
                 <asp:Parameter Name="Extencion" Type="Int32" />
                 <asp:Parameter Name="Fax" Type="Int32" />
                 <asp:Parameter Name="Nombre_empresa" Type="String" />
                 <asp:Parameter Name="Persona_Contacto" Type="String" />
                 <asp:Parameter Name="Telefono" Type="Int32" />
                 <asp:Parameter Name="Id_laborales" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    </asp:Panel>
                </td>
            </tr>
        </table>
    <br />
    <br />

        <br />
        <asp:Label ID="lb_tipocaso" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <asp:Label ID="lb_usuario" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lb_info3" runat="server"></asp:Label>
        <br />

    <br />

    <br />

    <br />

    <br />

    <br />

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
         <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
             ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
             DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
             InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_Tipodecaso.Nombre, Tabla_Casos.Id_Numero_Caso FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso WHERE (Tabla_Casos.Id_Numero_Caso = @unavar)" 
             
             
        UpdateCommand="UPDATE [Tabla_Casos] SET [Id_tipocaso] = @Id_tipocaso, [Id_estado] = @Id_estado, [Id_analista] = @Id_analista, [Id_investigador] = @Id_investigador, [Fecha_asignacion] = @Fecha_asignacion, [Fecha_posibleentrega] = @Fecha_posibleentrega, [Fecha_entregareal] = @Fecha_entregareal, [Observaciones] = @Observaciones WHERE [Id_Numero_Caso] = @Id_Numero_Caso">
             <DeleteParameters>
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                 <asp:Parameter Name="Id_estado" Type="Int32" />
                 <asp:Parameter Name="Id_analista" Type="Int32" />
                 <asp:Parameter Name="Id_investigador" Type="Int32" />
                 <asp:Parameter Name="Fecha_asignacion" Type="String" />
                 <asp:Parameter Name="Fecha_posibleentrega" Type="String" />
                 <asp:Parameter Name="Fecha_entregareal" Type="String" />
                 <asp:Parameter Name="Observaciones" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                 <asp:Parameter Name="Id_estado" Type="Int32" />
                 <asp:Parameter Name="Id_analista" Type="Int32" />
                 <asp:Parameter Name="Id_investigador" Type="Int32" />
                 <asp:Parameter Name="Fecha_asignacion" Type="String" />
                 <asp:Parameter Name="Fecha_posibleentrega" Type="String" />
                 <asp:Parameter Name="Fecha_entregareal" Type="String" />
                 <asp:Parameter Name="Observaciones" Type="String" />
                 <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    <br />

    <br />

    

    <br />
    
    

     



</div>

</asp:Content>

