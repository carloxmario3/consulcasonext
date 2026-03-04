<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoFallecimientoPage.aspx.cs" Inherits="Contenidos_InfoFallecimientoPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/Estilos/consulstyle.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
      <div align="center">


      
        <br />


      
        <asp:Label ID="Label2" runat="server" 
            Text="Informacion De Fallecimiento" CssClass="titulos" ></asp:Label>
  
        <br />

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
            

            <div align="center">

             <asp:Panel ID="Panel1" runat="server" Visible="False" BackColor="#FFCC00">
            <table border = "1" cellspacing = "5" style="height: 71px">
                <tr>
                    <td class="style1" colspan="2">
                        <asp:Label ID="Label8" runat="server" Text="Causa de la muerte" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:TextBox ID="tb_causa" runat="server" Width="371px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label9" runat="server" Text="Circunstancias" 
                            CssClass="subtitulo"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:TextBox ID="tb_circustancias" runat="server" Height="109px" 
                            TextMode="MultiLine" Width="496px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="Departamento" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label7" runat="server" Text="Ciudad" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label10" runat="server" Text="Fecha" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style2" colspan="2">
                        <asp:Label ID="lb_fecha" runat="server" CssClass="subtitulo"></asp:Label>
                        <asp:Calendar ID="Calendar1" runat="server" 
                            onselectionchanged="Calendar1_SelectionChanged" CssClass="subtitulo"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:Label ID="Label11" runat="server" Text="Hora" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <asp:TextBox ID="tb_hora" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
                 <br />
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Listo" />
        </asp:Panel>


                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                
                <asp:Label ID="lb_info_operacion2" runat="server" CssClass="mensaje"></asp:Label>
                


                                &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Agregar Informacion Fallecimiento" />


                                <br />

                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id_fallecimiento" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Id_fallecimiento" HeaderText="Codigo" 
                            ReadOnly="True" SortExpression="Id_fallecimiento" />
                        <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                            SortExpression="Id_afiliado" />
                        <asp:BoundField DataField="Causa_muerte" HeaderText="Causa Muerte" 
                            SortExpression="Causa_muerte" />
                        <asp:BoundField DataField="Circustancias" HeaderText="Circustancias" 
                            SortExpression="Circustancias" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                        <asp:TemplateField HeaderText="Lugar" SortExpression="Lugar">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" 
                                    DataSourceID="SqlDataSource6" DataTextField="Ciudaddep" 
                                    DataValueField="Id_ciudad" SelectedValue='<%# Bind("Lugar") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSourceID="SqlDataSource6" DataTextField="Ciudaddep" 
                                    DataValueField="Id_ciudad"  SelectedValue='<%# Bind("Lugar") %>' 
                                    Enabled="False">
                                </asp:DropDownList>
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
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Muerte] WHERE [Id_fallecimiento] = @Id_fallecimiento" 
                    InsertCommand="INSERT INTO [Tabla_Muerte] ([Id_afiliado], [Causa_muerte], [Circustancias], [Fecha], [Hora], [Lugar]) VALUES (@Id_afiliado, @Causa_muerte, @Circustancias, @Fecha, @Hora, @Lugar)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Muerte.Id_fallecimiento, Tabla_Muerte.Id_afiliado, Tabla_Muerte.Causa_muerte, Tabla_Muerte.Circustancias, Tabla_Muerte.Fecha, Tabla_Muerte.Hora, Tabla_Muerte.Lugar, Tabla_Casos.Id_Numero_Caso FROM Tabla_Muerte INNER JOIN Tabla_Afiliado ON Tabla_Muerte.Id_afiliado = Tabla_Afiliado.Id_afiliado INNER JOIN Tabla_Casos ON Tabla_Afiliado.Id_Numero_Caso = Tabla_Casos.Id_Numero_Caso WHERE (Tabla_Casos.Id_Numero_Caso = @aaa)" 
                    
                    UpdateCommand="UPDATE [Tabla_Muerte] SET  [Causa_muerte] = @Causa_muerte, [Circustancias] = @Circustancias, [Fecha] = @Fecha, [Hora] = @Hora, [Lugar] = @Lugar WHERE [Id_fallecimiento] = @Id_fallecimiento">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_fallecimiento" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_afiliado" Type="Int32" />
                        <asp:Parameter Name="Causa_muerte" Type="String" />
                        <asp:Parameter Name="Circustancias" Type="String" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Hora" Type="String" />
                        <asp:Parameter Name="Lugar" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="aaa" SessionField="NumeroDeCaso" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Causa_muerte" Type="String" />
                        <asp:Parameter Name="Circustancias" Type="String" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Hora" Type="String" />
                        <asp:Parameter Name="Lugar" Type="Int32" />
                        <asp:Parameter Name="Id_fallecimiento" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
               
                <script type="text/javascript">


                    function GetRadWindow() {
                        var oWindow = null;
                        if (window.radWindow) oWindow = window.radWindow;
                        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
                        return oWindow;
                    }



                    function returnToParent() {
                        //create the argument that will be returned to the parent page
                        var oArg = new Object();

                        //get the city's name




                        oArg.cityName = 'dddd';

                        oArg.selDate = 'sss';



                        //get a reference to the current RadWindow
                        var oWnd = GetRadWindow();




                        //Close the RadWindow and send the argument to the parent page

                        oWnd.close(oArg);


                    }


        </script>
               
               
               
                <button id="close" onclick="returnToParent(); return false;" title="Submit">
                    Hecho
                </button>
                <br />

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_departamentos] WHERE [Id_departamento] = @Id_departamento" 
                    InsertCommand="INSERT INTO [Tabla_departamentos] ([Nombre]) VALUES (@Nombre)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT [Id_departamento], [Nombre] FROM [Tabla_departamentos]" 
                    UpdateCommand="UPDATE [Tabla_departamentos] SET [Nombre] = @Nombre WHERE [Id_departamento] = @Id_departamento">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_departamento" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_departamento" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Ciudades] WHERE [Id_ciudad] = @Id_ciudad" 
                    InsertCommand="INSERT INTO [Tabla_Ciudades] ([Ciudad], [Departamento]) VALUES (@Ciudad, @Departamento)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Id_ciudad, Ciudad, Departamento FROM Tabla_Ciudades WHERE (Departamento = @ideparta)" 
                    UpdateCommand="UPDATE [Tabla_Ciudades] SET [Ciudad] = @Ciudad, [Departamento] = @Departamento WHERE [Id_ciudad] = @Id_ciudad">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_ciudad" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Departamento" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ideparta" SessionField="departamento" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Departamento" Type="Int32" />
                        <asp:Parameter Name="Id_ciudad" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Ciudades] WHERE [Id_ciudad] = @Id_ciudad" 
                    InsertCommand="INSERT INTO [Tabla_Ciudades] ([Ciudad], [Departamento]) VALUES (@Ciudad, @Departamento)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Ciudades.Id_ciudad, Tabla_departamentos.Nombre + '   ' + Tabla_Ciudades.Ciudad AS Ciudaddep FROM Tabla_Ciudades INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento" 
                    UpdateCommand="UPDATE [Tabla_Ciudades] SET [Ciudad] = @Ciudad, [Departamento] = @Departamento WHERE [Id_ciudad] = @Id_ciudad">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_ciudad" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Departamento" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Departamento" Type="Int32" />
                        <asp:Parameter Name="Id_ciudad" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                

        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />



    </form>
</body>
</html>
