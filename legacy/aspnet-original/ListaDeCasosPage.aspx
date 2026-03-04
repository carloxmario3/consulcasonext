<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ListaDeCasosPage.aspx.cs" Inherits="ListaDeCasosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- Start of Zopim Live Chat Script    <script runat="server">
       string mivar;
       string correousuario()
       {



           mivar = Convert.ToString(Membership.GetUser());

           return mivar;
            
       }

      
      
      
      
   </script><script type="text/javascript">    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) { z._.push(c) }, $ = z.s = d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) { z.set._.push(o) }; $.setAttribute('charset', 'utf-8'); $.async = !0; z.set._ = []; $.src = ('https:' == d.location.protocol ? 'https://ssl' : 'http://cdn') + '.zopim.com/?9mDICZUfknExghxjoOwO891X6ZN8a1PW'; $.type = 'text/java' + s; z.t = +new Date; z._ = []; e.parentNode.insertBefore($, e)
    })(document, 'script')
    $zopim(function () {
        $zopim.livechat.set({
            language: 'es',
            name: 'Visitor',
            email: '<%Response.Write(correousuario());%>'
        });
    });</script>        End of Zopim Live Chat Script -->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Lista de Casos" CssClass="titulos" ></asp:Label>
  
 

        <br />
                <asp:Label ID="labelpruebas" runat="server"></asp:Label>



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
            

                <table border="1" cellspacing="5" style="height: 71px" bgcolor="#FFCC00">
                    <tr>
                        <td class="style1">
                            <asp:Button ID="botonvercasosactivos" runat="server" onclick="Button4_Click" 
                                Text="Ver Casos Activos" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="botonvercompletos" runat="server" onclick="Button3_Click" 
                                Text="Ver Casos Completos" Visible="False" />
                        </td>
                        <td class="style1">
                            <asp:Button ID="botonverfacturados0" runat="server" onclick="Buttonfactura_Click" 
                                Text="Ver Casos Facturados" Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td class="style2">
                            <asp:Button ID="Button17" runat="server" onclick="Button17_Click" 
                                Text="Ver Todos Los Casos" Visible="False" />
                        </td>
                        <td class="style2">
                            <asp:Button ID="botonversuspendidos" runat="server" onclick="Button5_Click" 
                                Text="Ver Casos Suspendidos" Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Button ID="botonverinvestigador" runat="server" onclick="Button11_Click" 
                                Text="Ver Casos Por Investigador" Width="197px" Visible="False" 
                                PostBackUrl="#AnclaInvestigador" />
                        </td>
                        <td class="style2">
                            <asp:Button ID="botonbuscar" runat="server" onclick="Button12_Click" 
                                Text="Buscar" Visible="False" PostBackUrl="#AnclaBusquedas" />
                        </td>
                        <td class="style2">
                            <asp:Button ID="botonvercliente" runat="server" onclick="Button10_Click" 
                                Text="Ver Casos Por Cliente" Visible="False" PostBackUrl="#AnclaCliente" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="Panel4analista" runat="server" 
                    Visible="False">
                    <asp:Label ID="Label7" runat="server" Text="Filtro Analista" 
                        CssClass="subtitulo"></asp:Label>
                    <br />
                    <table border="1" cellspacing="5" style="height: 71px" bgcolor="#FFCC00">
                        <tr>
                            <td class="style1">
                                <asp:DropDownList ID="DropDownListanalista" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="Nombres" DataValueField="Nombres" 
                                    onselectedindexchanged="DropDownList1_DropDownList1analist">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Button ID="Button15" runat="server" onclick="Button15_Click" 
                                    Text="Filtrar" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Button ID="Button7" runat="server" onclick="Button7_Click" 
                                    Text="Ver Todos Los Analista" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                &nbsp;
                <br />
                <asp:Panel ID="Panelbusqueda3" runat="server" Visible="False">
                    <asp:Label ID="Label14" runat="server" Text="Busqueda" CssClass="subtitulo"></asp:Label>
                    <br />
                    <table border="1" cellspacing="5" style="height: 71px" bgcolor="#FFCC00">
                        <tr>
                            <td class="style1">
                                <asp:Label ID="Label13" runat="server" Text="Dato a Buscar" 
                                    CssClass="subtitulo"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:Label ID="Label15" runat="server" CssClass="subtitulo" 
                                    Text="Seleccione Una Categoria"></asp:Label>
                            </td>
                            <td class="style1">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:TextBox ID="TextBox2" runat="server" Width="172px"></asp:TextBox>
                            </td>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownListbusnormal" runat="server" 
                                    onselectedindexchanged="DropDownListbusqueda_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Afiliado Cedula</asp:ListItem>
                                    <asp:ListItem Value="1">Afiliado Nombre y/o Apellido </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style2" style="margin-left: 40px">
                                <asp:Button ID="Button16" runat="server" onclick="Button16_Click" 
                                    Text="Buscar" />
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
                </asp:Panel>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id_Numero_Caso" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Caso" ShowSelectButton="True" >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                            ReadOnly="True" SortExpression="Id_Numero_Caso" InsertVisible="False" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" 
                            SortExpression="Estado" />
                        <asp:BoundField DataField="tipodecaso" HeaderText="Tipo De Caso" 
                            SortExpression="tipodecaso" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="afiadonombre" HeaderText="Nombre Afiliado" 
                            SortExpression="afiadonombre" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                            SortExpression="Cedula" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="compania" HeaderText="Compañia" 
                            SortExpression="compania" />
                        <asp:BoundField DataField="analistanombre" HeaderText="Nombre Analista" 
                            SortExpression="analistanombre" >
                        <ItemStyle Font-Bold="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="investigadornombre" HeaderText="Investigador Nombre" 
                            SortExpression="investigadornombre" >
                        <ControlStyle Font-Bold="False" Font-Italic="False" />
                        <ItemStyle Font-Bold="True" Font-Italic="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha_asignacion" 
                            HeaderText="Fecha De Asignacion" SortExpression="Fecha_asignacion" >
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fecha_posibleentrega" HeaderText="Fecha Posible Entrega" 
                            SortExpression="Fecha_posibleentrega" />
                        <asp:BoundField DataField="Fecha_entregareal" HeaderText="Fecha De Entrega" 
                            SortExpression="Fecha_entregareal" />
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                            SortExpression="Ciudad" />
                        <asp:BoundField DataField="Departamento" HeaderText="Departamento" 
                            SortExpression="Departamento" />
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

             <asp:Panel ID="Panel1Busquedas" runat="server" Visible="False" BackColor="#FFCC00">
                 <asp:Label ID="Label4" runat="server" Text="Busquedas" CssClass="subtitulo"></asp:Label>
                 <a name="AnclaBusquedas"></a>
                 <br />
                 <div align="center">
                     <br />
                     <table border="1" cellspacing="5" style="height: 71px">
                         <tr>
                             <td class="style1">
                                 <asp:Label ID="Label11" runat="server" Text="Dato a Buscar" 
                                     CssClass="subtitulo"></asp:Label>
                             </td>
                             <td class="style1">
                                 <asp:Label ID="Label16" runat="server" CssClass="subtitulo" 
                                     Text="Seleccione Una Categoria"></asp:Label>
                             </td>
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
                                     <asp:ListItem Value="2">Afiliado Cedula</asp:ListItem>
                                     <asp:ListItem Value="1">Afiliado Nombre y/o Apellido </asp:ListItem>
                                     <asp:ListItem Value="0">Numero De Caso</asp:ListItem>
                                     <asp:ListItem Value="3">Reclamante Nombre y/o Apellido </asp:ListItem>
                                     <asp:ListItem Value="4">Reclamante Cedula</asp:ListItem>
                                     <asp:ListItem Value="5">Nombre De La Empresa</asp:ListItem>
                                 </asp:DropDownList>
                             </td>
                             <td class="style2" style="margin-left: 40px">
                                 <asp:Button ID="Button8" runat="server" onclick="Button8_Click" Text="Buscar" />
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
                     <asp:GridView ID="GridViewnumerocaso" runat="server" 
                         AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Numero_Caso" 
                         datasourceid="SqlDataSource9" 
                         EmptyDataText="No hay registros de datos para mostrar." 
                         ForeColor="#333333" Visible="False" onselectedindexchanged="GridViewnumerocaso_SelectedIndexChanged1" 
                     >
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:CommandField SelectText="Ver Caso" ShowSelectButton="True" >
                             <ItemStyle Font-Bold="True" />
                             </asp:CommandField>
                             <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                 InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Estado" HeaderText="Estado" 
                                 SortExpression="Estado" />
                             <asp:BoundField DataField="tipodecaso" HeaderText="Tipo De Caso" 
                                 SortExpression="tipodecaso" />
                             <asp:BoundField DataField="afiadonombre" HeaderText="Nombre Afiliado" 
                                 SortExpression="afiadonombre" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
                             <asp:BoundField DataField="afiliadoapellido" HeaderText="Apellido Afiliado" 
                                 SortExpression="afiliadoapellido" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Cedula" HeaderText="Cedula" 
                                 SortExpression="Cedula" />
                             <asp:BoundField DataField="compania" HeaderText="Compañia" 
                                 SortExpression="compania" />
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
                     <asp:GridView ID="GridViewAfiliados" runat="server" AutoGenerateColumns="False" 
                         CellPadding="4" DataKeyNames="Id_Numero_Caso" datasourceid="SqlDataSource10" 
                         EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                         GridLines="Both" Visible="False" onselectedindexchanged="GridViewAfiliados_SelectedIndexChanged"
                         >
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:CommandField ShowSelectButton="True" SelectText="Ver Caso" >
                             <ItemStyle Font-Bold="True" />
                             </asp:CommandField>
                             <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                 InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                             <asp:BoundField DataField="Nombre Afiliado" HeaderText="Nombre Afiliado" 
                                 ReadOnly="True" SortExpression="Nombre Afiliado" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
                             <asp:BoundField DataField="CedulaAfiliado" HeaderText="Cedula Afiliado" 
                                 SortExpression="CedulaAfiliado" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
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
                     <asp:GridView ID="GridViewreclamante" runat="server" 
                         AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Numero_Caso" 
                         datasourceid="SqlDataSource11" 
                         EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                         GridLines="Both" Visible="False" onselectedindexchanged="GridViewreclamante_SelectedIndexChanged"
                         >
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:CommandField ShowSelectButton="True" SelectText="Ver Caso" >
                             <ItemStyle Font-Bold="True" />
                             </asp:CommandField>
                             <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                 InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                             <asp:BoundField DataField="Nombres" HeaderText="Nombre Reclamante" ReadOnly="True" 
                                 SortExpression="Nombres" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Expr1" HeaderText="Cedula Reclamante" ReadOnly="True" 
                                 SortExpression="Expr1" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
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
                     <asp:GridView ID="GridViewRecAfiliado" runat="server" 
                         AutoGenerateColumns="False" CellPadding="4" datasourceid="SqlDataSource12" 
                         EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                         GridLines="Both" Visible="False" 
                         onselectedindexchanged="GridViewRecAfiliado_SelectedIndexChanged">
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:CommandField ShowSelectButton="True" SelectText="Ver Caso" >
                             <ItemStyle Font-Bold="True" />
                             </asp:CommandField>
                             <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                 SortExpression="Id_Numero_Caso" />
                             <asp:BoundField DataField="Nombre_empresa" HeaderText="Empresa" 
                                 SortExpression="Nombre_empresa" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
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
                     <asp:GridView ID="GridViewRecEmpresa" runat="server" 
                         AutoGenerateColumns="False" CellPadding="4" datasourceid="SqlDataSource13" 
                         EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                         GridLines="Both" Visible="False" 
                         onselectedindexchanged="GridViewRecEmpresa_SelectedIndexChanged">
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:CommandField ShowSelectButton="True" SelectText="Ver Caso" >
                             <ItemStyle Font-Bold="True" />
                             </asp:CommandField>
                             <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                 SortExpression="Id_Numero_Caso" />
                             <asp:BoundField DataField="Nombre_empresa" HeaderText="Empresa" 
                                 SortExpression="Nombre_empresa" >
                             <ItemStyle Font-Bold="True" />
                             </asp:BoundField>
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
                     <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                         DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                         InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                         ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                         SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres AS analistanombre, Tabla_Investigador.Nombres AS investigadornombre, Tabla_Analista.Apellidos AS analistaapellido, Tabla_Investigador.Apellidos AS investigadorapellido, Tabla_Afiliado.Cedula, Tabla_Afiliado.Nombre AS afiadonombre, Tabla_Afiliado.Apellido AS afiliadoapellido, Tabla_Casos.Id_estado, Tabla_Investigador.Correo, Tabla_Analista.Correo AS Expr1, Tabla_Compania.Nombre AS compania FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania WHERE (Tabla_Casos.Id_Numero_Caso = @numerocaso)" 
                         
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
                     
                     <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
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
                     <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
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
                     
                     <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
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
                   
                     <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
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
                     
                 </div>
        </asp:Panel>


                 <br />

                <asp:Panel ID="Panel2clientes" runat="server" BackColor="#FFCC00" 
                    Visible="False">
                    <asp:Label ID="Label5" runat="server" Text="Filtro Cliente" 
                        CssClass="subtitulo"></asp:Label>
                    <a name="AnclaCliente"></a>
                    <br />
                    <table border="1" cellspacing="5" style="height: 71px">
                        <tr>
                            <td class="style1">
                                <asp:Label ID="Label8" runat="server" Text="Compañía" CssClass="subtitulo"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:Label ID="Label9" runat="server" Text="Oficina" CssClass="subtitulo"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:Label ID="Label10" runat="server" Text="Analista" CssClass="subtitulo"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                                <br />
                            </td>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    onselectedindexchanged="DropDownList3_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <br />
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label12" runat="server" Text="Estado" CssClass="subtitulo"></asp:Label>
                            </td>
                            <td class="style2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Completo</asp:ListItem>
                                    <asp:ListItem>Suspendido</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td class="style2">
                                <asp:Button ID="Button13" runat="server" onclick="Button13_Click" 
                                    Text="Buscar" />
                            </td>
                            <td class="style2">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewFiltroCliente" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Numero_Caso" 
                        datasourceid="SqlDataSource14" 
                        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                        GridLines="None" Visible="False" 
                        onselectedindexchanged="GridViewFiltroCliente_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="Ver Caso" >
                            <ItemStyle Font-Bold="True" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre Analista" ReadOnly="True" 
                                SortExpression="Nombre" >
                            <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Estado" HeaderText="Estado" 
                                SortExpression="Estado" />
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
                    <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                        InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                        ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                        SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Analista.Nombres + ' ' + Tabla_Analista.Apellidos AS Nombre, Tabla_Estado.Nombre AS Estado FROM Tabla_Casos INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado WHERE (Tabla_Analista.Nombres + ' ' + Tabla_Analista.Apellidos LIKE @cliente) AND (Tabla_Estado.Nombre LIKE @estado)" 
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
                            <asp:SessionParameter Name="cliente" SessionField="filtroclientenombre" />
                            <asp:SessionParameter Name="estado" SessionField="filtroclienteEstado" />
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
                </asp:Panel>


                <br />
                <asp:Panel ID="Panel3investigador" runat="server" BackColor="#FFCC00" 
                    Visible="False">
                    <asp:Label ID="Label6" runat="server" Text="Filtro Investigador" 
                        CssClass="subtitulo"></asp:Label>
                    &nbsp;<a name="AnclaInvestigador"></a><br /> <br />
                    <table border="1" cellspacing="5" style="height: 71px">
                        <tr>
                            <td class="style1">
                                <asp:Label ID="Label17" runat="server" CssClass="subtitulo" Font-Bold="True" 
                                    Text="Investigador"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList4" runat="server">
                                </asp:DropDownList>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label18" runat="server" CssClass="subtitulo" Text="Estado"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList6" runat="server">
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Completo</asp:ListItem>
                                    <asp:ListItem>Suspendido</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Button ID="Button14" runat="server" onclick="Button14_Click" 
                                    Text="Buscar" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GridViewFiltroInvestigador" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Numero_Caso" 
                        datasourceid="SqlDataSource15" 
                        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                        GridLines="None" Visible="False" 
                        onselectedindexchanged="GridViewFiltroInvestigador_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="Ver Caso" >
                            <ItemStyle Font-Bold="True" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Id_Numero_Caso" HeaderText="Numero De Caso" 
                                InsertVisible="False" ReadOnly="True" SortExpression="Id_Numero_Caso" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre Investigador" ReadOnly="True" 
                                SortExpression="Nombre" >
                            <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Estado" HeaderText="Estado" 
                                SortExpression="Estado" />
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
                    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                        InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                        ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                        SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Investigador.Nombres + ' ' + Tabla_Investigador.Apellidos AS nombre, Tabla_Estado.Nombre AS Estado FROM Tabla_Casos INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador WHERE (Tabla_Estado.Nombre LIKE @estado) AND (Tabla_Investigador.Nombres + ' ' + Tabla_Investigador.Apellidos LIKE @investigador)" 
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
                            <asp:SessionParameter Name="estado" SessionField="filtroInvestigadorEstado" />
                            <asp:SessionParameter Name="investigador" 
                                SessionField="filtroInvestigadorNombre" />
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
                </asp:Panel>
                <br />
                <br />
                <br />


                <br />
                &nbsp;&nbsp;
                <br />


                <asp:Label ID="Label3" runat="server"></asp:Label>


                <br />
                <br />
                <br />
                <br />


                <br />


    <br />
                <br />
    <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres + ' ' + Tabla_Analista.Apellidos AS analistanombre, Tabla_Investigador.Nombres + ' ' + Tabla_Investigador.Apellidos AS investigadornombre, Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido AS afiadonombre, CONVERT (varchar, Tabla_Afiliado.Cedula) AS Cedula, CONVERT (varchar, Tabla_Casos.Id_estado) AS Id_estado, Tabla_Investigador.Correo, Tabla_Analista.Correo AS Expr1, Tabla_Compania.Nombre AS compania, Tabla_Ciudades.Ciudad, Tabla_departamentos.Nombre AS Departamento FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania INNER JOIN Tabla_Ciudades ON Tabla_Casos.Ciudad = Tabla_Ciudades.Id_ciudad INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_Investigador.Correo LIKE '%' + @investigadorr + '%') AND (Tabla_Analista.Correo LIKE '%' + @analistalis + '%') AND (CONVERT (varchar, Tabla_Casos.Id_estado) LIKE '%' + @sdfg + '%') AND (CONVERT (varchar, Tabla_Afiliado.Cedula) LIKE @cedula) AND (Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido LIKE '%' + @afiliado + '%') ORDER BY Tabla_Casos.Id_Numero_Caso DESC" 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
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
                        <asp:SessionParameter Name="sdfg" SessionField="estadocasolistade" />
                        <asp:SessionParameter Name="investigadorr" SessionField="investigadorlista" />
                        <asp:SessionParameter Name="analistalis" SessionField="analistalista" />
                        <asp:SessionParameter Name="cedula" SessionField="cedulalista" />
                        <asp:SessionParameter DefaultValue="" Name="afiliado" 
                            SessionField="afiliadolista" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Analista.Nombres, Tabla_oficina.Id_oficina FROM Tabla_oficina INNER JOIN Tabla_Analista ON Tabla_oficina.Id_oficina = Tabla_Analista.Id_oficina WHERE (Tabla_oficina.Id_oficina = @iddeofi)" 
                    
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
                        <asp:SessionParameter Name="iddeofi" SessionField="iddeoficinaaa" />
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
                &nbsp;&nbsp;<br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    
                    SelectCommand="SELECT Tabla_Compania.Nombre, Tabla_Analista.Correo, Tabla_oficina.Id_oficina FROM Tabla_Compania INNER JOIN Tabla_oficina ON Tabla_Compania.Id_compania = Tabla_oficina.Id_compania INNER JOIN Tabla_Analista ON Tabla_oficina.Id_oficina = Tabla_Analista.Id_oficina WHERE (Tabla_Analista.Correo = @elcoreoaa)">
                    <SelectParameters>
                        <asp:Parameter Name="elcoreoaa" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                &nbsp;

                <br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Casos] WHERE [Id_Numero_Caso] = @Id_Numero_Caso" 
                    InsertCommand="INSERT INTO [Tabla_Casos] ([Id_tipocaso], [Id_estado], [Id_analista], [Id_investigador], [Fecha_asignacion], [Fecha_posibleentrega], [Fecha_entregareal], [Observaciones]) VALUES (@Id_tipocaso, @Id_estado, @Id_analista, @Id_investigador, @Fecha_asignacion, @Fecha_posibleentrega, @Fecha_entregareal, @Observaciones)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Tabla_Casos.Id_Numero_Caso, Tabla_Casos.Fecha_asignacion, Tabla_Casos.Fecha_posibleentrega, Tabla_Casos.Fecha_entregareal, Tabla_Casos.Observaciones, Tabla_Tipodecaso.Nombre AS tipodecaso, Tabla_Estado.Nombre AS Estado, Tabla_Analista.Nombres + ' ' + Tabla_Analista.Apellidos AS analistanombre, Tabla_Investigador.Nombres + ' ' + Tabla_Investigador.Apellidos AS investigadornombre, Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido AS afiadonombre, CONVERT (varchar, Tabla_Afiliado.Cedula) AS Cedula, CONVERT (varchar, Tabla_Casos.Id_estado) AS Id_estado, Tabla_Investigador.Correo, Tabla_Analista.Correo AS Expr1, Tabla_Analista.Id_oficina, Tabla_Compania.Nombre AS compania FROM Tabla_Casos INNER JOIN Tabla_Tipodecaso ON Tabla_Casos.Id_tipocaso = Tabla_Tipodecaso.Id_tipocaso INNER JOIN Tabla_Estado ON Tabla_Casos.Id_estado = Tabla_Estado.Id_estado INNER JOIN Tabla_Analista ON Tabla_Casos.Id_analista = Tabla_Analista.Id_analista INNER JOIN Tabla_Investigador ON Tabla_Casos.Id_investigador = Tabla_Investigador.Id_Investigador INNER JOIN Tabla_Afiliado ON Tabla_Casos.Id_Numero_Caso = Tabla_Afiliado.Id_Numero_Caso INNER JOIN Tabla_oficina ON Tabla_Analista.Id_oficina = Tabla_oficina.Id_oficina INNER JOIN Tabla_Compania ON Tabla_oficina.Id_compania = Tabla_Compania.Id_compania WHERE (Tabla_Analista.Id_oficina = @idoficinaa) AND (Tabla_Analista.Nombres LIKE '%' + @nomana + '%') AND (CONVERT (varchar, Tabla_Casos.Id_estado) LIKE '%' + @sdfg + '%') AND (CONVERT (varchar, Tabla_Afiliado.Cedula) LIKE @cedula) AND (Tabla_Afiliado.Nombre + ' ' + Tabla_Afiliado.Apellido LIKE '%' + @afiliado + '%')" 
                    
                    
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
                        <asp:SessionParameter Name="sdfg" SessionField="estadocasolistade" />
                        <asp:SessionParameter Name="idoficinaa" SessionField="iddeoficinaaa" />
                        <asp:SessionParameter Name="nomana" SessionField="analista222" />
                        <asp:SessionParameter Name="cedula" SessionField="cedulalista" />
                        <asp:SessionParameter Name="afiliado" SessionField="afiliadolista" />
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Compania] WHERE [Id_compania] = @Id_compania" 
                    InsertCommand="INSERT INTO [Tabla_Compania] ([Nombre]) VALUES (@Nombre)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" SelectCommand="
