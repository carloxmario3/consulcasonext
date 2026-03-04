<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InformesPublicadosPage.aspx.cs" Inherits="Documentacion_InformesPublicadosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center"  >
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />
        <div align="center">
            <asp:Label ID="Label1" runat="server" CssClass="titulos" 
                Text="Nuevo Informe Para Publicar"></asp:Label>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:GridView ID="GridView2" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="Id_publicados" 
                        DataSourceID="SqlDataSource2" 
                        EmptyDataText="No hay registros de datos para mostrar."
                        onrowcommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" 
                        GridLines="Both" >
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                              <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="VerAnexo" Text="Ver" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            
                            <asp:BoundField DataField="Id_publicados" HeaderText="Codigo Publicado" 
                                ReadOnly="True" SortExpression="Id_publicados" />
                            <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                                SortExpression="Id_numero_de_Caso" />
                            <asp:BoundField DataField="Tipodedocumento" HeaderText="Descripcion" 
                                SortExpression="Tipodedocumento" />
                            <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" />
                        
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [Tabla_Publicados] WHERE [Id_publicados] = @Id_publicados" 
                        InsertCommand="INSERT INTO [Tabla_Publicados] ([Id_numero_de_Caso], [Tipodedocumento], [Ruta]) VALUES (@Id_numero_de_Caso, @Tipodedocumento, @Ruta)" 
                        ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                        SelectCommand="SELECT Id_publicados, Id_numero_de_Caso, Tipodedocumento, Ruta FROM Tabla_Publicados WHERE (Id_numero_de_Caso = @fdgd)" 
                        
                        UpdateCommand="UPDATE [Tabla_Publicados] SET [Id_numero_de_Caso] = @Id_numero_de_Caso, [Tipodedocumento] = @Tipodedocumento, [Ruta] = @Ruta WHERE [Id_publicados] = @Id_publicados">
                        <DeleteParameters>
                            <asp:Parameter Name="Id_publicados" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                            <asp:Parameter Name="Tipodedocumento" Type="String" />
                            <asp:Parameter Name="Ruta" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="fdgd" SessionField="NumeroDeCaso" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                            <asp:Parameter Name="Tipodedocumento" Type="String" />
                            <asp:Parameter Name="Ruta" Type="String" />
                            <asp:Parameter Name="Id_publicados" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />

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

