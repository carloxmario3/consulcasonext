<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InvestigadoresPage.aspx.cs" Inherits="Administracion_InvestigadoresPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">
    
    

        <br />
    
    

        <asp:Label ID="Label2" runat="server" 
            Text="Panel De Administracion De Investigadores" CssClass="titulos" ></asp:Label>
            
    

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

                
                <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC00" Visible="False">
                    <table border="1" cellspacing="5" style="height: 71px">
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label4" runat="server" CssClass="subtitulo" Text="Nombres"></asp:Label>
                                <br />
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" CssClass="subtitulo" Text="Apellidos"></asp:Label>
                                <br />
                            </td>
                            <td>
                                <asp:Label ID="Label13" runat="server" CssClass="subtitulo" Text="Cedula" 
                                    ></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <br />
                                <asp:TextBox ID="tb_nombre" runat="server" CssClass="cajastexto" Width="215px"></asp:TextBox>
                            </td>
                            <td>
                                <br />
                                <asp:TextBox ID="tb_apellido" runat="server" CssClass="cajastexto" 
                                    Width="222px"></asp:TextBox>
                            </td>
                            <td>
                                <br />
                                <asp:TextBox ID="tb_cedula" runat="server" CssClass="cajastexto" Width="194px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:Label ID="Label3" runat="server" CssClass="subtitulo" 
                                    Text="Correo Electronico"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" CssClass="subtitulo" Text="Telefono Fijo"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" CssClass="subtitulo" Text="Celular"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:TextBox ID="tb_correo" runat="server" CssClass="cajastexto" Width="174px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_telefono" runat="server" CssClass="cajastexto" 
                                    Width="154px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_celular" runat="server" CssClass="cajastexto" Width="147px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:Label ID="Label7" runat="server" CssClass="subtitulo" Text="Direccion"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label11" runat="server" CssClass="subtitulo" Text="Barrio"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:TextBox ID="tb_direccion" runat="server" CssClass="cajastexto" 
                                    Width="174px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                                <asp:TextBox ID="tb_barrio" runat="server" CssClass="cajastexto" Width="174px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:Label ID="Label9" runat="server" CssClass="subtitulo" Text="Departamento"></asp:Label>
                            </td>
                            <td colspan="1">
                                <asp:Label ID="Label14" runat="server" CssClass="subtitulo" Text="Ciudad"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td colspan="1">
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="tb_nuevo" runat="server" CssClass="botones" 
                        Text="Agregar Nuevo Investigador" onclick="tb_nuevo_Click" />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="subtitulo"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Nuevo Investigador" 
                    onclick="Button1_Click" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id_Investigador" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                    ForeColor="#333333" GridLines="Both">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Inicio De Sesion" ShowSelectButton="True" >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id_Investigador" HeaderText="Codigo Investigador" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_Investigador" />
                        <asp:BoundField DataField="Id_usuario" HeaderText="Codigo Usuario" 
                            SortExpression="Id_usuario" />
                        <asp:BoundField DataField="Id_usernuevo" HeaderText="Codigo Global" 
                            SortExpression="Id_usernuevo" />
                        <asp:BoundField DataField="Nombres" HeaderText="Nombres" 
                            SortExpression="Nombres" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" 
                            SortExpression="Apellidos" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                            SortExpression="Cedula" />
                        <asp:BoundField DataField="Correo" HeaderText="Correo Electronico" 
                            SortExpression="Correo" />
                        <asp:BoundField DataField="Telefono_fijo" HeaderText="Telefono Fijo" 
                            SortExpression="Telefono_fijo" />
                        <asp:BoundField DataField="Celular" HeaderText="Celular" 
                            SortExpression="Celular" />
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                            SortExpression="Direccion" />
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                            SortExpression="Ciudad" />
                        <asp:BoundField DataField="Barrio" HeaderText="Barrio" 
                            SortExpression="Barrio" />
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
                    DeleteCommand="DELETE FROM [Tabla_Investigador] WHERE [Id_Investigador] = @Id_Investigador" 
                    InsertCommand="INSERT INTO [Tabla_Investigador] ([Id_usuario], [Barrio], [Cedula], [Celular], [Ubicacion], [Apellidos], [Nombres], [Direccion], [Telefono_fijo], [Correo], [Id_usernuevo]) VALUES (@Id_usuario, @Barrio, @Cedula, @Celular, @Ubicacion, @Apellidos, @Nombres, @Direccion, @Telefono_fijo, @Correo, @Id_usernuevo)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Investigador.Id_Investigador, Tabla_Investigador.Id_usuario, Tabla_Investigador.Barrio, Tabla_Investigador.Cedula, Tabla_Investigador.Celular, Tabla_Investigador.Apellidos, Tabla_Investigador.Nombres, Tabla_Investigador.Direccion, Tabla_Investigador.Telefono_fijo, Tabla_Investigador.Correo, Tabla_Investigador.Id_usernuevo, Tabla_Ciudades.Ciudad FROM Tabla_Investigador INNER JOIN Tabla_Ciudades ON Tabla_Investigador.Ubicacion = Tabla_Ciudades.Id_ciudad" 
                    UpdateCommand="UPDATE [Tabla_Investigador] SET [Id_usuario] = @Id_usuario, [Barrio] = @Barrio, [Cedula] = @Cedula, [Celular] = @Celular, [Ubicacion] = @Ubicacion, [Apellidos] = @Apellidos, [Nombres] = @Nombres, [Direccion] = @Direccion, [Telefono_fijo] = @Telefono_fijo, [Correo] = @Correo, [Id_usernuevo] = @Id_usernuevo WHERE [Id_Investigador] = @Id_Investigador">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_Investigador" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_usuario" Type="Int32" />
                        <asp:Parameter Name="Barrio" Type="String" />
                        <asp:Parameter Name="Cedula" Type="Int64" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Ubicacion" Type="Int32" />
                        <asp:Parameter Name="Apellidos" Type="String" />
                        <asp:Parameter Name="Nombres" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Telefono_fijo" Type="Int64" />
                        <asp:Parameter Name="Correo" Type="String" />
                        <asp:Parameter Name="Id_usernuevo" Type="Object" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id_usuario" Type="Int32" />
                        <asp:Parameter Name="Barrio" Type="String" />
                        <asp:Parameter Name="Cedula" Type="Int64" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Ubicacion" Type="Int32" />
                        <asp:Parameter Name="Apellidos" Type="String" />
                        <asp:Parameter Name="Nombres" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Telefono_fijo" Type="Int64" />
                        <asp:Parameter Name="Correo" Type="String" />
                        <asp:Parameter Name="Id_usernuevo" Type="Object" />
                        <asp:Parameter Name="Id_Investigador" Type="Int32" />
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

            <br />
                <asp:Button ID="tb_edicion" runat="server" CssClass="botones" 
                    Text="Habilitar Edición" onclick="tb_edicion_Click" Visible="False" />
                &nbsp;
                <asp:Button ID="tb_eliminacion" runat="server" CssClass="botones" 
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

