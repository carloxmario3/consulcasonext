<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InfoReclamantesPage.aspx.cs" Inherits="Contenidos_InfoReclamantesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div align="center">


      
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />


      
        <asp:Label ID="Label2" runat="server" 
            Text="Reclamantes" CssClass="titulos" ></asp:Label>
  
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
                    <td class="style1">
                        <asp:Label ID="Label8" runat="server" Text="Nombre" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label9" runat="server" Text="Apellido" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label10" runat="server" Text="Cedula" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label6" runat="server" Text="Departamento" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label7" runat="server" Text="Ciudad" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:TextBox ID="tb_nombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="tb_apellido" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="tb_cedula" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label11" runat="server" Text="Parentesco" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label13" runat="server" Text="Dirección" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label14" runat="server" Text="Barrio" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label15" runat="server" Text="Celular" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label12" runat="server" Text="Teléfono" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:TextBox ID="tb_parentesco" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="tb_direccion" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="tb_barrio" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="tb_celular" runat="server"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="tb_telefono" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
                 <br />
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Listo" />
        </asp:Panel>


                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <asp:Label ID="lb_info_operacion2" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <br />


                                &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Agregar Reclamante" />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id_reclamantes" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                    ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Info Laboral" ShowSelectButton="True" 
                             >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id_reclamantes" HeaderText="Codigo Reclamantes" 
                            ReadOnly="True" SortExpression="Id_reclamantes" InsertVisible="False" />
                        <asp:BoundField DataField="Id_laborales" HeaderText="Codigo Documentos Laborales" 
                            SortExpression="Id_laborales" />
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
                        <asp:BoundField DataField="Parentesco" HeaderText="Parentesco" 
                            SortExpression="Parentesco" >
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
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
                        
                        <asp:CommandField  
                            ShowEditButton="True" >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>

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
                    DeleteCommand="DELETE FROM [Tabla_Reclamantes] WHERE [Id_reclamantes] = @Id_reclamantes" 
                    InsertCommand="INSERT INTO [Tabla_Reclamantes] ([Id_laborales], [Id_afiliado], [Id_Numero_Caso], [Apellido], [Barrio], [Cedula], [Celular], [Ciudad], [Direccion], [Nombre], [Parentesco], [Telefono]) VALUES (@Id_laborales, @Id_afiliado, @Id_Numero_Caso, @Apellido, @Barrio, @Cedula, @Celular, @Ciudad, @Direccion, @Nombre, @Parentesco, @Telefono)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Reclamantes.Id_reclamantes, Tabla_Reclamantes.Id_laborales, Tabla_Reclamantes.Id_afiliado, Tabla_Reclamantes.Id_Numero_Caso, Tabla_Reclamantes.Apellido, Tabla_Reclamantes.Barrio, Tabla_Reclamantes.Cedula, Tabla_Reclamantes.Celular, Tabla_Reclamantes.Ciudad, Tabla_Reclamantes.Direccion, Tabla_Reclamantes.Nombre, Tabla_Reclamantes.Parentesco, Tabla_Reclamantes.Telefono, Tabla_Ciudades.Ciudad AS Expr1, Tabla_departamentos.Nombre AS Expr2 FROM Tabla_Reclamantes INNER JOIN Tabla_Ciudades ON Tabla_Reclamantes.Ciudad = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_Reclamantes.Id_Numero_Caso = @mifuk)" 
                    
                    
                    
                    UpdateCommand="UPDATE Tabla_Reclamantes SET Apellido = @Apellido, Barrio = @Barrio, Cedula = @Cedula, Celular = @Celular, Direccion = @Direccion, Nombre = @Nombre, Parentesco = @Parentesco, Telefono = @Telefono, Ciudad = @Ciudad WHERE (Id_reclamantes = @Id_reclamantes)">
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
                        <asp:Parameter Name="Apellido" />
                        <asp:Parameter Name="Barrio" />
                        <asp:Parameter Name="Cedula" />
                        <asp:Parameter Name="Celular" />
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Nombre" />
                        <asp:Parameter Name="Parentesco" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Id_reclamantes" />
                        <asp:Parameter Name="Ciudad" />
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

