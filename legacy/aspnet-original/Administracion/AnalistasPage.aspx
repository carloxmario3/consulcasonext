<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="AnalistasPage.aspx.cs" Inherits="Administracion_AnalistasPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">
    
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True" NavigateUrl="~/Administracion/OficinasPage.aspx">Atras</asp:HyperLink>
    
      <br />
        <asp:Label ID="Label2" runat="server" 
            Text="Panel De Administracion De Analista" CssClass="titulos" ></asp:Label>
         <br />
         <br />
         <asp:Label ID="lb_nombre_cliente" runat="server" Text="Nombre Del Cliente" 
             CssClass="titulos" Font-Bold="False"></asp:Label>
         <br />
         <br />
         <asp:Label ID="lb_oficina" runat="server" Text="Ciudad y Cod Oficina" 
             CssClass="titulos" Font-Bold="False" Font-Size="X-Large"></asp:Label>
         <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                
                <div align="center">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/image003.gif" 
                Height="31px" Width="31px" />
            <br />
            Cargando</div>

            </ProgressTemplate>
        </asp:UpdateProgress>
        <br />
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
                                <asp:Label ID="Label3" runat="server" CssClass="subtitulo" 
                                    Text="Correo Electronico"></asp:Label>
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
                                <asp:TextBox ID="tb_correo" runat="server" CssClass="cajastexto" Width="194px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:Label ID="Label6" runat="server" CssClass="subtitulo" Text="Telefono"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server" CssClass="subtitulo" Text="Extencion"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label8" runat="server" CssClass="subtitulo" Text="Celular"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td 2"="">
                                <asp:TextBox ID="tb_telefono" runat="server" CssClass="cajastexto" 
                                    Width="174px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_extencion" runat="server" CssClass="cajastexto" 
                                    Width="103px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_celular" runat="server" CssClass="cajastexto" Width="147px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="tb_nuevo" runat="server" CssClass="botones" 
                        Text="Agregar Nuevo Analista" onclick="tb_nuevo_Click" />
                </asp:Panel>
                <br />
                <asp:Button ID="tb_eliminacion0" runat="server" CssClass="botones" 
                    Text="Nuevo Analista" onclick="tb_eliminacion0_Click" />
                <br />
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="subtitulo"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id_analista" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                    ForeColor="#333333" GridLines="Both">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Inicio De Sesion" ShowSelectButton="True" >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id_analista" HeaderText="Codigo Analista" 
                            ReadOnly="True" SortExpression="Id_analista" InsertVisible="False" />
                        <asp:BoundField DataField="Id_usuario" HeaderText="Codigo Usuario" 
                            SortExpression="Id_usuario" />
                        <asp:BoundField DataField="Id_oficina" HeaderText="Codigo Oficina" 
                            SortExpression="Id_oficina" />
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
                        <asp:BoundField DataField="Correo" HeaderText="Correo" 
                            SortExpression="Correo" />
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                            SortExpression="Telefono" />
                        <asp:BoundField DataField="Extencion" HeaderText="Extencion" 
                            SortExpression="Extencion" />
                        <asp:BoundField DataField="Celular" HeaderText="Celular" 
                            SortExpression="Celular" />
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
                    DeleteCommand="DELETE FROM [Tabla_Analista] WHERE [Id_analista] = @Id_analista" 
                    InsertCommand="INSERT INTO [Tabla_Analista] ([Id_usuario], [Id_oficina], [Celular], [Extencion], [Nombres], [Apellidos], [Telefono], [Correo]) VALUES (@Id_usuario, @Id_oficina, @Celular, @Extencion, @Nombres, @Apellidos, @Telefono, @Correo)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Id_analista, Id_usuario, Id_oficina, Celular, Extencion, Nombres, Apellidos, Telefono, Correo, Id_usernuevo FROM Tabla_Analista WHERE (Id_oficina = @sdf)" 
                    
                    
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
                        <asp:SessionParameter Name="sdf" SessionField="codigooficina" />
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


            <br />
                <br />
                <br />
                <asp:Button ID="tb_edicion" runat="server" CssClass="botones" 
                    Text="Habilitar Edición" onclick="tb_edicion_Click" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="tb_eliminacion" runat="server" CssClass="botones" 
                    Text="Habilitar Eliminación" onclick="tb_eliminacion_Click" 
                    Visible="False" />
                &nbsp;&nbsp;
            </ContentTemplate>

            </asp:UpdatePanel>


</asp:Content>

