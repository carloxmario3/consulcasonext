<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InformesPage.aspx.cs" Inherits="Documentacion_InformesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
 

    <div align="center"  >
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />
        <div align="center">
            <asp:Label ID="Label1" runat="server" CssClass="titulos" 
                Text="Informes"></asp:Label>
            <a name="Ancla1"></a>
        </div>
       
                <div align="center">
                    <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
                <br />


                                <asp:Label ID="Label2" runat="server"></asp:Label>


                                <br />


                                <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Nuevo Informe" />
                    <br />
                <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id_informe" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay registros de datos para mostrar." 
                        onselectedindexchanged="GridView3_SelectedIndexChanged"
                        onrowcommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
               
                <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="VerAnexo" Text="Ver" />
                                </ItemTemplate>
                            </asp:TemplateField>
               
                <asp:BoundField DataField="Id_informe" HeaderText="Codigo Informe" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Id_informe" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                    SortExpression="Id_numero_de_Caso" />
                <asp:BoundField DataField="Ruta_word" HeaderText="Archivo" 
                    SortExpression="Ruta_word" />
                <asp:BoundField DataField="Nombre" HeaderText="Tipo De Informe" 
                    SortExpression="Nombre" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Expr1" HeaderText="Estado Informe" 
                    SortExpression="Expr1" >
            
                <ItemStyle Font-Bold="True" ForeColor="#0066FF" />
                </asp:BoundField>
            
               <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Actualizara" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="ActualizarAnexo" Text="Actualizar" />
                                </ItemTemplate>
                            </asp:TemplateField>
            
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Tabla_informes] WHERE [Id_informe] = @Id_informe" 
            InsertCommand="INSERT INTO [Tabla_informes] ([Id_tipoinforme], [Id_numero_de_Caso], [Ruta_Pdf], [Ruta_word], [Id_estadodocus]) VALUES (@Id_tipoinforme, @Id_numero_de_Caso, @Ruta_Pdf, @Ruta_word, @Id_estadodocus)" 
            ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
            SelectCommand="SELECT Tabla_informes.Id_informe, Tabla_informes.Id_numero_de_Caso, Tabla_informes.Ruta_word, Tabla_Tipodeinforme.Nombre, Tabla_estadodocus.Nombre AS Expr1 FROM Tabla_informes INNER JOIN Tabla_Tipodeinforme ON Tabla_informes.Id_tipoinforme = Tabla_Tipodeinforme.Id_tipoinforme INNER JOIN Tabla_estadodocus ON Tabla_informes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_informes.Id_numero_de_Caso = @sdfs)" 
            UpdateCommand="UPDATE [Tabla_informes] SET [Id_tipoinforme] = @Id_tipoinforme, [Id_numero_de_Caso] = @Id_numero_de_Caso, [Ruta_Pdf] = @Ruta_Pdf, [Ruta_word] = @Ruta_word, [Id_estadodocus] = @Id_estadodocus WHERE [Id_informe] = @Id_informe">
            <DeleteParameters>
                <asp:Parameter Name="Id_informe" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_tipoinforme" Type="Int32" />
                <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                <asp:Parameter Name="Ruta_Pdf" Type="String" />
                <asp:Parameter Name="Ruta_word" Type="String" />
                <asp:Parameter Name="Id_estadodocus" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="sdfs" SessionField="NumeroDeCaso" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_tipoinforme" Type="Int32" />
                <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                <asp:Parameter Name="Ruta_Pdf" Type="String" />
                <asp:Parameter Name="Ruta_word" Type="String" />
                <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                <asp:Parameter Name="Id_informe" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
                    <br />
                    <br />&nbsp;&nbsp;&nbsp;<br />

     <a name="Ancla2"></a>
                </div>
            
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    <br />

    <br />

    </div>   

</asp:Content>

