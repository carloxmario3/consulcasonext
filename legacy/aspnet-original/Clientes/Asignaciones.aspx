<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="Asignaciones.aspx.cs" Inherits="Clientes_Asignaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">


      
        <asp:Label ID="lb_ncaso0" runat="server" CssClass="titulos">Nueva Misión</asp:Label>



    &nbsp;


      
        <asp:Label ID="Label2" runat="server" CssClass="titulos" ></asp:Label>
  
        <br />

    </div>
         
       
            

            <div align="center">
                        
                 <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                 </telerik:RadScriptManager>
                 <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
                 <div align="center">
                     <asp:Label ID="lb_info_operacion0" runat="server"></asp:Label>
                   
                   
                

                <table border="1" style="width: 800px" >
            <tr>
                <td>
                <div align="center">
    <asp:Panel ID="pn_infop" runat="server" BackColor="#FFCC00" >




                   
                   
                     <br />
                     <asp:Label ID="Label32" runat="server" CssClass="subtitulo" Font-Size="Larger" 
                         Text="1). Suba Los Archivos Relacionados Con La Nueva Misión"></asp:Label>




                   
                   
                     <br />




                   
                   
                     <telerik:RadProgressArea ID="RadProgressArea1" Runat="server" Skin="Outlook">
                         <Localization Cancel="Cancelar" CurrentFileName="Subiendo Archivo: " 
                             ElapsedTime="Tiempo Transcurrido: " EstimatedTime="Tiempo Estimado: " 
                             TransferSpeed="Velocidad: " Uploaded="Subido" 
                             UploadedFiles="Archivos Subidos: " />
                     </telerik:RadProgressArea>
                     <asp:Label ID="Label29" runat="server" CssClass="subtitulo" 
                         Text="Realice Clic En El Botón (Selección) Luego  Escoja El Archivo Que Desea Subir y Oprima El Botón (Subir)"></asp:Label>
                     <br />
                     <br />
                     <telerik:RadUpload ID="RadUpload1" Runat="server" 
                         ControlObjectsVisibility="All" FocusOnLoad="True" InputSize="40" 
                         MaxFileInputsCount="1" OverwriteExistingFiles="True" Width="500px">
                         <Localization Add="Agregar" Clear="Limpiar" Delete="Borrar" Remove="Remover" 
                             Select="Seleccion" />
                     </telerik:RadUpload>
                     <asp:Button ID="btnUpload3" runat="server" onclick="btnUpload3_Click" 
                         Text="Subir" Width="60px" />
                 </div>
                 <br />
                 <asp:Label ID="Label26" runat="server" CssClass="subtitulo" 
                     Text="Archivos Adjuntos"></asp:Label>
                 <br />
                 <br />
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                     CellPadding="4" DataKeyNames="Id_Recinve" DataSourceID="SqlDataSource2" 
                     EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:BoundField DataField="Id_Recinve" HeaderText="Codigo Archivo" 
                             ReadOnly="True" SortExpression="Id_Recinve" />
                         <asp:BoundField DataField="Tipodedocumento" HeaderText="Nombre Del Archivo" 
                             SortExpression="Tipodedocumento">
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Id_numero_de_Caso" HeaderText="Numero De Caso" 
                             SortExpression="Id_numero_de_Caso" />
                         <asp:BoundField DataField="Ruta" HeaderText="Archivo" SortExpression="Ruta" 
                             Visible="False" />
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
                         <asp:SessionParameter Name="sdf" SessionField="NumeroDeCasoasig" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="Tipodedocumento" Type="String" />
                         <asp:Parameter Name="Id_numero_de_Caso" Type="Int32" />
                         <asp:Parameter Name="Ruta" Type="String" />
                         <asp:Parameter Name="Id_Recinve" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
                 <asp:Label ID="lb_info_operacion" runat="server" Visible="False"></asp:Label>
                 <br />

            






               </asp:Panel>

               </div>
                </td>
            </tr>
        </table>


                     <br />
                     <br />
                     <br />


                      <table border="1" style="width: 800px" >
            <tr>
                <td>

                 <asp:Panel ID="pn_Dcaso" runat="server" BackColor="#FFCC00">

                <div align="center">









                    <asp:Label ID="Label33" runat="server" CssClass="subtitulo" Font-Size="Larger" 
                        Text="2). Diligencie Los Campos Relacionados Con La Misión"></asp:Label>









                 <br />

            
                 <asp:Label ID="Label25" runat="server" Text="Seleccione El Tipo De Caso" 
                     CssClass="subtitulo" Font-Size="Medium"></asp:Label>
                 <br />
                 <asp:DropDownList ID="DropDownList4" runat="server" 
                     DataSourceID="SqlDataSource4" DataTextField="Nombre" 
                     DataValueField="Id_tipocaso">
                 </asp:DropDownList>
                 <br />
                 <br />
                 <asp:Label ID="Label27" runat="server" CssClass="subtitulo" 
                     Text="Datos Del Afiliado" Font-Size="XX-Large"></asp:Label>
                    <br />
                    <asp:Label ID="Label31" runat="server" Font-Underline="True" 
                        ForeColor="#3333CC" Text="Recuerde Diligenciar Todos Los Campos"></asp:Label>
                 <br />
                 <table border="1" cellspacing="5" style="height: 71px">
                     <tr>
                         <td class="style1">
                             <asp:Label ID="Label3" runat="server" CssClass="subtitulo" Text="Nombre"></asp:Label>
                         </td>
                         <td class="style1">
                             <asp:Label ID="Label4" runat="server" CssClass="subtitulo" Text="Apellido"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="style1">
                             <asp:TextBox ID="tb_nombre" runat="server"></asp:TextBox>
                         </td>
                         <td class="style1">
                             <asp:TextBox ID="tb_apellido" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="style2" colspan="2">
                             <asp:Label ID="Label5" runat="server" CssClass="subtitulo" Text="Cedula"></asp:Label>
                         </td>
                         <td class="style2">
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td class="style2" colspan="2">
                             <asp:TextBox ID="tb_cedula" runat="server"></asp:TextBox>
                         </td>
                         <td class="style2">
                             &nbsp;</td>
                     </tr>
                 </table>
                    <asp:Label ID="Label30" runat="server" Font-Underline="True" 
                        ForeColor="#3333CC" Text="Cedula, Unicamente Numeros, Sin Puntos Ni Espacios"></asp:Label>
                    <br />
                 <br />
                 <asp:Label ID="Label10" runat="server" Text="Observaciones" 
                     CssClass="subtitulo"></asp:Label>
                 <br />
                 <asp:TextBox ID="TextBox1" runat="server" Height="119px" TextMode="MultiLine" 
                     Width="439px"></asp:TextBox>
                 <br />
                 <br />
                
                    </asp:Panel>
                
                    <br />
                    <br />

             <asp:Panel ID="Panel1" runat="server" BackColor="#FFCC00" Visible="False">
                 <br />
            <table border = "1" cellspacing = "5" style="height: 71px">
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label90" runat="server" Text="Compañía" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label6" runat="server" Text="Oficina" CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label7" runat="server" Text="Analista" CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList3" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label8" runat="server" Text="Fecha De Asignación" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Label ID="Label9" runat="server" Text="Fecha Posible Entrega" 
                            CssClass="subtitulo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="lb_fechadeasignacion" runat="server" CssClass="subtitulo" 
                            ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Label ID="lb_fechadeentrega" runat="server" CssClass="subtitulo" 
                            ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Calendar ID="Calendar1" runat="server" 
                            onselectionchanged="Calendar1_SelectionChanged" CssClass="subtitulo"></asp:Calendar>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Calendar ID="Calendar2" runat="server" 
                            onselectionchanged="Calendar2_SelectionChanged" CssClass="subtitulo"></asp:Calendar>
                    </td>
                </tr>
            </table>
                 &nbsp;&nbsp;
                 <br />
                 <asp:Label ID="Label88" runat="server" CssClass="subtitulo" 
                     Text="Seleccione La Ciudad En Donde El Caso Se Realizara"></asp:Label>
                 <br />
                 <br />
                 <asp:DropDownList ID="DropDownList5" runat="server">
                 </asp:DropDownList>
                 <br />
                 <br />
        </asp:Panel>


                    <br />
                               
               

                   

               </div>


               <div align="center">
                <asp:Label ID="Label1" runat="server" CssClass="subtitulo" Font-Size="Larger" 
                        
                       Text="3). Terminar La Creación Del Nuevo Caso Haciendo Clic En El Botón Listo"></asp:Label>
                <br />
               <asp:Button ID="Button3" runat="server" Text="LISTO" 
                     onclick="Button3_Click" Font-Size="XX-Large" />

                     </div>

                    <br />
                </td>
            </tr>
        </table>















    <br />
        <asp:Label ID="lb_ncaso1" runat="server" CssClass="titulos">Nueva Misión</asp:Label>



    &nbsp;<asp:Label ID="Label28" runat="server" CssClass="titulos" ></asp:Label>
  
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Tipodecaso] WHERE [Id_tipocaso] = @Id_tipocaso" 
                    InsertCommand="INSERT INTO [Tabla_Tipodecaso] ([Nombre], [Id_clasecaso]) VALUES (@Nombre, @Id_clasecaso)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [Id_tipocaso], [Nombre], [Id_clasecaso] FROM [Tabla_Tipodecaso]" 
                    UpdateCommand="UPDATE [Tabla_Tipodecaso] SET [Nombre] = @Nombre, [Id_clasecaso] = @Id_clasecaso WHERE [Id_tipocaso] = @Id_tipocaso">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_clasecaso" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_clasecaso" Type="Int32" />
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                &nbsp;&nbsp;<br />
                <br />

                 &nbsp;

                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Tipodecaso] WHERE [Id_tipocaso] = @Id_tipocaso" 
                    InsertCommand="INSERT INTO [Tabla_Tipodecaso] ([Nombre], [Id_clasecaso]) VALUES (@Nombre, @Id_clasecaso)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Id_analista, Correo FROM Tabla_Analista" 
                    
                     UpdateCommand="UPDATE [Tabla_Tipodecaso] SET [Nombre] = @Nombre, [Id_clasecaso] = @Id_clasecaso WHERE [Id_tipocaso] = @Id_tipocaso">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_clasecaso" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_clasecaso" Type="Int32" />
                        <asp:Parameter Name="Id_tipocaso" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

    <br />

     <a name="Ancla2"></a>


    


</asp:Content>

