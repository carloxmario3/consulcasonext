<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InfoLaboralPage.aspx.cs" Inherits="Contenidos_InfoLaboralPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Informacion Laboral " CssClass="titulos" ></asp:Label>
  
 &nbsp;<asp:Label ID="lb_tipolaborales" runat="server" CssClass="titulos" ></asp:Label>
  
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
                        <asp:Label ID="Label8" runat="server" Text="Nombre Empresa" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label9" runat="server" Text="Dirección" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label10" runat="server" Text="Teléfono" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label11" runat="server" Text="Fax" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:TextBox ID="tb_empresa" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_direccion" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_telefono" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_fax" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label12" runat="server" Text="Barrio" CssClass="subtitulo"></asp:Label>
                        <br />
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label13" runat="server" Text="Email Empresa" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="Departamento" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label7" runat="server" Text="Ciudad" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:TextBox ID="tb_barrio" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_mailempresa" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label14" runat="server" Text="Persona Contacto" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label15" runat="server" Text="Extensión" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label16" runat="server" Text="Celular" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:Label ID="Label17" runat="server" Text="Cargo" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:TextBox ID="tb_personaconta" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_extencion" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_celular" runat="server"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="tb_cargo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label18" runat="server" Text="Email contacto" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style2">
                        <asp:TextBox ID="tb_emailcontacto" runat="server"></asp:TextBox>
                    </td>
                    <td align="center" class="style2">
                        &nbsp;</td>
                    <td align="center" class="style2">
                        &nbsp;</td>
                    <td align="center" class="style2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                </tr>
            </table>
                 <br />
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Listo" />
        </asp:Panel>


                <br />
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <asp:Label ID="lb_info_operacion2" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <br />


                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Agregar Informacion Laboral" />


                                <br />
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id_laborales" 
                    EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" 
                    ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id_laborales" HeaderText="Codigo Laborales" 
                            ReadOnly="True" SortExpression="Id_laborales" />
                        <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                            SortExpression="Id_afiliado" />
                        <asp:BoundField DataField="Id_reclamantes" HeaderText="Codigo Reclamantes" 
                            SortExpression="Id_reclamantes" />
                        <asp:BoundField DataField="Nombre_empresa" HeaderText="Empresa" 
                            SortExpression="Nombre_empresa" >
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
                            SortExpression="Email_empresa" >
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
                        <asp:BoundField DataField="Persona_Contacto" HeaderText="Persona Contacto" 
                            SortExpression="Persona_Contacto" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Extencion" HeaderText="Extencion" 
                            SortExpression="Extencion" />
                        <asp:BoundField DataField="Celular" HeaderText="Celular" 
                            SortExpression="Celular" />
                        <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email_contacto" HeaderText="Email Contacto" 
                            SortExpression="Email_contacto" >
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
                    DeleteCommand="DELETE FROM [Tabla_laborales] WHERE [Id_laborales] = @Id_laborales" 
                    InsertCommand="INSERT INTO [Tabla_laborales] ([Id_afiliado], [Id_reclamantes], [Barrio], [Cargo], [Celular], [Ciudad], [Direccion], [Email_contacto], [Email_empresa], [Extencion], [Fax], [Nombre_empresa], [Persona_Contacto], [Telefono]) VALUES (@Id_afiliado, @Id_reclamantes, @Barrio, @Cargo, @Celular, @Ciudad, @Direccion, @Email_contacto, @Email_empresa, @Extencion, @Fax, @Nombre_empresa, @Persona_Contacto, @Telefono)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Id_laborales, Id_afiliado, Id_reclamantes, Barrio, Cargo, Celular, Direccion, Email_contacto, Email_empresa, Extencion, Fax, Nombre_empresa, Persona_Contacto, Telefono, Ciudad FROM Tabla_laborales WHERE (Id_afiliado = @fdgsfd)" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE Tabla_laborales SET Barrio = @Barrio, Cargo = @Cargo, Celular = @Celular, Direccion = @Direccion, Email_contacto = @Email_contacto, Email_empresa = @Email_empresa, Extencion = @Extencion, Fax = @Fax, Nombre_empresa = @Nombre_empresa, Persona_Contacto = @Persona_Contacto, Telefono = @Telefono, Ciudad = @Ciudad WHERE (Id_laborales = @Id_laborales)">
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
                        <asp:Parameter Name="Barrio" />
                        <asp:Parameter Name="Cargo" />
                        <asp:Parameter Name="Celular" />
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Email_contacto" />
                        <asp:Parameter Name="Email_empresa" />
                        <asp:Parameter Name="Extencion" />
                        <asp:Parameter Name="Fax" />
                        <asp:Parameter Name="Nombre_empresa" />
                        <asp:Parameter Name="Persona_Contacto" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Id_laborales" />
                        <asp:Parameter Name="Ciudad" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_laborales] WHERE [Id_laborales] = @Id_laborales" 
                    InsertCommand="INSERT INTO [Tabla_laborales] ([Id_afiliado], [Id_reclamantes], [Barrio], [Cargo], [Celular], [Ciudad], [Direccion], [Email_contacto], [Email_empresa], [Extencion], [Fax], [Nombre_empresa], [Persona_Contacto], [Telefono]) VALUES (@Id_afiliado, @Id_reclamantes, @Barrio, @Cargo, @Celular, @Ciudad, @Direccion, @Email_contacto, @Email_empresa, @Extencion, @Fax, @Nombre_empresa, @Persona_Contacto, @Telefono)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Id_laborales, Id_afiliado, Id_reclamantes, Barrio, Cargo, Celular, Direccion, Email_contacto, Email_empresa, Extencion, Fax, Nombre_empresa, Persona_Contacto, Telefono, Ciudad FROM Tabla_laborales WHERE (Id_reclamantes = @recla)" 
                    
                    
                    
                    UpdateCommand="UPDATE Tabla_laborales SET Barrio = @Barrio, Cargo = @Cargo, Celular = @Celular, Direccion = @Direccion, Email_contacto = @Email_contacto, Email_empresa = @Email_empresa, Extencion = @Extencion, Fax = @Fax, Nombre_empresa = @Nombre_empresa, Persona_Contacto = @Persona_Contacto, Telefono = @Telefono, Ciudad = @Ciudad WHERE (Id_laborales = @Id_laborales)">
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
                        <asp:Parameter Name="Barrio" />
                        <asp:Parameter Name="Cargo" />
                        <asp:Parameter Name="Celular" />
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Email_contacto" />
                        <asp:Parameter Name="Email_empresa" />
                        <asp:Parameter Name="Extencion" />
                        <asp:Parameter Name="Fax" />
                        <asp:Parameter Name="Nombre_empresa" />
                        <asp:Parameter Name="Persona_Contacto" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Id_laborales" />
                        <asp:Parameter Name="Ciudad" />
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
                &nbsp;&nbsp;<br />&nbsp;<br />&nbsp;&nbsp;<asp:Button ID="b_edicion" 
                    runat="server" CssClass="botones" Height="26px" 
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

