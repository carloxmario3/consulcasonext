<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="AsignarCasosPage.aspx.cs" Inherits="Gestion_AsignarCasosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div align="center">


      
        <br />


      
        <asp:Label ID="Label2" runat="server" 
            Text="Asignar Casos" CssClass="titulos" ></asp:Label>
  
 <a name="Ancla1"></a>

    </div>
         
   
            

            <div align="center">

             <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC00" Visible="False">
            
                 <asp:Label ID="Label6" runat="server" Text="Asignar Caso #" 
                     CssClass="subtitulo" Font-Size="Medium"></asp:Label>
                 &nbsp;<asp:Label ID="lb_ncaso" runat="server" Text="# caso" 
                     CssClass="subtitulo" Font-Size="X-Large"></asp:Label>
                 &nbsp;
                 <asp:Label ID="lb_nombre" runat="server" CssClass="subtitulo" 
                     Font-Size="Medium" Text="Afiliado"></asp:Label>
                 &nbsp;<asp:Label ID="lb_cedula" runat="server" CssClass="subtitulo" 
                     Font-Size="Medium" Text="Cedula #"></asp:Label>
                 <br />
                 <br />
                 <asp:Label ID="Label4" runat="server" CssClass="subtitulo" 
                     Text="Seleccione un Investigador y Oprima Asignar Caso"></asp:Label>
                 <br />
                 <br />
                 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                     onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                 </asp:DropDownList>
&nbsp;
                 <br />
                 <asp:DropDownList ID="DropDownList3" runat="server" Enabled="False" 
                     onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                 </asp:DropDownList>
                 <br />
            




                 <br />
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Asignar Caso" />
        </asp:Panel>


                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <asp:Label ID="lb_info_operacion2" runat="server" CssClass="mensaje"></asp:Label>
                <br />


                &nbsp;&nbsp;<asp:Label 
                    ID="Label5" runat="server" 
                    Text="Seleccione Un Investigador Para Ver Sus Casos Asignados" 
                    CssClass="subtitulo"></asp:Label>
                <br />
                <br />
                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" 
                    AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="Button3" runat="server" 
                    Text="Ver Casos Por Asignar" onclick="Button3_Click" />
                <br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." 
                    ForeColor="#333333" onselectedindexchanged="GridView1_SelectedIndexChanged"
                    onrowcommand="GridView1_RowCommand" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                         
                         <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="VerAnexo" Text="Asignar" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" >
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                        <asp:BoundField DataField="Estado" HeaderText="Estado" 
                            SortExpression="Estado" />
                        <asp:BoundField DataField="tipodecaso" HeaderText="Tipo De Caso" 
                            SortExpression="tipodecaso" >
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                        <asp:BoundField DataField="afiadonombre" HeaderText="Nombre Afiliado" 
                            SortExpression="afiadonombre" />
                        <asp:BoundField DataField="afiliadoapellido" HeaderText="Apellido Afiliado" 
                            SortExpression="afiliadoapellido" />
                        <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                            SortExpression="Cedula" />
                         <asp:BoundField DataField="Compania" HeaderText="Compañia" 
                             SortExpression="Compania">
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                        <asp:BoundField DataField="analistanombre" HeaderText="Nombre Analista" 
                            SortExpression="analistanombre" />
                        <asp:BoundField DataField="analistaapellido" HeaderText="Apellido Analista" 
                            SortExpression="analistaapellido" />
                        <asp:BoundField DataField="investigadornombre" HeaderText="Investigador Nombre" 
                            SortExpression="investigadornombre" >
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                        <asp:BoundField DataField="investigadorapellido" 
                            HeaderText="Investigador Apellido" SortExpression="investigadorapellido" >
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Correo" HeaderText="Correo" 
                             SortExpression="Correo" />
                        <asp:BoundField DataField="Fecha_asignacion" HeaderText="Fecha De Asignacion" 
                            SortExpression="Fecha_asignacion" />
                        <asp:BoundField DataField="Fecha_posibleentrega" 
                            HeaderText="Fecha Posible Entrega" SortExpression="Fecha_posibleentrega" >
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                        <asp:BoundField DataField="Fecha_entregareal" HeaderText="Fecha De Entrega" 
                            SortExpression="Fecha_entregareal" />
                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" 
                            SortExpression="Observaciones" />
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
                <br />
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres AS analistanombre, Tabla_Investigador.Nombres AS investigadornombre, Tabla_Analista.Apellidos AS analistaapellido, Tabla_Investigador.Apellidos AS investigadorapellido, Tabla_Afiliado.Cedula, Tabla_Afiliado.Nombre AS afiadonombre, Tabla_Afiliado.Apellido AS afiliadoapellido, Tabla_Casos.Id_investigador, Tabla_Compania.Nombre AS Compania, Tabla_Investigador.Correo FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania WHERE (Tabla_Estado.Nombre = 'Activo') AND (Tabla_Casos.Id_investigador = @sfdzs)" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [Tabla_Casos] SET [Id_tipocaso] = @Id_tipocaso, [Id_estado] = @Id_estado, [Id_analista] = @Id_analista, [Id_investigador] = @Id_investigador, [Fecha_asignacion] = @Fecha_asignacion, [Fecha_posibleentrega] = @Fecha_posibleentrega, [Fecha_entregareal] = @Fecha_entregareal, [Observaciones] = @Observaciones WHERE [Id_Numero_Caso] = @Id_Numero_Caso">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                        <asp:Parameter Name="Id_estado" Type="Int32" />
                        <asp:Parameter Name="Id_analista" Type="Int32" />
                        <asp:Parameter Name="Id_investigador" Type="Int32" />
                        <asp:Parameter Name="Fecha_asignacion" Type="String" />
                        <asp:Parameter Name="Fecha_posibleentrega" Type="String" />
                        <asp:Parameter Name="Fecha_entregareal" Type="String" />
                        <asp:Parameter Name="Observaciones" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="sfdzs" SessionField="asignadoaa" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                        <asp:Parameter Name="Id_estado" Type="Int32" />
                        <asp:Parameter Name="Id_analista" Type="Int32" />
                        <asp:Parameter Name="Id_investigador" Type="Int32" />
                        <asp:Parameter Name="Fecha_asignacion" Type="String" />
                        <asp:Parameter Name="Fecha_posibleentrega" Type="String" />
                        <asp:Parameter Name="Fecha_entregareal" Type="String" />
                        <asp:Parameter Name="Observaciones" Type="String" />
                        <asp:Parameter Name="Id_Numero_Caso" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />

                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Investigador] WHERE [Id_Investigador] = @Id_Investigador" 
                    InsertCommand="INSERT INTO [Tabla_Investigador] ([Id_usuario], [Barrio], [Cedula], [Celular], [Ubicacion], [Apellidos], [Nombres], [Direccion], [Telefono_fijo], [Correo], [Id_usernuevo]) VALUES (@Id_usuario, @Barrio, @Cedula, @Celular, @Ubicacion, @Apellidos, @Nombres, @Direccion, @Telefono_fijo, @Correo, @Id_usernuevo)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [Id_Investigador], [Id_usuario], [Barrio], [Cedula], [Celular], [Ubicacion], [Apellidos], [Nombres], [Direccion], [Telefono_fijo], [Correo], [Id_usernuevo] FROM [Tabla_Investigador]" 
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
    <br />
                <br />
                &nbsp;&nbsp;<br />
                <br />
                &nbsp; &nbsp;<br />

     <a name="Ancla2"></a>


      
         <br />
            <br />


</asp:Content>

