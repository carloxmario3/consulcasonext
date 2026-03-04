<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="SeguimientosPage.aspx.cs" Inherits="Contenidos_SeguimientosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Citas Seguimientos" CssClass="titulos" ></asp:Label>
  
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

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
                    <td class="style1">
                        <asp:Label ID="Label3" runat="server" Text="Nombre De Contacto" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label4" runat="server" Text="Entidad" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label5" runat="server" Text="Dirección" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label6" runat="server" Text="Departamento" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label7" runat="server" Text="Ciudad" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:TextBox ID="tb_nombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_entidad" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_direccio" runat="server"></asp:TextBox>
                    </td>
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
                    <td class="style2">
                        <asp:Label ID="Label8" runat="server" Text="Teléfono" CssClass="subtitulo"></asp:Label>
                        <br />
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label9" runat="server" Text="Extensión" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label10" runat="server" Text="Celular" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:TextBox ID="tb_telefono" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_extencion" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_celular" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2" colspan="3" align = "center">
                        <asp:Label ID="lb_fecha" runat="server" CssClass="subtitulo"></asp:Label>
                        <asp:Calendar ID="Calendar1" runat="server" 
                            onselectionchanged="Calendar1_SelectionChanged" CssClass="subtitulo"></asp:Calendar>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2" colspan="3">
                        <asp:Label ID="Label11" runat="server" Text="Hora" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2" colspan="3">
                        <asp:TextBox ID="tb_hora" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        </td>
                </tr>
            </table>
                 <br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Listo" />
        </asp:Panel>


                <asp:Label ID="lb_info_operacion2" runat="server"></asp:Label>


                <br />
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <br />


                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Agregar Citas " />


                                <br />&nbsp;<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_seguimientos" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" style="margin-left: 0px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Id_seguimientos" HeaderText="Codigo Seguimientos" 
                            ReadOnly="True" SortExpression="Id_seguimientos" />
                        <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo  Afiliado" 
                            SortExpression="Id_afiliado" />
                        <asp:BoundField DataField="Nombre_contacto" HeaderText="Nombre Contacto" 
                            SortExpression="Nombre_contacto" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                            SortExpression="Entidad" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                            SortExpression="Direccion" />
                        <asp:TemplateField HeaderText="Ciudad" SortExpression="Ciudad">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" 
                                    DataSourceID="SqlDataSource6" DataTextField="Ciudaddep" 
                                    DataValueField="Id_ciudad" SelectedValue='<%# Bind("Ciudad") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSourceID="SqlDataSource6" DataTextField="Ciudaddep" 
                                    DataValueField="Id_ciudad" Enabled="False" 
                                    SelectedValue='<%# Bind("Ciudad") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                            SortExpression="Telefono" />
                        <asp:BoundField DataField="Extencion" HeaderText="Extencion" 
                            SortExpression="Extencion" />
                        <asp:BoundField DataField="Celular" HeaderText="Celular" 
                            SortExpression="Celular" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
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
                    DeleteCommand="DELETE FROM [Tabla_Seguimientos] WHERE [Id_seguimientos] = @Id_seguimientos" 
                    InsertCommand="INSERT INTO [Tabla_Seguimientos] ([Id_afiliado], [Celular], [Ciudad], [Direccion], [Entidad], [Extencion], [Fecha], [Hora], [Nombre_contacto], [Telefono]) VALUES (@Id_afiliado, @Celular, @Ciudad, @Direccion, @Entidad, @Extencion, @Fecha, @Hora, @Nombre_contacto, @Telefono)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Seguimientos.Id_seguimientos, Tabla_Seguimientos.Id_afiliado, Tabla_Seguimientos.Celular, Tabla_Seguimientos.Ciudad, Tabla_Seguimientos.Direccion, Tabla_Seguimientos.Entidad, Tabla_Seguimientos.Extencion, Tabla_Seguimientos.Fecha, Tabla_Seguimientos.Hora, Tabla_Seguimientos.Nombre_contacto, Tabla_Seguimientos.Telefono, Tabla_Casos.Id_Numero_Caso FROM Tabla_Seguimientos INNER JOIN Tabla_Afiliado ON Tabla_Seguimientos.Id_afiliado = Tabla_Afiliado.Id_afiliado INNER JOIN Tabla_Casos ON Tabla_Afiliado.Id_Numero_Caso = Tabla_Casos.Id_Numero_Caso WHERE (Tabla_Casos.Id_Numero_Caso = @ddfr)" 
                    
                    UpdateCommand="UPDATE Tabla_Seguimientos SET Celular = @Celular, Ciudad = @Ciudad, Direccion = @Direccion, Entidad = @Entidad, Extencion = @Extencion, Fecha = @Fecha, Hora = @Hora, Nombre_contacto = @Nombre_contacto, Telefono = @Telefono WHERE (Id_seguimientos = @Id_seguimientos)">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_seguimientos" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_afiliado" Type="Int32" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Ciudad" Type="Int32" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Entidad" Type="String" />
                        <asp:Parameter Name="Extencion" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Hora" Type="String" />
                        <asp:Parameter Name="Nombre_contacto" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ddfr" SessionField="NumeroDeCaso" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Celular" />
                        <asp:Parameter Name="Ciudad" />
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Entidad" />
                        <asp:Parameter Name="Extencion" />
                        <asp:Parameter Name="Fecha" />
                        <asp:Parameter Name="Hora" />
                        <asp:Parameter Name="Nombre_contacto" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Id_seguimientos" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
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
                <br />
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
    <br />
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
                <br />
                &nbsp;&nbsp;<br />&nbsp;<br />
                &nbsp;<asp:Button ID="b_edicion" runat="server" CssClass="botones" Height="26px" 
                    onclick="b_edicion_Click" Text="Habilitar Edición" Width="142px" 
                    Visible="False" />
                &nbsp;<asp:Button ID="b_eliminacion" runat="server" CssClass="botones" 
                    onclick="b_eliminacion_Click" Text="Habilitar Eliminación" 
                    Visible="False" />

    <br />

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />




</asp:Content>

