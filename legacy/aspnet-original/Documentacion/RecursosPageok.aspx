<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="RecursosPageok.aspx.cs" Inherits="Documentacion_RecursosPageok" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div align="center"  >
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />
        <br />
        <div align="center">
            <asp:Label ID="Label1" runat="server" CssClass="titulos" 
                Text="Recursos Investigador"></asp:Label>
            <a name="Ancla1"></a>
        </div>
       
                <div align="center">
                    <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
                <br />


                                <asp:Label ID="Label2" runat="server"></asp:Label>


                                <br />


                                <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Nuevo Recurso" />
                <br />
                    &nbsp;&nbsp;&nbsp;<asp:GridView ID="GridView2" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="Id_Recinve" 
                        DataSourceID="SqlDataSource2"
                        onrowcommand="GridView1_RowCommand"  
                        EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" 
                        ForeColor="#333333" GridLines="Both">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="VerAnexo" Text="Ver" />
                                </ItemTemplate>
                                 <ItemStyle Font-Bold="False" />
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="Id_Recinve" HeaderText="Codigo Recurso" ReadOnly="True" 
                                SortExpression="Id_Recinve" />
                            <asp:BoundField DataField="Tipodedocumento" HeaderText="Tipo De Recurso" 
                                SortExpression="Tipodedocumento" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
                            <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                                SortExpression="Id_numero_de_Caso" />
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
                        DeleteCommand="DELETE FROM [Tabla_Recuinve] WHERE [Id_Recinve] = @Id_Recinve" 
                        InsertCommand="INSERT INTO [Tabla_Recuinve] ([Tipodedocumento], [Id_numero_de_Caso], [Ruta]) VALUES (@Tipodedocumento, @Id_numero_de_Caso, @Ruta)" 
                        ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                        SelectCommand="SELECT Id_Recinve, Tipodedocumento, Id_numero_de_Caso, Ruta FROM Tabla_Recuinve WHERE (Id_numero_de_Caso = @sdf)" 
                        
                        UpdateCommand="UPDATE [Tabla_Recuinve] SET [Tipodedocumento] = @Tipodedocumento, [Id_numero_de_Caso] = @Id_numero_de_Caso, [Ruta] = @Ruta WHERE [Id_Recinve] = @Id_Recinve">
                        <DeleteParameters>
                            <asp:Parameter Name="Id_Recinve" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Tipodedocumento" Type="String" />
                            <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                            <asp:Parameter Name="Ruta" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="sdf" SessionField="NumeroDeCaso" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Tipodedocumento" Type="String" />
                            <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                            <asp:Parameter Name="Ruta" Type="String" />
                            <asp:Parameter Name="Id_Recinve" Type="Int32" />
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

