<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="RevisorCasosPage.aspx.cs" Inherits="RevisorCasosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="flowplayer-3.1.4.min.js"></script>

      <script type="text/javascript">


          function mifuncion() {




              document.location.href = "<%Response.Write(anclita());%>";



          }

          mifuncion();


         
        
        </script>
        

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">

  

        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

  

    <br />
        <asp:Label ID="lb_ncaso" runat="server" CssClass="titulos"></asp:Label>



    <br />
    <asp:Label ID="lb_tipocaso" runat="server"></asp:Label>



    <br />
    <asp:Label ID="lb_usuario" runat="server"></asp:Label>

    

    <br />
        <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
        <br />
    <br />
    <asp:Button ID="ButtonRevisar" runat="server" onclick="Button16_Click" 
        Text="Revisar" Visible="False" />
    &nbsp;
    <asp:Button ID="ButtonCorregir" runat="server" onclick="Button15_Click" 
        Text="Corregir" Visible="False" />
&nbsp;
    <asp:Button ID="ButtonConvertir" runat="server" onclick="Button14_Click" 
        Text="Convertir" Visible="False" />
    &nbsp;&nbsp;
    <asp:Button ID="ButtonPublicado" runat="server" onclick="Button18_Click" 
        Text="Publicar" Visible="False" />
    <br />
    <br />

    <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">



    <asp:Panel ID="pn_corregir" runat="server" BackColor="#99CCFF" Visible="False">
        <asp:Label ID="Label13" runat="server" CssClass="titulos" 
            Text="Notas"></asp:Label>
       
        <br />
        <asp:Label ID="Label17" runat="server" 
            
            Text="Escriba lo que se debe corregir en el informe (Informe, Anexos, Fotos o Videos)" 
            CssClass="subtitulo"></asp:Label>
       
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="95px" TextMode="MultiLine" 
            Width="433px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button17" runat="server" Text="Listo" onclick="Button2_Click" />
        <br />
    </asp:Panel>

  </div>
                </td>
            </tr>
        </table>


    

    <br />

     <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">


    <asp:Panel ID="pn_infop" runat="server" BackColor="#99CCFF" Visible="False">
        <asp:Label ID="Label12" runat="server" CssClass="titulos" 
            Text="Informes Publicados"></asp:Label>
       
        <a  id ="Anclainfop"></a>
       
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id_publicados" DataSourceID="SqlDataSource2" 
            EmptyDataText="No hay registros de datos para mostrar." 
            onrowcommand="GridView2_RowCommand" CellPadding="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="AddButton1" runat="server" 
                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                            CommandName="VerAnexo" Text="Ver" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id_publicados" HeaderText="Codigo Publicado" 
                    ReadOnly="True" SortExpression="Id_publicados" />
                <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                    SortExpression="Id_numero_de_Caso" />
                <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion" 
                    SortExpression="Tipodedocumento" />
                <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Tabla_Publicados] WHERE [Id_publicados] = @Id_publicados" 
            InsertCommand="INSERT INTO [Tabla_Publicados] ([Id_numero_de_Caso], [Tipodedocumento], [Ruta]) VALUES (@Id_numero_de_Caso, @Tipodedocumento, @Ruta)" 
            ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
            SelectCommand="SELECT Id_publicados, Id_numero_de_Caso, Tipodedocumento, Ruta FROM Tabla_Publicados WHERE (Id_numero_de_Caso = @fdgd)" 
            UpdateCommand="UPDATE [Tabla_Publicados] SET [Id_numero_de_Caso] = @Id_numero_de_Caso, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta WHERE [Id_publicados] = @Id_publicados">
            <DeleteParameters>
                <asp:Parameter Name="Id_publicados" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                <asp:Parameter Name="Tipodedocumento" Type="String" />
                <asp:Parameter Name="Ruta" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="fdgd" SessionField="NumeroDeCaso" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                <asp:Parameter Name="Tipodedocumento" Type="String" />
                <asp:Parameter Name="Ruta" Type="String" />
                <asp:Parameter Name="Id_publicados" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button13" runat="server" Text="Actualizar Informes" 
            PostBackUrl="~/Documentacion/InformesPublicadosPage.aspx" 
            onclick="Button13_Click" />
        <br />
    </asp:Panel>
        
        </div>
                </td>
            </tr>
        </table>


        
        <br />

         <table border="1" >
            <tr>
                <td>

                <div align="center">


     <asp:Panel ID="pn_Informes" runat="server" BackColor="#99CCFF">
         <asp:Label ID="Label10" runat="server" CssClass="titulos" Text="Informes"></asp:Label>
         <a name="AnclaInformes"></a>
        <br />
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
                     InsertVisible="False" ReadOnly="True" SortExpression="Id_informe" />
                 <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                     SortExpression="Id_numero_de_Caso" />
                 <asp:BoundField DataField="Ruta_word" HeaderText="Archivo" 
                     SortExpression="Ruta_word" />
                 <asp:BoundField DataField="Nombre" HeaderText="Tipo Informe" 
                     SortExpression="Nombre" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Expr1" HeaderText="Estado Informe" 
                     SortExpression="Expr1" />
                 <asp:BoundField DataField="Nombres" HeaderText="Investigador" 
                     SortExpression="Nombres" />
                 <asp:BoundField DataField="Correo" HeaderText="Correo Investigador" 
                     SortExpression="Correo" />
                 <asp:BoundField DataField="Expr2" HeaderText="Analista" SortExpression="Expr2" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="Expr3" HeaderText="Correo Analista" 
                     SortExpression="Expr3" >
                 <ItemStyle Font-Bold="True" />
                 </asp:BoundField>
                 <asp:BoundField DataField="nombreafiliado" HeaderText="Nombre Afiliado" 
                     SortExpression="nombreafiliado" />
                 <asp:BoundField DataField="Cedula" HeaderText="Cedula Afiliado" 
                     SortExpression="Cedula" />
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
             SelectCommand="SELECT Tabla_informes.Id_informe, Tabla_informes.Id_numero_de_Caso, Tabla_informes.Ruta_word, Tabla_Tipodeinforme.Nombre, Tabla_estadodocus.Nombre AS Expr1, Tabla_Investigador.Nombres, Tabla_Investigador.Correo, Tabla_Analista.Nombres AS Expr2, Tabla_Analista.Correo AS Expr3, Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido AS nombreafiliado, Tabla_Afiliado.Cedula FROM Tabla_informes INNER JOIN Tabla_Tipodeinforme ON Tabla_informes.Id_tipoinforme = Tabla_Tipodeinforme.Id_tipoinforme INNER JOIN Tabla_estadodocus ON Tabla_informes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus INNER JOIN Tabla_Casos ON Tabla_informes.Id_numero_de_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso WHERE (Tabla_informes.Id_informe = @aasd)" 
             
             
             
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
                 <asp:SessionParameter Name="aasd" SessionField="NumeroDeInforme" />
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
             PostBackUrl="~/Documentacion/InformesPage.aspx" 
             Text="Corregir Informes" onclick="Button10_Click" 
             Visible="False" />
        <br />
    </asp:Panel>
        
        </div>
                </td>
            </tr>
        </table>


        
        <br />

         <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">


     <asp:Panel ID="pn_Anexos" runat="server" BackColor="#99CCFF">
         <asp:Label ID="Label11" runat="server" CssClass="titulos" Text="Anexos"></asp:Label>
         <a name="AnclaAnexos"></a>
        <br />
         <br />
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" DataKeyNames="Id_anexos" DataSourceID="SqlDataSource1" 
             EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
             GridLines="Both" onrowcommand="GridView21_RowCommand">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:Button ID="AddButton" runat="server" 
                             CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                             CommandName="VerAnexo" Text="Ver" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="Id_anexos" HeaderText="Codigo Anexos" 
                     ReadOnly="True" SortExpression="Id_anexos" />
                 <asp:BoundField DataField="Id_informe" HeaderText="Pertenece a Informe Cod" 
                     SortExpression="Id_informe" />
                 <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion Documento" 
                     SortExpression="Tipodedocumento" />
                 <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                 <asp:BoundField DataField="Nombre" HeaderText="Estado Documento" 
                     SortExpression="Nombre" Visible="False" />
                 
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
             DeleteCommand="DELETE FROM [Tabla_Anexos] WHERE [Id_anexos] = @Id_anexos" 
             InsertCommand="INSERT INTO [Tabla_Anexos] ([Id_informe], [Tipodedocumento], [Ruta], [Id_estadodocus]) VALUES (@Id_informe, @Tipodedocumento, @Ruta, @Id_estadodocus)" 
             ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
             SelectCommand="SELECT Tabla_Anexos.Id_anexos, Tabla_Anexos.Id_informe, Tabla_Anexos.Tipodedocumento, Tabla_Anexos.Ruta, Tabla_Anexos.Id_estadodocus, Tabla_estadodocus.Nombre FROM Tabla_Anexos INNER JOIN Tabla_estadodocus ON Tabla_Anexos.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_Anexos.Id_informe = @sdtfsd)" 
             UpdateCommand="UPDATE [Tabla_Anexos] SET [Id_informe] = @Id_informe, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta, [Id_estadodocus] = @Id_estadodocus WHERE [Id_anexos] = @Id_anexos">
             <DeleteParameters>
                 <asp:Parameter Name="Id_anexos" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Id_informe" Type="Int32" />
                 <asp:Parameter Name="Tipodedocumento" Type="String" />
                 <asp:Parameter Name="Ruta" Type="String" />
                 <asp:Parameter Name="Id_estadodocus" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="sdtfsd" SessionField="NumeroDeInforme" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Id_informe" Type="Int32" />
                 <asp:Parameter Name="Tipodedocumento" Type="String" />
                 <asp:Parameter Name="Ruta" Type="String" />
                 <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                 <asp:Parameter Name="Id_anexos" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:Button ID="Button11" runat="server" 
             PostBackUrl="~/Documentacion/AnexosPage.aspx" 
             Text="Corregir Anexos" onclick="Button11_Click" Visible="False" />
        <br />
    </asp:Panel>
        
        </div>
                </td>
            </tr>
        </table>


        
        <br />

     <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">


    <asp:Panel ID="pn_Fotos" runat="server" BackColor="#99CCFF" Visible="False">
        <asp:Label ID="Label2" runat="server" CssClass="titulos" Text="Fotografías"></asp:Label>
       
        <a  id ="AnclaFotos"></a>
       
        <br />
        <br />
        <div align="center">
            <asp:Image ID="Image1" runat="server" BorderStyle="Double" 
                ImageUrl="http://consultandoweb.com/consulcaso/logo.png" />
            <br />
            <br />
            <asp:Label ID="Label16" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView17" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id_Fotos" datasourceid="SqlDataSource21" 
                EmptyDataText="No hay registros de datos para mostrar." 
                onrowcommand="GridView17_RowCommand" CellPadding="4" ForeColor="#333333" 
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
                    <asp:BoundField DataField="Id_Fotos" HeaderText="Codigo Fotos" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Id_Fotos" />
                    <asp:BoundField DataField="Id_informe" HeaderText="Pertenece a Informe Cod" 
                        SortExpression="Id_informe" />
                    <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion De La Foto" 
                        SortExpression="Tipodedocumento" >
                    <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                        SortExpression="Nombre" Visible="False" />
                   
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
            <asp:SqlDataSource ID="SqlDataSource21" runat="server" 
                ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Tabla_Fotos] WHERE [Id_Fotos] = @Id_Fotos" 
                InsertCommand="INSERT INTO [Tabla_Fotos] ([Id_informe], [Tipodedocumento], [Ruta], [Id_estadodocus]) VALUES (@Id_informe, @Tipodedocumento, @Ruta, @Id_estadodocus)" 
                ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                SelectCommand="SELECT Tabla_Fotos.Id_Fotos, Tabla_Fotos.Id_informe, Tabla_Fotos.Tipodedocumento, Tabla_Fotos.Ruta, Tabla_estadodocus.Nombre FROM Tabla_Fotos INNER JOIN Tabla_estadodocus ON Tabla_Fotos.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_Fotos.Id_informe = @fdg)" 
                UpdateCommand="UPDATE [Tabla_Fotos] SET [Id_informe] = @Id_informe, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta, [Id_estadodocus] = @Id_estadodocus WHERE [Id_Fotos] = @Id_Fotos">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Fotos" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id_informe" Type="Int32" />
                    <asp:Parameter Name="Tipodedocumento" Type="String" />
                    <asp:Parameter Name="Ruta" Type="String" />
                    <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="fdg" SessionField="NumeroDeInforme" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id_informe" Type="Int32" />
                    <asp:Parameter Name="Tipodedocumento" Type="String" />
                    <asp:Parameter Name="Ruta" Type="String" />
                    <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                    <asp:Parameter Name="Id_Fotos" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:Button ID="fotosaa" runat="server" Text="Corregir Fotos" 
            PostBackUrl="~/Multimedia/FotosPage.aspx" onclick="fotosaa_Click" 
            Visible="False" />
        <br />
    </asp:Panel>
    </div>
                </td>
            </tr>
        </table>


    
    <br />

     <table border="1" style="width: 800px">
            <tr>
                <td>

                <div align="center">


    <asp:Panel ID="pn_Video" runat="server" BackColor="#99CCFF" Visible="False">
        <div align="center">
    
  <script runat="server">
       string mivar;
       string enlace()
       {



           mivar = System.Web.Configuration.WebConfigurationManager.AppSettings["RutaPagina"] + "/Condata/" + Convert.ToString(Session["NumeroDeCaso"]) + "/Videos/" + Convert.ToString(Session["vervideo"]);

           return mivar;
            
       }

       string mivar2;
       string anclita()
       {



           mivar2 = "#" + Convert.ToString(Session["anclona2"]);

           return mivar2;

       }
      
      
      
   </script>



        <asp:Label ID="Label1" runat="server" CssClass="titulos" Text="Video"></asp:Label>

            <br />

    	    <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -->
	<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="520" height="330"> 
		<param name="movie" value="player.swf" /> 
		<param name="allowfullscreen" value="true" /> 
		<param name="allowscriptaccess" value="always" /> 
		<param name="flashvars" value="file=<%Response.Write(enlace());%>&skin=whotube.zip&frontcolor=ffffff&lightcolor=cc9900&screencolor=000000&stretching=fill" /> 
		<embed 
			type="application/x-shockwave-flash"
			id="player2"
			name="player2"
			src="player.swf" 
			width="520" 
			height="330"
			allowscriptaccess="always" 
			allowfullscreen="true"
			flashvars="file=<%Response.Write(enlace());%>" 
		/> 
	</object> 
	<!-- END OF THE PLAYER EMBEDDING -->
	
		
	
            <br />
            <br />
            <asp:GridView ID="GridView18" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id_Videos" DataSourceID="SqlDataSource22" 
                EmptyDataText="No hay registros de datos para mostrar." 
                onrowcommand="GridView18_RowCommand" style="margin-right: 0px" 
                CellPadding="4" ForeColor="#333333" GridLines="Both">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="AddButton0" runat="server" 
                                CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                CommandName="VerAnexo" Text="Ver" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id_Videos" HeaderText="Codigo Video" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Id_Videos" />
                    <asp:BoundField DataField="Id_informe" HeaderText="Pertenece a Informe Cod" 
                        SortExpression="Id_informe" />
                    <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion Del Video" 
                        SortExpression="Tipodedocumento" >
                    <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                        SortExpression="Nombre" Visible="False" />
                    
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
            <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
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
        <asp:Button ID="Button1" runat="server" 
            PostBackUrl="~/Multimedia/VideosPage.aspx" Text="Corregir Videos" 
                onclick="Button1_Click" Visible="False" />
	
        <br />

    </div>
    </asp:Panel>

    </div>
                </td>
            </tr>
        </table>


    <br />
        
    

     



</div>


</asp:Content>

