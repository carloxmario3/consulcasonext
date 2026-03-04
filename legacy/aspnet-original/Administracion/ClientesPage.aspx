<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ClientesPage.aspx.cs" Inherits="ClientesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Panel  Administracion De Clientes" CssClass="titulos" ></asp:Label>
  
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

             <asp:Panel ID="Panel1" runat="server" Visible="False" BackColor="#FFCC00">
            <table border = "1" cellspacing = "5" style="height: 71px">
                <tr>
                    <td class="style1">
                        &nbsp;<asp:Label ID="Label1" 
                runat="server" CssClass="subtitulo" 
                Text="Ingrese Un Nuevo Cliente" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <br />
                        <asp:TextBox ID="tb_clientes" runat="server" CssClass="cajastexto"></asp:TextBox>
                        &nbsp;<br />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Button ID="b_nuevo" runat="server" Text="Agregar Nuevo Cliente" 
                CssClass="botones" PostBackUrl="#Ancla2" onclick="b_nuevo_Click" />
                        <br />
                    </td>
                </tr>
            </table>
        </asp:Panel>


                <br />
                <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
                <br />


                                <br />&nbsp;<asp:Label ID="Label3" runat="server" CssClass="subtitulo" 
                Text="Busque Un Cliente Por Nombre"></asp:Label>


    <br />
                <asp:TextBox ID="tb_buscar" runat="server" CssClass="cajastexto"></asp:TextBox>
                <br />
                <asp:Button ID="b_buscar" runat="server" CssClass="botones" Text="Buscar" 
                    Height="26px" onclick="b_buscar_Click" />
                <br />
                <br />

    <asp:Label ID="Label4" runat="server" CssClass="subtitulo" 
        Text="Lista De Clientes" Font-Bold="True" Font-Underline="True"></asp:Label>
    <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="Id_compania" DataSourceID="SqlDataSource1" 
                    EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
                    GridLines="Both" onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Oficinas" ShowSelectButton="True" >
                        <ItemStyle Font-Bold="True" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Id_compania" HeaderText="Codigo" ReadOnly="True" 
                            SortExpression="Id_compania" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                            SortExpression="Nombre" >
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                    DeleteCommand="DELETE FROM [Tabla_Compania] WHERE [Id_compania] = @Id_compania" 
                    InsertCommand="INSERT INTO [Tabla_Compania] ([Nombre]) VALUES (@Nombre)" 
                    ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                    SelectCommand="
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
                <br />
                <br />
                <br />
                <asp:Button ID="b_ver_todos" runat="server" CssClass="botones" 
                    Text="Ver Todos Los Clientes" Width="180px" onclick="b_ver_todos_Click" />
                &nbsp;&nbsp;<asp:Button ID="b_ver_nuevo" runat="server" Text="Nuevo Cliente" 
                    PostBackUrl="#Ancla1" onclick="b_ver_nuevo_Click" />
                <br />
                <br />

                 <asp:Button ID="b_edicion" runat="server" Text="Habilitar Edición" 
        CssClass="botones" Height="26px" Width="142px" onclick="b_edicion_Click" 
                    Visible="False" /> 
                &nbsp; 
        <asp:Button ID="b_eliminacion" runat="server" Text="Habilitar Eliminación" 
        CssClass="botones" onclick="b_eliminacion_Click" Visible="False" />

    <br />

     <a name="Ancla2"></a>


        </ContentTemplate>
    </asp:UpdatePanel>
         <br />
            <br />


   




</asp:Content>

