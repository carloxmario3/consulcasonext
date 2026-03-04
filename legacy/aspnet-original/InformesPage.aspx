<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InformesPage.aspx.cs" Inherits="InformesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">


      
        <asp:Label ID="Label2" runat="server" CssClass="titulos" ></asp:Label>
  
 <a name="Ancla1"></a>

    </div>
         
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div align="center">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/image003.gif" 
                Height="31px" Width="31px" />
            <br />
            Cargando</div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            

            <div align="center" style="margin-left: 40px">

             <asp:Panel ID="Panel1" runat="server" Visible="False" BackColor="#FFCC00">
            <table border = "1" cellspacing = "5" style="height: 71px">
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <br />
                        &nbsp;<br />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <br />
                    </td>
                </tr>
            </table>
        </asp:Panel>


                <br />


                <asp:Label ID="Label3" runat="server" CssClass="subtitulo"></asp:Label>


    <br />
                &nbsp;&nbsp;<asp:GridView ID="GridView8" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="Id_informe" 
                    DataSourceID="SqlDataSource8" 
                    EmptyDataText="No hay registros de datos para mostrar." 
                    onselectedindexchanged="GridView8_SelectedIndexChanged" CellPadding="4" 
                    ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id_informe" HeaderText="Codigo Informe" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_informe" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Expr2" HeaderText="Tipo De Informe" 
                            SortExpression="Expr2" />
                        <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                            SortExpression="Id_numero_de_Caso" />
                        <asp:BoundField DataField="Expr1" HeaderText="Tipo De Caso" 
                            SortExpression="Expr1" />
                        <asp:BoundField DataField="Nombre" HeaderText="Estado Informe" 
                            SortExpression="Nombre" >
                        <ItemStyle Font-Bold="True" ForeColor="#0066FF" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ruta_Pdf" HeaderText="Ruta_Pdf" 
                            SortExpression="Ruta_Pdf" Visible="False" />
                        <asp:BoundField DataField="Ruta_word" HeaderText="Ruta_word" 
                            SortExpression="Ruta_word" Visible="False" />
                        <asp:BoundField DataField="Id_estadodocus" HeaderText="Id_estadodocus" 
                            SortExpression="Id_estadodocus" Visible="False" />
                        <asp:BoundField DataField="Correo" HeaderText="Correo" 
                            SortExpression="Correo" Visible="False" />
                        <asp:BoundField DataField="Id_tipoinforme" HeaderText="Id_tipoinforme" 
                            SortExpression="Id_tipoinforme" Visible="False" />
                        <asp:BoundField DataField="nombreafi" HeaderText="Nombre" 
                            SortExpression="nombreafi" />
                        <asp:BoundField DataField="apellidoafi" HeaderText="Apellido" 
                            SortExpression="apellidoafi" />
                        <asp:BoundField DataField="cedulaafi" HeaderText="Cedula" 
                            SortExpression="cedulaafi" />
                        <asp:BoundField DataField="compania" HeaderText="Compañia" 
                            SortExpression="compania" />
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
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_informes] WHERE [Id_informe] = @Id_informe" 
                    InsertCommand="INSERT INTO [Tabla_informes] ([Id_tipoinforme], [Id_numero_de_Caso], [Ruta_Pdf], [Ruta_word], [Id_estadodocus]) VALUES (@Id_tipoinforme, @Id_numero_de_Caso, @Ruta_Pdf, @Ruta_word, @Id_estadodocus)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_informes.Id_informe, Tabla_informes.Id_tipoinforme, Tabla_informes.Id_numero_de_Caso, Tabla_informes.Ruta_Pdf, Tabla_informes.Ruta_word, Tabla_informes.Id_estadodocus, Tabla_estadodocus.Nombre, Tabla_Investigador.Correo, Tabla_Tipodecaso.Nombre AS Expr1, Tabla_Tipodeinforme.Nombre AS Expr2, Tabla_Compania.Nombre AS compania, Tabla_Afiliado.Nombre AS nombreafi, Tabla_Afiliado.Apellido AS apellidoafi, Tabla_Afiliado.Cedula AS cedulaafi FROM Tabla_informes INNER JOIN Tabla_estadodocus ON Tabla_informes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus INNER JOIN Tabla_Casos ON Tabla_informes.Id_numero_de_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Tipodeinforme ON Tabla_informes.Id_tipoinforme = Tabla_Tipodeinforme.Id_tipoinforme INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso WHERE (Tabla_estadodocus.Nombre = @dfs) AND (Tabla_Investigador.Correo LIKE '%' + @investigadorfg + '%')" 
                    
                    
                    
                    
                    
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
                        <asp:SessionParameter Name="dfs" SessionField="estadoreviinformes" />
                        <asp:SessionParameter Name="investigadorfg" 
                            SessionField="investigadorrevicion" />
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
                <br />
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_informes] WHERE [Id_informe] = @Id_informe" 
                    InsertCommand="INSERT INTO [Tabla_informes] ([Id_tipoinforme], [Id_numero_de_Caso], [Ruta_Pdf], [Ruta_word], [Id_estadodocus]) VALUES (@Id_tipoinforme, @Id_numero_de_Caso, @Ruta_Pdf, @Ruta_word, @Id_estadodocus)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_informes.Id_informe, Tabla_informes.Id_tipoinforme, Tabla_informes.Id_numero_de_Caso, Tabla_informes.Ruta_Pdf, Tabla_informes.Ruta_word, Tabla_informes.Id_estadodocus, Tabla_estadodocus.Nombre, Tabla_Investigador.Correo, Tabla_Casos.Id_tipocaso, Tabla_Tipodecaso.Nombre AS Expr1, Tabla_Tipodeinforme.Nombre AS Expr2 FROM Tabla_informes INNER JOIN Tabla_estadodocus ON Tabla_informes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus INNER JOIN Tabla_Casos ON Tabla_informes.Id_numero_de_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Tipodeinforme ON Tabla_informes.Id_tipoinforme = Tabla_Tipodeinforme.Id_tipoinforme WHERE (Tabla_informes.Id_numero_de_Caso = @sssa)" 
                    
                    
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
                        <asp:SessionParameter Name="sssa" SessionField="NumeroDeCaso" />
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
                <br />
                <br />
                <br />
                &nbsp;

    <br />

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />


   




</asp:Content>

