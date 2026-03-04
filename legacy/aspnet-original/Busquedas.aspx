<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="Busquedas.aspx.cs" Inherits="Busquedas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Buscador Casos" CssClass="titulos" ></asp:Label>
  
 <a name="Ancla1"></a>

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


                <br />
                <br />
                <br />
                <table border="1" cellspacing="5" style="height: 71px">
                    <tr>
                        <td class="style1">
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="style1">
                            &nbsp;</td>
                        <td class="style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:TextBox ID="TextBox1" runat="server" Width="172px"></asp:TextBox>
                            <br />
                        </td>
                        <td class="style2">
                            <asp:DropDownList ID="DropDownListbusqueda" runat="server" 
                                onselectedindexchanged="DropDownListbusqueda_SelectedIndexChanged">
                                <asp:ListItem Value="0">Numero De Caso</asp:ListItem>
                                <asp:ListItem Value="1">Afiliado Nombre y/o Apellido </asp:ListItem>
                                <asp:ListItem Value="2">Afiliado Cedula</asp:ListItem>
                                <asp:ListItem Value="3">Reclamante Nombre y/o Apellido </asp:ListItem>
                                <asp:ListItem Value="4">Reclamante Cedula</asp:ListItem>
                                <asp:ListItem Value="5">Nombre De La Empresa</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style2" style="margin-left: 40px">
                            <asp:Button ID="Button8" runat="server" Text="Buscar" onclick="Button8_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <br />
                        </td>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                numero de caso<br />
                <br />
                <asp:GridView ID="GridViewnumerocaso" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource5" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" Visible="False" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Caso" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres AS analistanombre, Tabla_Investigador.Nombres AS investigadornombre, Tabla_Analista.Apellidos AS analistaapellido, Tabla_Investigador.Apellidos AS investigadorapellido, Tabla_Afiliado.Cedula, Tabla_Afiliado.Nombre AS afiadonombre, Tabla_Afiliado.Apellido AS afiliadoapellido, Tabla_Casos.Id_estado, Tabla_Investigador.Correo, Tabla_Analista.Correo AS Expr1 FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso WHERE (Tabla_Casos.Id_Numero_Caso = @numerocaso)" 
                    
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
                        <asp:SessionParameter Name="numerocaso" SessionField="busquedasnumerodecaso" />
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
                <br />
                <br />
                afiliados<br />
                <br />


                <asp:GridView ID="GridViewAfiliados" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" Visible="False" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Id_Numero_Caso" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                        <asp:BoundField DataField="Nombre Afiliado" HeaderText="Nombre Afiliado" 
                            SortExpression="Nombre Afiliado" ReadOnly="True" />
                        <asp:BoundField DataField="CedulaAfiliado" HeaderText="CedulaAfiliado" 
                            SortExpression="CedulaAfiliado" />
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
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido AS [Nombre Afiliado], CONVERT (varchar, Tabla_Afiliado.Cedula) AS CedulaAfiliado FROM Tabla_Casos INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso WHERE (CONVERT (varchar, Tabla_Afiliado.Cedula) LIKE @cedula) AND (Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido LIKE '%' + @afiliado + '%')" 
                    
                    
                    
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
                        <asp:SessionParameter Name="cedula" SessionField="busquedasafiliadocedula" />
                        <asp:SessionParameter Name="afiliado" SessionField="busquedasafiliado" />
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
                reclamantes<br />


                <br />
                &nbsp;&nbsp;
                <asp:GridView ID="GridViewreclamante" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource2" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Id_Numero_Caso" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                        <asp:BoundField DataField="Nombres" HeaderText="Nombres" ReadOnly="True" 
                            SortExpression="Nombres" />
                        <asp:BoundField DataField="Expr1" HeaderText="Expr1" 
                            SortExpression="Expr1" ReadOnly="True" />
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


                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Reclamantes.Nombre + ' ' + Tabla_Reclamantes.Apellido AS Nombres, CONVERT (varchar, Tabla_Reclamantes.Cedula) AS Expr1 FROM Tabla_Casos INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_Reclamantes ON Tabla_Afiliado.Id_afiliado = Tabla_Reclamantes.Id_afiliado WHERE (Tabla_Reclamantes.Nombre + ' ' + Tabla_Reclamantes.Apellido LIKE '%' + @reclamantes + '%') AND (CONVERT (varchar, Tabla_Reclamantes.Cedula) LIKE @cedula)" 
                    
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
                        <asp:SessionParameter Name="reclamantes" SessionField="busquedasReclamante" />
                        <asp:SessionParameter Name="cedula" SessionField="busquedasReclamantecedula" />
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
    <br />
                <br />
                Afiliados Empresa<br />
                <br />
                &nbsp;&nbsp;<br />
                <asp:GridView ID="GridViewRecAfiliado" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource4" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Id_Numero_Caso" 
                            SortExpression="Id_Numero_Caso" />
                        <asp:BoundField DataField="Nombre_empresa" HeaderText="Nombre_empresa" 
                            SortExpression="Nombre_empresa" />
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
                &nbsp;

                <br />

                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Afiliado.Id_Numero_Caso, Tabla_laborales.Nombre_empresa FROM Tabla_laborales INNER JOIN Tabla_Afiliado ON Tabla_laborales.Id_afiliado = Tabla_Afiliado.Id_afiliado WHERE (Tabla_laborales.Nombre_empresa LIKE '%' + @empresa + '%')" 
                    
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
                        <asp:SessionParameter Name="empresa" SessionField="busquedasEmpresa" />
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
                Reclamantes Empresa<br />
                <br />


                <asp:GridView ID="GridViewRecEmpresa" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource3" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Id_Numero_Caso" 
                            SortExpression="Id_Numero_Caso" />
                        <asp:BoundField DataField="Nombre_empresa" HeaderText="Nombre_empresa" 
                            SortExpression="Nombre_empresa" />
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Reclamantes.Id_Numero_Caso, Tabla_laborales.Nombre_empresa FROM Tabla_laborales INNER JOIN Tabla_Reclamantes ON Tabla_laborales.Id_reclamantes = Tabla_Reclamantes.Id_reclamantes WHERE (Tabla_laborales.Nombre_empresa LIKE '%' + @empresa + '%')" 
                    
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
                        <asp:SessionParameter Name="empresa" SessionField="busquedasEmpresa" />
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

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />



</asp:Content>

