<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="NuevoCasoPage.aspx.cs" Inherits="Contenidos_NuevoCasoPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />
    
    <div align="center">


      
        <asp:Label ID="Label2" runat="server" CssClass="titulos" ></asp:Label>
  
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

    </div>
         
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            

            <div align="center">


            <br />
                <asp:Label ID="Label89" runat="server" CssClass="subtitulo" Font-Size="Medium" 
                    Text="1. Seleccione El Tipo De Caso fff"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList4" runat="server">
                </asp:DropDownList>
            <br />
            <br />



                <asp:Panel ID="pn_Dcaso" runat="server" BackColor="#FFCC00">
                    <div align="center">
                        <asp:Label ID="Label33" runat="server" CssClass="subtitulo" Font-Size="Larger" 
                            Text="2). Diligencie Los Campos Relacionados Con La Misión"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label27" runat="server" CssClass="subtitulo" 
                            Font-Size="XX-Large" Text="Datos Del Afiliado"></asp:Label>
                        <br />
                        <asp:Label ID="Label31" runat="server" Font-Underline="True" 
                            ForeColor="#3333CC" Text="Recuerde Diligenciar Todos Los Campos"></asp:Label>
                        <br />
                        <table border="1" cellspacing="5" style="height: 71px">
                            <tr>
                                <td class="style1">
                                    <asp:Label ID="Label3" runat="server" CssClass="subtitulo" Text="Nombre"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:Label ID="Label4" runat="server" CssClass="subtitulo" Text="Apellido"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:TextBox ID="tb_nombre" runat="server" AutoCompleteType="LastName"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="tb_nombre" CssClass="validacion" 
                                        ErrorMessage="Campo Obligatorio" Font-Bold="True" BackColor="White" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style1">
                                    <asp:TextBox ID="tb_apellido" runat="server" AutoCompleteType="FirstName"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="tb_apellido" CssClass="validacion" 
                                        ErrorMessage="Campo Obligatorio" Font-Bold="True" BackColor="White" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2">
                                    &nbsp;</td>
                                <td class="style2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2">
                                    <asp:Label ID="Label90" runat="server" CssClass="subtitulo" Text="Cedula"></asp:Label>
                                </td>
                                <td class="style2">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="tb_cedula" runat="server" AutoCompleteType="Cellular"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="tb_cedula" CssClass="validacion" 
                                        ErrorMessage="Campo Obligatorio" Font-Bold="True" BackColor="White" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                        ControlToValidate="tb_cedula" CssClass="validacion" 
                                        ErrorMessage="Solo Numeros Sin Puntos o Comas" MaximumValue="99999999999999999999" 
                                        MinimumValue="1" Type="Double"></asp:RangeValidator>
                                    <br />
                                </td>
                                <td class="style2">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:Label ID="Label30" runat="server" Font-Underline="True" 
                            ForeColor="#3333CC" Text="Cedula, Unicamente Numeros, Sin Puntos Ni Espacios"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <br />







            <br />

             <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC00">
                 <br />
            <table border = "1" cellspacing = "5" style="height: 71px">
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label5" runat="server" Text="Compañía" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label6" runat="server" Text="Oficina" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label7" runat="server" Text="Analista" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList3" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label8" runat="server" Text="Fecha De Asignación" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Label ID="Label9" runat="server" Text="Fecha Posible Entrega" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="lb_fechadeasignacion" runat="server" CssClass="subtitulo" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Label ID="lb_fechadeentrega" runat="server" CssClass="subtitulo" 
                            ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Calendar ID="Calendar1" runat="server" 
                            onselectionchanged="Calendar1_SelectionChanged" CssClass="subtitulo"></asp:Calendar>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Calendar ID="Calendar2" runat="server" 
                            onselectionchanged="Calendar2_SelectionChanged" CssClass="subtitulo"></asp:Calendar>
                    </td>
                </tr>
            </table>
                 &nbsp;&nbsp;
                 <br />
                 <asp:Label ID="Label88" runat="server" CssClass="subtitulo" 
                     Text="Seleccione La Ciudad En Donde El Caso Se Realizara"></asp:Label>
                 <br />
                 <br />
                 <asp:DropDownList ID="DropDownList5" runat="server">
                 </asp:DropDownList>
                 <br />
                 <br />
        </asp:Panel>


                <asp:Label ID="LabelError" runat="server" BackColor="White" Font-Bold="True" ForeColor="Red" Text="Label" Visible="False"></asp:Label>


                <br />
                <asp:Button ID="Button3" runat="server" Font-Bold="True" 
                    onclick="Button3_Click" Text="Crear Nuevo Caso" style="height: 26px" />
                <br />
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <div align="center">
                            <asp:Image ID="Image2" runat="server" Height="31px" 
                                ImageUrl="~/imagenes/image003.gif" Width="31px" />
                            <br />
                            <asp:Label ID="Label91" runat="server" ForeColor="#000099" 
                                Text="Creando Nuevo Caso  Por Favor Espere....... "></asp:Label>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <br />


                <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Compania] WHERE [Id_compania] = @Id_compania" 
                    InsertCommand="INSERT INTO [Tabla_Compania] ([Nombre]) VALUES (@Nombre)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" SelectCommand="
