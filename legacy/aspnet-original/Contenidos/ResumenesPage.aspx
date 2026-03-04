<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ResumenesPage.aspx.cs" Inherits="Contenidos_ResumenesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center" style="margin-left: 40px">


      
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />


      
        <asp:Label ID="Label3" runat="server" CssClass="titulos"></asp:Label>
&nbsp;
  
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


                <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
               
                <asp:Label ID="Label2" runat="server"></asp:Label>
                

             <asp:Panel ID="Panel1" runat="server" Visible="False" BackColor="#FFCC00">
           
                 <br />
                 <asp:TextBox ID="tb_resumen" runat="server" Height="120px" 
                     TextMode="MultiLine" Width="496px"></asp:TextBox>
                 <br />
                 <br />
                 <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Listo" 
                     Width="218px" Visible="False" />
                 &nbsp;
                 <asp:Button ID="Button10" runat="server" onclick="Button10_Click" 
                     Text="Actualizar" Visible="False" />
        </asp:Panel>


                
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Nuevo Apunte " Visible="False" />


                                
                <br />
                &nbsp;&nbsp;&nbsp;


                                
                <asp:Label ID="lb_fechadeasignacion" runat="server" CssClass="subtitulo" 
                    ForeColor="Black"></asp:Label>
                
                <br />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_resumenes" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333"
                    onrowcommand="GridView1_RowCommand">

                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                       
                       <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Actualizara" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="ActualizarAnexo" Text="Actualizar" />
                                </ItemTemplate>
                            </asp:TemplateField>

                      
                       
                       
                        <asp:BoundField DataField="Id_resumenes" HeaderText="Codigo Resumen" 
                            ReadOnly="True" SortExpression="Id_resumenes" InsertVisible="False" />
                        <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                            SortExpression="Id_numero_de_Caso" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Informe" HeaderText="Apunte Bitacora" 
                            SortExpression="Informe" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Estado Apunte" 
                            SortExpression="Nombre" >
                     
                        <ItemStyle Font-Bold="True" Font-Italic="False" ForeColor="#0066FF" />
                        </asp:BoundField>
                     
                        <asp:BoundField DataField="Correo" HeaderText="Correo Analista" 
                            SortExpression="Correo" />
                     
                    


                     
                    
                        <asp:BoundField DataField="Expr1" HeaderText="Nombre Afiliado" 
                            SortExpression="Expr1" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido Afiliado" 
                            SortExpression="Apellido" >
                    
                    

                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                    
                    

                        <asp:BoundField DataField="correo2" HeaderText="Correo Investigador" 
                            SortExpression="correo2" />


                             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButton" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="Corregirw" Text="Corregir" />
                                </ItemTemplate>
                            </asp:TemplateField>


                             <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButtorn" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="revisar23" Text="Revisar" />
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="AddButtonwq" runat="server" 
                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                        CommandName="Publicarq" Text="Publicar" />
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
                <asp:Label ID="Label6" runat="server" CssClass="subtitulo" 
                    Text="Ver Apuntes Por Dia"></asp:Label>
                <asp:Calendar ID="Calendar1" runat="server" CssClass="subtitulo" 
                    onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
                <br />
                <asp:Label ID="Label5" runat="server" CssClass="subtitulo" 
                    Text="Ver Apuntes Por Mes"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="/01/">Enero</asp:ListItem>
                    <asp:ListItem Value="/02/">Febrero</asp:ListItem>
                    <asp:ListItem Value="/03/">Marzo</asp:ListItem>
                    <asp:ListItem Value="/04/">Abril</asp:ListItem>
                    <asp:ListItem Value="/05/">Mayo</asp:ListItem>
                    <asp:ListItem Value="/06/">Junio</asp:ListItem>
                    <asp:ListItem Value="/07/">Julio</asp:ListItem>
                    <asp:ListItem Value="/08/">Agosto</asp:ListItem>
                    <asp:ListItem Value="/09/">Septiembre</asp:ListItem>
                    <asp:ListItem Value="/10/">Octubre</asp:ListItem>
                    <asp:ListItem Value="/11/">Noviembre</asp:ListItem>
                    <asp:ListItem Value="/12/">Diciembre</asp:ListItem>
                </asp:DropDownList>


                                <br />
                <br />
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                    Text="Ver Todos Los Apuntes" />
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Resumenes] WHERE [Id_resumenes] = @Id_resumenes" 
                    InsertCommand="INSERT INTO [Tabla_Resumenes] ([Id_numero_de_Caso], [Fecha], [Informe], [Id_estadodocus]) VALUES (@Id_numero_de_Caso, @Fecha, @Informe, @Id_estadodocus)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Resumenes.Id_resumenes, Tabla_Resumenes.Id_numero_de_Caso, Tabla_Resumenes.Fecha, Tabla_Resumenes.Informe, Tabla_estadodocus.Nombre, Tabla_Analista.Correo, Tabla_Afiliado.Nombre AS Expr1, Tabla_Afiliado.Apellido, Tabla_Investigador.Correo AS correo2 FROM Tabla_Resumenes INNER JOIN Tabla_estadodocus ON Tabla_Resumenes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus INNER JOIN Tabla_Casos ON Tabla_Resumenes.Id_numero_de_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador WHERE (Tabla_Resumenes.Id_numero_de_Caso = @sserd)" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [Tabla_Resumenes] SET [Id_numero_de_Caso] = @Id_numero_de_Caso, [Fecha] = @Fecha, [Informe] = @Informe, [Id_estadodocus] = @Id_estadodocus WHERE [Id_resumenes] = @Id_resumenes">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_resumenes" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Informe" Type="String" />
                        <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="sserd" SessionField="NumeroDeCaso" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Informe" Type="String" />
                        <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                        <asp:Parameter Name="Id_resumenes" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Resumenes] WHERE [Id_resumenes] = @Id_resumenes" 
                    InsertCommand="INSERT INTO [Tabla_Resumenes] ([Id_numero_de_Caso], [Fecha], [Informe], [Id_estadodocus]) VALUES (@Id_numero_de_Caso, @Fecha, @Informe, @Id_estadodocus)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Resumenes.Id_resumenes, Tabla_Resumenes.Id_numero_de_Caso, Tabla_Resumenes.Fecha, Tabla_Resumenes.Informe, Tabla_estadodocus.Nombre, Tabla_Analista.Correo, Tabla_Afiliado.Nombre AS Expr1, Tabla_Afiliado.Apellido, Tabla_Investigador.Correo AS correo2 FROM Tabla_Resumenes INNER JOIN Tabla_estadodocus ON Tabla_Resumenes.Id_estadodocus = Tabla_estadodocus.Id_estadodocus INNER JOIN Tabla_Casos ON Tabla_Resumenes.Id_numero_de_Caso = Tabla_Casos.Id_Numero_Caso INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador WHERE (Tabla_estadodocus.Nombre LIKE '%' + @aaaa + '%') AND (Tabla_Investigador.Correo LIKE '%' + @investigadorr + '%') AND (Tabla_Resumenes.Fecha LIKE '%' + @fechaaa + '%')" 
                    
                    
                    
                    UpdateCommand="UPDATE [Tabla_Resumenes] SET [Id_numero_de_Caso] = @Id_numero_de_Caso, [Fecha] = @Fecha, [Informe] = @Informe, [Id_estadodocus] = @Id_estadodocus WHERE [Id_resumenes] = @Id_resumenes">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_resumenes" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Informe" Type="String" />
                        <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="aaaa" SessionField="estadoresumen567" />
                        <asp:SessionParameter Name="investigadorr" 
                            SessionField="investigadorresumenes" />
                        <asp:SessionParameter Name="fechaaa" SessionField="fechabitacoras" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                        <asp:Parameter Name="Fecha" Type="String" />
                        <asp:Parameter Name="Informe" Type="String" />
                        <asp:Parameter Name="Id_estadodocus" Type="Int32" />
                        <asp:Parameter Name="Id_resumenes" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />


    <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="lb_prueba" runat="server" Text="Label"></asp:Label>
                <br />
                &nbsp;

                <asp:Button ID="b_edicion" runat="server" CssClass="botones" Height="26px" 
                    onclick="b_edicion_Click" Text="Habilitar Edición" Width="142px" 
                    Visible="False" />
                &nbsp;<asp:Button ID="b_eliminacion" runat="server" CssClass="botones" 
                    onclick="b_eliminacion_Click" Text="Habilitar Eliminación" 
                    Visible="False" />

                <br />

    <br />

     <a name="Ancla2"></a>


                </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />


</asp:Content>

