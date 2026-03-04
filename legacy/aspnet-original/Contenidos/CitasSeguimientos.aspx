<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="CitasSeguimientos.aspx.cs" Inherits="Contenidos_CitasSeguimientos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Citas Programadas (Seguimientos)" CssClass="titulos" ></asp:Label>
  
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


                <asp:Label ID="lb_info_operacion2" runat="server"></asp:Label>


                <br />
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <br />


                                <asp:DropDownList ID="DropDownList1" runat="server" 
                    AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem Value="/1/">Enero</asp:ListItem>
                                    <asp:ListItem Value="/2/">Febrero</asp:ListItem>
                                    <asp:ListItem Value="/3/">Marzo</asp:ListItem>
                                    <asp:ListItem Value="/4/">Abril</asp:ListItem>
                                    <asp:ListItem Value="/5/">Mayo</asp:ListItem>
                                    <asp:ListItem Value="/6/">Junio</asp:ListItem>
                                    <asp:ListItem Value="/7/">Julio</asp:ListItem>
                                    <asp:ListItem Value="/8/">Agosto</asp:ListItem>
                                    <asp:ListItem Value="/9/">Septiembre</asp:ListItem>
                                    <asp:ListItem Value="/10/">Octubre</asp:ListItem>
                                    <asp:ListItem Value="/11/">Noviembre</asp:ListItem>
                                    <asp:ListItem Value="/12/">Diciembre</asp:ListItem>
                </asp:DropDownList>
                <br />


                                <br />&nbsp;<asp:Button ID="Button3" runat="server" 
                    onclick="Button3_Click" Text="Ver Todos Los Activos" />
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Caso" ShowSelectButton="True" />
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" 
                            SortExpression="Fecha" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Id_seguimientos" HeaderText="Codigo Seguimiento" 
                            ReadOnly="True" SortExpression="Id_seguimientos" InsertVisible="False" 
                            Visible="False" />
                        <asp:BoundField DataField="Id_afiliado" HeaderText="Codigo Afiliado" 
                            SortExpression="Id_afiliado" Visible="False" />
                        <asp:BoundField DataField="Nombre_contacto" HeaderText="Nombre De Contacto" 
                            SortExpression="Nombre_contacto" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" 
                            SortExpression="Entidad" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                            SortExpression="Direccion" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="departamento" HeaderText="Departamento" 
                            SortExpression="departamento" />
                        <asp:BoundField DataField="ciudad1" HeaderText="Ciudad" 
                            SortExpression="ciudad1" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
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
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Seguimientos] WHERE [Id_seguimientos] = @Id_seguimientos" 
                    InsertCommand="INSERT INTO [Tabla_Seguimientos] ([Id_afiliado], [Celular], [Ciudad], [Direccion], [Entidad], [Extencion], [Fecha], [Hora], [Nombre_contacto], [Telefono]) VALUES (@Id_afiliado, @Celular, @Ciudad, @Direccion, @Entidad, @Extencion, @Fecha, @Hora, @Nombre_contacto, @Telefono)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Seguimientos.Id_seguimientos, Tabla_Seguimientos.Id_afiliado, Tabla_Seguimientos.Celular, Tabla_Seguimientos.Ciudad, Tabla_Seguimientos.Direccion, Tabla_Seguimientos.Entidad, Tabla_Seguimientos.Extencion, Tabla_Seguimientos.Fecha, Tabla_Seguimientos.Hora, Tabla_Seguimientos.Nombre_contacto, Tabla_Seguimientos.Telefono, Tabla_Casos.Id_Numero_Caso, Tabla_departamentos.Nombre AS ciudad, Tabla_Ciudades.Ciudad AS departamento, Tabla_Casos.Id_estado FROM Tabla_Seguimientos INNER JOIN Tabla_Ciudades ON Tabla_Seguimientos.Ciudad = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento INNER JOIN Tabla_Afiliado ON Tabla_Seguimientos.Id_afiliado = Tabla_Afiliado.Id_afiliado INNER JOIN Tabla_Casos ON Tabla_Afiliado.Id_Numero_Caso = Tabla_Casos.Id_Numero_Caso WHERE (Tabla_Casos.Id_estado = 1) AND (Tabla_Seguimientos.Fecha LIKE '%' + @fechar + '%')" 
                    
                    
                    
                    UpdateCommand="UPDATE [Tabla_Seguimientos] SET [Id_afiliado] = @Id_afiliado, [Celular] = @Celular, [Ciudad] = @Ciudad, [Direccion] = @Direccion, [Entidad] = @Entidad, [Extencion] = @Extencion, [Fecha] = @Fecha, [Hora] = @Hora, [Nombre_contacto] = @Nombre_contacto, [Telefono] = @Telefono WHERE [Id_seguimientos] = @Id_seguimientos">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_seguimientos" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_afiliado" Type="Int32" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Entidad" Type="String" />
                        <asp:Parameter Name="Extencion" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Hora" Type="String" />
                        <asp:Parameter Name="Nombre_contacto" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="fechar" SessionField="fechacitas" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id_afiliado" Type="Int32" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Ciudad" Type="String" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Entidad" Type="String" />
                        <asp:Parameter Name="Extencion" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Hora" Type="String" />
                        <asp:Parameter Name="Nombre_contacto" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int32" />
                        <asp:Parameter Name="Id_seguimientos" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />

                <br />
                &nbsp;&nbsp;<br />&nbsp;<br />
                &nbsp;&nbsp;<br />

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />






</asp:Content>

