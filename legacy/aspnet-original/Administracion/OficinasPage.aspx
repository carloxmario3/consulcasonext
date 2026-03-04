<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="OficinasPage.aspx.cs" Inherits="Administracion_OficinasPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True" NavigateUrl="~/Administracion/ClientesPage.aspx">Atras</asp:HyperLink>
        <br />
        <asp:Label ID="Label2" runat="server" 
            Text="Panel De Administracion De Oficinas" CssClass="titulos" ></asp:Label>
        <br />
                    <br />
         <asp:Label ID="lb_nombre_cliente" runat="server" Text="Nombre Del Cliente" 
             CssClass="titulos" Font-Bold="False" Font-Italic="True"></asp:Label>
         <br />
         <br />
                    <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                
                <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/image003.gif" 
                Height="31px" Width="31px" />
                <br />
                Cargando

            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                 <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC00" Visible="False">
                     <table border="1" cellspacing="5" style="height: 71px">
                         <tr>
                             <td class="style2">
                                 <asp:Label ID="Label4" runat="server" CssClass="subtitulo" Text="Dirección"></asp:Label>
                                 <br />
                             </td>
                             <td>
                                 <asp:Label ID="Label5" runat="server" CssClass="subtitulo" Text="Teléfono"></asp:Label>
                                 <br />
                             </td>
                             <td>
                                 <asp:Label ID="Label3" runat="server" CssClass="subtitulo" Text="Departamento"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label10" runat="server" CssClass="subtitulo" Text="Ciudad"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td 2"="">
                                 <br />
                                 <asp:TextBox ID="tb_Direccion0" runat="server" CssClass="cajastexto"></asp:TextBox>
                             </td>
                             <td>
                                 <br />
                                 <asp:TextBox ID="tb_telefono" runat="server" CssClass="cajastexto"></asp:TextBox>
                             </td>
                             <td>
                                 <br />
                                 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                     onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                 </asp:DropDownList>
                                 <br />
                             </td>
                             <td>
                                 <br />
                                 <asp:DropDownList ID="DropDownList2" runat="server">
                                 </asp:DropDownList>
                             </td>
                         </tr>
                     </table>
                     <asp:Button ID="tb_nuevo" runat="server" CssClass="botones" 
                         Text="Agregar Nueva Oficina" onclick="tb_nuevo_Click" />
                 </asp:Panel>
                 <br />
                 <asp:Button ID="Button1" runat="server" Text="Nueva Oficina" 
                     onclick="Button1_Click" />

                 <br />
                 <br />
                
                 <asp:Label ID="Label7" runat="server" CssClass="subtitulo" 
                    Text="Lista De Oficinas"></asp:Label>
                &nbsp;<br />&nbsp;<br /><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="Id_oficina" DataSourceID="SqlDataSource1" 
                     EmptyDataText="No hay registros de datos para mostrar." 
                     onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                     ForeColor="#333333" GridLines="Both">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:CommandField SelectText="Ver Analistas" ShowSelectButton="True" >
                         <ItemStyle Font-Bold="True" />
                         </asp:CommandField>
                         <asp:BoundField DataField="Id_oficina" HeaderText="Codigo Oficina" ReadOnly="True" 
                             SortExpression="Id_oficina" InsertVisible="False" />
                         <asp:BoundField DataField="Id_compania" HeaderText="Codigo Compañia" 
                             SortExpression="Id_compania" />
                         <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                             SortExpression="Direccion" />
                         <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                             SortExpression="Telefono" />
                         <asp:BoundField DataField="Nombre" HeaderText="Departamento" 
                             SortExpression="Nombre" />
                         <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                             SortExpression="Ciudad" >
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
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                     DeleteCommand="DELETE FROM [Tabla_oficina] WHERE [Id_oficina] = @Id_oficina" 
                     InsertCommand="INSERT INTO [Tabla_oficina] ([Id_compania], [Direccion], [Telefono], [Ubicacion]) VALUES (@Id_compania, @Direccion, @Telefono, @Ubicacion)" 
                     ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                     SelectCommand="SELECT Tabla_oficina.Id_oficina, Tabla_oficina.Id_compania, Tabla_oficina.Direccion, Tabla_oficina.Telefono, Tabla_Ciudades.Ciudad, Tabla_departamentos.Nombre FROM Tabla_oficina INNER JOIN Tabla_Ciudades ON Tabla_Ciudades.Id_ciudad = Tabla_oficina.Ubicacion INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_oficina.Id_compania = @idompae)" 
                     
                     UpdateCommand="UPDATE Tabla_oficina SET Direccion = @Direccion, Telefono = @Telefono WHERE (Id_oficina = @Id_oficina)">
                     <DeleteParameters>
                         <asp:Parameter Name="Id_oficina" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="Id_compania" Type="Int32" />
                         <asp:Parameter Name="Direccion" Type="String" />
                         <asp:Parameter Name="Telefono" Type="Int64" />
                         <asp:Parameter Name="Ubicacion" Type="Int32" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:SessionParameter Name="idompae" SessionField="idcliente" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Direccion" />
                         <asp:Parameter Name="Telefono" />
                         <asp:Parameter Name="Id_oficina" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
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
                 <br />
                 
                 <asp:Button ID="tb_edicion" runat="server" CssClass="botones" 
                    Text="Habilitar Edición" onclick="tb_edicion_Click" Visible="False" />


                 &nbsp;&nbsp;<asp:Button ID="tb_eliminacion" runat="server" CssClass="botones" 
                    Text="Habilitar Eliminación" onclick="tb_eliminacion_Click" 
                     Visible="False" />

                 &nbsp;

                <br />

            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />


        </div>
</asp:Content>

