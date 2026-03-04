<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="VideosPage.aspx.cs" Inherits="Multimedia_VideosPage" %>


  

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="flowplayer-3.1.4.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
   
   
   
    </telerik:RadScriptManager>
    <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
    <br />


    <div align="center">
    
        <asp:Button ID="Button3" runat="server" Font-Bold="True" 
            onclick="Button3_Click" Text="Atras" Width="73px" Font-Italic="False" 
            Font-Overline="False" Font-Underline="True" ForeColor="#3333FF" />
    
        <br />

        </div>
    
    <div align="center">
    
        <br />
        
         <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -->
	<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="520" height="330"> 
		<param name="movie" value="player.swf" /> 
		<param name="allowfullscreen" value="true" /> 
		<param name="allowscriptaccess" value="always" /> 
		<param name="flashvars" value="file=<%Response.Write(mivar);%>&skin=whotube.zip&frontcolor=ffffff&lightcolor=cc9900&screencolor=000000&stretching=fill" /> 
		<embed 
			type="application/x-shockwave-flash"
			id="player2"
			name="player2"
			src="player.swf" 
			width="520" 
			height="330"
			allowscriptaccess="always" 
			allowfullscreen="true"
			flashvars="file=<%Response.Write(mivar);%>" 
		/> 
	</object> 
	<!-- END OF THE PLAYER EMBEDDING -->
    
        <br />
    
  <script runat="server">
       string mivar;
       protected void Page_Load(object sender, EventArgs e)
       {


           mivar = System.Web.Configuration.WebConfigurationManager.AppSettings["RutaPagina"] + "/Condata/" + Convert.ToString(Session["NumeroDeCaso"]) + "/Videos/" + Convert.ToString(Session["vervideo"]);
           
       }

      
      
   </script>



        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

    	
	
	
		
	
        <br />
        <asp:Button ID="Button2" runat="server" Text="Subir Video" 
            onclick="Button2_Click" />
	
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id_Videos" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay registros de datos para mostrar." 
            style="margin-right: 0px"
            onrowcommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" 
            GridLines="Both">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
               <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="VerAnexo" Text="Ver" />
                                </ItemTemplate>
                            </asp:TemplateField>
               
                <asp:BoundField DataField="Id_Videos" HeaderText="Codigo Video" ReadOnly="True" 
                    SortExpression="Id_Videos" InsertVisible="False" />
                <asp:BoundField DataField="Id_informe" HeaderText="Pertenece a Informe Cod" 
                    SortExpression="Id_informe" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion Del Video" 
                    SortExpression="Tipodedocumento" />
                <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                    SortExpression="Nombre" Visible="False" />
            
             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Actualizara" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="ActualizarAnexo" Text="Actualizar" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Tabla_Videos] WHERE [Id_Videos] = @Id_Videos" 
            InsertCommand="INSERT INTO [Tabla_Videos] ([Id_informe], [Tipodedocumento], [Ruta], [Id_estadodocus]) VALUES (@Id_informe, @Tipodedocumento, @Ruta, @Id_estadodocus)" 
            ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
            SelectCommand="SELECT Tabla_Videos.Id_Videos, Tabla_Videos.Id_informe, Tabla_Videos.Tipodedocumento, Tabla_Videos.Ruta, Tabla_estadodocus.Nombre FROM Tabla_Videos INNER JOIN Tabla_estadodocus ON Tabla_Videos.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_Videos.Id_informe = @sdted)" 
            UpdateCommand="UPDATE [Tabla_Videos] SET [Id_informe] = @Id_informe, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta, [Id_estadodocus] = @Id_estadodocus WHERE [Id_Videos] = @Id_Videos">
            <DeleteParameters>
                <asp:Parameter Name="Id_Videos" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_informe" Type="Int32" />
                <asp:Parameter Name="Tipodedocumento" Type="String" />
                <asp:Parameter Name="Ruta" Type="String" />
                <asp:Parameter Name="Id_estadodocus" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="sdted" SessionField="NumeroDeInforme" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_informe" Type="Int32" />
                <asp:Parameter Name="Tipodedocumento" Type="String" />
                <asp:Parameter Name="Ruta" Type="String" />
                <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                <asp:Parameter Name="Id_Videos" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
	
        <br />

    </div>


</asp:Content>

