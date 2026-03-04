<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="AnexosPage.aspx.cs" Inherits="Documentacion_AnexosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center"  >
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />
        <div align="center">
            <asp:Label ID="Label1" runat="server" CssClass="titulos" Text="Anexos"></asp:Label>
            <a name="Ancla1"></a>
        </div>
       
                <div align="center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
                <br />


                                <asp:Label ID="Label2" runat="server"></asp:Label>


                                <br />


                                <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Nuevo Anexo" />
                <br />
    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Id_anexos" DataSourceID="SqlDataSource1" 
                        EmptyDataText="No hay registros de datos para mostrar." 
                        onrowcommand="GridView1_RowCommand" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged1" CellPadding="4" 
                        ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="VerAnexo" Text="Ver" />
                                </ItemTemplate>
                            </asp:TemplateField>

                           

                            <asp:BoundField DataField="Id_anexos" HeaderText="Codigo Anexo" ReadOnly="True" 
                                SortExpression="Id_anexos" />
                            <asp:BoundField DataField="Id_informe" HeaderText="Pertenece a Informe Cod" 
                                SortExpression="Id_informe" >
                            <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion Anexo" 
                                SortExpression="Tipodedocumento" />
                            <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                            <asp:BoundField DataField="Nombre" HeaderText="Estado Documento" 
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [Tabla_Anexos] WHERE [Id_anexos] = @Id_anexos" 
                        InsertCommand="INSERT INTO [Tabla_Anexos] ([Id_informe], [Tipodedocumento], [Ruta], [Id_estadodocus]) VALUES (@Id_informe, @Tipodedocumento, @Ruta, @Id_estadodocus)" 
                        ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                        SelectCommand="SELECT Tabla_Anexos.Id_anexos, Tabla_Anexos.Id_informe, Tabla_Anexos.Tipodedocumento, Tabla_Anexos.Ruta, Tabla_Anexos.Id_estadodocus, Tabla_estadodocus.Nombre FROM Tabla_Anexos INNER JOIN Tabla_estadodocus ON Tabla_Anexos.Id_estadodocus = Tabla_estadodocus.Id_estadodocus WHERE (Tabla_Anexos.Id_informe = @sdtfsd)" 
                        
                        
                        UpdateCommand="UPDATE [Tabla_Anexos] SET [Id_informe] = @Id_informe, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta, [Id_estadodocus] = @Id_estadodocus WHERE [Id_anexos] = @Id_anexos">
                        <DeleteParameters>
                            <asp:Parameter Name="Id_anexos" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id_informe" Type="Int32" />
                            <asp:Parameter Name="Tipodedocumento" Type="String" />
                            <asp:Parameter Name="Ruta" Type="String" />
                            <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="sdtfsd" SessionField="NumeroDeInforme" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Id_informe" Type="Int32" />
                            <asp:Parameter Name="Tipodedocumento" Type="String" />
                            <asp:Parameter Name="Ruta" Type="String" />
                            <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                            <asp:Parameter Name="Id_anexos" Type="Int32" />
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

