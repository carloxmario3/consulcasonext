<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="FotosPage.aspx.cs" Inherits="Multimedia_FotosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
    <div align="center">
    
   <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>
    
        <br />
        <br />
    
     <asp:Image ID="Image1" runat="server" BorderStyle="Double" />

    
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

    
      <br />
    
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
    
        <br />
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
    
        <asp:Button ID="Button2" runat="server" Text="Subir Fotos" 
            onclick="Button2_Click" />
	
        <br />
    

    <br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id_Fotos" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay registros de datos para mostrar."
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

                <asp:BoundField DataField="Id_Fotos" HeaderText="Codigo Fotos" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Id_Fotos" />
                <asp:BoundField DataField="Id_informe" HeaderText="Pertenece a Informe Cod" 
                    SortExpression="Id_informe" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion Foto" 
                    SortExpression="Tipodedocumento" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                    SortExpression="Nombre" Visible="False" />

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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Tabla_Fotos] WHERE [Id_Fotos] = @Id_Fotos" 
            InsertCommand="INSERT INTO [Tabla_Fotos] ([Id_informe], [Tipodedocumento], [Ruta], [Id_estadodocus]) VALUES (@Id_informe, @Tipodedocumento, @Ruta, @Id_estadodocus)" 
            ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
            SelectCommand="SELECT Tabla_Fotos.Id_Fotos, Tabla_Fotos.Id_informe, Tabla_Fotos.Tipodedocumento, Tabla_Fotos.Ruta, Tabla_estadodocus.Nombre FROM Tabla_Fotos INNER JOIN Tabla_estadodocus ON Tabla_Fotos.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_Fotos.Id_informe = @fdg)" 
            UpdateCommand="UPDATE [Tabla_Fotos] SET [Id_informe] = @Id_informe, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta, [Id_estadodocus] = @Id_estadodocus WHERE [Id_Fotos] = @Id_Fotos">
            <DeleteParameters>
                <asp:Parameter Name="Id_Fotos" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id_informe" Type="Int32" />
                <asp:Parameter Name="Tipodedocumento" Type="String" />
                <asp:Parameter Name="Ruta" Type="String" />
                <asp:Parameter Name="Id_estadodocus" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="fdg" SessionField="NumeroDeInforme" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_informe" Type="Int32" />
                <asp:Parameter Name="Tipodedocumento" Type="String" />
                <asp:Parameter Name="Ruta" Type="String" />
                <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                <asp:Parameter Name="Id_Fotos" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    <br />

        <br />
        <br />

    <br />

    <br />

    </div>

</asp:Content>