SELECT Id_compania, Nombre FROM Tabla_Compania WHERE (Nombre LIKE '%' + @nombree + '%')" 
                    UpdateCommand="UPDATE [Tabla_Compania] SET [Nombre] = @Nombre WHERE [Id_compania] = @Id_compania">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_compania" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="nombree" SessionField="nombrecliente" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_compania" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
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
                        <asp:SessionParameter Name="idompae" SessionField="ComboIdCompania" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Id_oficina" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Analista] WHERE [Id_analista] = @Id_analista" 
                    InsertCommand="INSERT INTO [Tabla_Analista] ([Id_usuario], [Id_oficina], [Celular], [Extencion], [Nombres], [Apellidos], [Telefono], [Correo]) VALUES (@Id_usuario, @Id_oficina, @Celular, @Extencion, @Nombres, @Apellidos, @Telefono, @Correo)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Id_analista, Id_usuario, Id_oficina, Celular, Extencion, Nombres + ' ' + Apellidos AS Nombres, Telefono, Correo, Id_usernuevo FROM Tabla_Analista WHERE (Id_oficina = @sdf)" 
                    
                    UpdateCommand="UPDATE Tabla_Analista SET Celular = @Celular, Extencion = @Extencion, Nombres = @Nombres, Apellidos = @Apellidos, Telefono = @Telefono, Correo = @Correo WHERE (Id_analista = @Id_analista)">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_analista" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_usuario" Type="Int32" />
                        <asp:Parameter Name="Id_oficina" Type="Int32" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Extencion" Type="Int32" />
                        <asp:Parameter Name="Nombres" Type="String" />
                        <asp:Parameter Name="Apellidos" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int64" />
                        <asp:Parameter Name="Correo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="sdf" SessionField="ComboIdOficina" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Celular" />
                        <asp:Parameter Name="Extencion" />
                        <asp:Parameter Name="Nombres" />
                        <asp:Parameter Name="Apellidos" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Correo" />
                        <asp:Parameter Name="Id_analista" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Tipodecaso] WHERE [Id_tipocaso] = @Id_tipocaso" 
                    InsertCommand="INSERT INTO [Tabla_Tipodecaso] ([Nombre], [Id_clasecaso]) VALUES (@Nombre, @Id_clasecaso)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [Id_tipocaso], [Nombre], [Id_clasecaso] FROM [Tabla_Tipodecaso]" 
                    UpdateCommand="UPDATE [Tabla_Tipodecaso] SET [Nombre] = @Nombre, [Id_clasecaso] = @Id_clasecaso WHERE [Id_tipocaso] = @Id_tipocaso">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_clasecaso" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_clasecaso" Type="Int32" />
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
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
                &nbsp;&nbsp;<br />
                <br />

                 &nbsp;

    <br />

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />



</asp:Content>

