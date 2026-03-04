<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="EstadoPage.aspx.cs" Inherits="Gestion_EstadoPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Cambiar Estado De Caso" CssClass="titulos" ></asp:Label>
  
 <a name="Ancla1"></a>

    </div>
         
   
            

            <div align="center">

             <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC00" Visible="False">
            




                 <br />
                 <asp:Label ID="Label6" runat="server" Text="Asignar Caso #"></asp:Label>
                 &nbsp;<asp:Label ID="lb_ncaso" runat="server" Text="# caso"></asp:Label>
                 <br />
                 <br />
                 <asp:Label ID="Label4" runat="server" Text="Seleccione Un Estado"></asp:Label>
                 <br />
                 <br />
                 <asp:DropDownList ID="DropDownList1" runat="server">
                 </asp:DropDownList>
                 <br />
                 <br />
            




                 <br />
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Cambiar Estado" />
        </asp:Panel>


                <br />
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />
                <asp:Label ID="lb_info_operacion2" runat="server" CssClass="mensaje"></asp:Label>
                <br />


                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;<asp:Button ID="Button4" runat="server" Text="Ver Casos Activos" 
                    onclick="Button4_Click" />
                <br />
                <br />&nbsp;<asp:Button 
                    ID="Button3" runat="server" 
                    Text="Ver Casos Completos" onclick="Button3_Click" />
                &nbsp;

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" Text="Ver Casos Suspendidos" 
                    onclick="Button5_Click" />
                <br />
                <br />
                <asp:Button ID="Button6" runat="server" Text="Ver Casos Facturados" 
                    onclick="Button6_Click" />
                <br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" onrowcommand="GridView1_RowCommand" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="AddButton" runat="server" 
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                    CommandName="VerAnexo" Text="Estado" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" 
                            SortExpression="Estado" />
                        <asp:BoundField DataField="tipodecaso" HeaderText="Tipo De Caso" 
                            SortExpression="tipodecaso" />
                        <asp:BoundField DataField="afiadonombre" HeaderText="Nombre Afiliado" 
                            SortExpression="afiadonombre" />
                        <asp:BoundField DataField="afiliadoapellido" HeaderText="Apellido Afiliado" 
                            SortExpression="afiliadoapellido" />
                        <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                            SortExpression="Cedula" />
                        <asp:BoundField DataField="analistanombre" HeaderText="Nombre Analista" 
                            SortExpression="analistanombre" />
                        <asp:BoundField DataField="analistaapellido" HeaderText="Apellido Analista" 
                            SortExpression="analistaapellido" />
                        <asp:BoundField DataField="investigadornombre" HeaderText="Investigador Nombre" 
                            SortExpression="investigadornombre" />
                        <asp:BoundField DataField="investigadorapellido" 
                            HeaderText="Investigador Apellido" SortExpression="investigadorapellido" />
                        <asp:BoundField DataField="Fecha_asignacion" HeaderText="Fecha De Asignacion" 
                            SortExpression="Fecha_asignacion" />
                        <asp:BoundField DataField="Fecha_posibleentrega" 
                            HeaderText="Fecha Posible Entrega" SortExpression="Fecha_posibleentrega" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres AS analistanombre, Tabla_Investigador.Nombres AS investigadornombre, Tabla_Analista.Apellidos AS analistaapellido, Tabla_Investigador.Apellidos AS investigadorapellido, Tabla_Afiliado.Cedula, Tabla_Afiliado.Nombre AS afiadonombre, Tabla_Afiliado.Apellido AS afiliadoapellido, Tabla_Casos.Id_investigador, Tabla_Casos.Id_estado FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso WHERE (Tabla_Casos.Id_estado = @sdaa)" 
                    
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
                        <asp:SessionParameter Name="sdaa" SessionField="estadocaso" />
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
                    DeleteCommand="DELETE FROM [Tabla_Estado] WHERE [Id_estado] = @Id_estado" 
                    InsertCommand="INSERT INTO [Tabla_Estado] ([Nombre]) VALUES (@Nombre)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [Id_estado], [Nombre] FROM [Tabla_Estado]" 
                    UpdateCommand="UPDATE [Tabla_Estado] SET [Nombre] = @Nombre WHERE [Id_estado] = @Id_estado">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_estado" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_estado" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    <br />
                <br />
                &nbsp;&nbsp;<br />
                <br />
                &nbsp; &nbsp;<br />

     <a name="Ancla2"></a>


       
         <br />
            <br />


</asp:Content>