SELECT Id_compania, Nombre FROM Tabla_Compania WHERE (Nombre LIKE '%' + @nombree + '%')" 
                    UpdateCommand="UPDATE [Tabla_Compania] SET [Nombre] = @Nombre WHERE [Id_compania] = @Id_compania">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_compania" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="nombree" SessionField="nombrecliente" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Id_compania" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_oficina] WHERE [Id_oficina] = @Id_oficina" 
                    InsertCommand="INSERT INTO [Tabla_oficina] ([Id_compania], [Direccion], [Telefono], [Ubicacion]) VALUES (@Id_compania, @Direccion, @Telefono, @Ubicacion)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Tabla_oficina.Id_oficina, Tabla_oficina.Id_compania, Tabla_oficina.Direccion, Tabla_oficina.Telefono, Tabla_Ciudades.Ciudad, Tabla_departamentos.Nombre FROM Tabla_oficina INNER JOIN Tabla_Ciudades ON Tabla_Ciudades.Id_ciudad = Tabla_oficina.Ubicacion INNER JOIN Tabla_departamentos ON Tabla_Ciudades.Departamento = Tabla_departamentos.Id_departamento WHERE (Tabla_oficina.Id_compania = @idompae)" 
                    UpdateCommand="UPDATE Tabla_oficina SET Direccion = @Direccion, Telefono = @Telefono WHERE (Id_oficina = @Id_oficina)">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_oficina" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_compania" Type="Int32" />
                        <asp:Parameter Name="Direccion" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int64" />
                        <asp:Parameter Name="Ubicacion" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idompae" SessionField="ComboIdCompania" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Direccion" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Id_oficina" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Analista] WHERE [Id_analista] = @Id_analista" 
                    InsertCommand="INSERT INTO [Tabla_Analista] ([Id_usuario], [Id_oficina], [Celular], [Extencion], [Nombres], [Apellidos], [Telefono], [Correo]) VALUES (@Id_usuario, @Id_oficina, @Celular, @Extencion, @Nombres, @Apellidos, @Telefono, @Correo)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="SELECT Id_analista, Id_usuario, Id_oficina, Celular, Extencion, Nombres + ' ' + Apellidos AS Nombres, Telefono, Correo, Id_usernuevo FROM Tabla_Analista WHERE (Id_oficina = @sdf)" 
                    
                    UpdateCommand="UPDATE Tabla_Analista SET Celular = @Celular, Extencion = @Extencion, Nombres = @Nombres, Apellidos = @Apellidos, Telefono = @Telefono, Correo = @Correo WHERE (Id_analista = @Id_analista)">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_analista" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_usuario" Type="Int32" />
                        <asp:Parameter Name="Id_oficina" Type="Int32" />
                        <asp:Parameter Name="Celular" Type="Int64" />
                        <asp:Parameter Name="Extencion" Type="Int32" />
                        <asp:Parameter Name="Nombres" Type="String" />
                        <asp:Parameter Name="Apellidos" Type="String" />
                        <asp:Parameter Name="Telefono" Type="Int64" />
                        <asp:Parameter Name="Correo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="sdf" SessionField="ComboIdOficina" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Celular" />
                        <asp:Parameter Name="Extencion" />
                        <asp:Parameter Name="Nombres" />
                        <asp:Parameter Name="Apellidos" />
                        <asp:Parameter Name="Telefono" />
                        <asp:Parameter Name="Correo" />
                        <asp:Parameter Name="Id_analista" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [Tabla_Investigador] WHERE [Id_Investigador] = @Id_Investigador" 
                    InsertCommand="INSERT INTO [Tabla_Investigador] ([Id_usuario], [Barrio], [Cedula], [Celular], [Ubicacion], [Apellidos], [Nombres], [Direccion], [Telefono_fijo], [Correo], [Id_usernuevo]) VALUES (@Id_usuario, @Barrio, @Cedula, @Celular, @Ubicacion, @Apellidos, @Nombres, @Direccion, @Telefono_fijo, @Correo, @Id_usernuevo)" 
                    ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT Id_Investigador, Id_usuario, Barrio, Cedula, Celular, Ubicacion, Nombres + ' ' + Apellidos AS Nombres, Direccion, Telefono_fijo, Correo, Id_usernuevo FROM Tabla_Investigador" 
                    
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

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />


   



</asp:Content>

