<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="DepartamentosPage.aspx.cs" Inherits="Administracion_DepartamentosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">


      
        <asp:Label ID="Label2" runat="server" 
            Text="Panel  Administracion De Ciudades" 
            CssClass="titulos" ></asp:Label>


           
   <a name="tema1"></a>
 

        <br />
       
 

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
         

             <asp:Label ID="Label3" runat="server" Text="Seleccione Un Departamento " 
                 CssClass="subtitulo"></asp:Label>


             <br />
             <br />
             <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                 onselectedindexchanged="DropDownList1_SelectedIndexChanged">
             </asp:DropDownList>
             <br />
             <br />
             
            

             <asp:Button ID="b_nuevaciudad" runat="server" Text="Nueva Ciudad"  
                 PostBackUrl="#tema1" onclick="b_nuevaciudad_Click" />
             <br />
             <asp:Label ID="lb_info_operacion" runat="server" CssClass="mensaje"></asp:Label>
             
            

             <br />
             <asp:Panel ID="Panel2" runat="server" BackColor="#FFCC00" BorderColor="Black" 
                 Visible="False">
                 <div align="center">
                     <br />
                     <asp:Label ID="Label4" runat="server" Text="Escriba La Nueva Ciudad" 
                         CssClass="subtitulo"></asp:Label>
                     <br />
                     <br />
                     <asp:TextBox ID="tb_nuevo" runat="server" Width="171px"></asp:TextBox>
                     <br />
                     <br />
                     <asp:Button ID="Button3" runat="server" Text="Crear Ciudad" 
                         onclick="Button3_Click" />
                     <br />
                 </div>
             </asp:Panel>
             <br />
             <asp:Label ID="Label5" runat="server" Text="Lista De Ciudades" 
                 CssClass="subtitulo"></asp:Label>
             <br />
             <br />
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                 DataKeyNames="Id_ciudad" DataSourceID="SqlDataSource1" 
                 EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" 
                 ForeColor="#333333" GridLines="Both">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                     <asp:BoundField DataField="Id_ciudad" HeaderText="Codigo" ReadOnly="True" 
                         SortExpression="Id_ciudad" />
                     <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" 
                         SortExpression="Ciudad" >
                     <ItemStyle Font-Bold="True" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Departamento" HeaderText="CodDepartamento" 
                         SortExpression="Departamento" Visible="False" />
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
                 DeleteCommand="DELETE FROM [Tabla_Ciudades] WHERE [Id_ciudad] = @Id_ciudad" 
                 InsertCommand="INSERT INTO [Tabla_Ciudades] ([Ciudad], [Departamento]) VALUES (@Ciudad, @Departamento)" 
                 ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                 SelectCommand="SELECT Id_ciudad, Ciudad, Departamento FROM Tabla_Ciudades WHERE (Departamento = @ideparta)" 
                 
                 UpdateCommand="UPDATE [Tabla_Ciudades] SET [Ciudad] = @Ciudad, [Departamento] = @Departamento WHERE [Id_ciudad] = @Id_ciudad">
                 <DeleteParameters>
                     <asp:Parameter Name="Id_ciudad" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Ciudad" Type="String" />
                     <asp:Parameter Name="Departamento" Type="Int32" />
                 </InsertParameters>
                 <SelectParameters>
                     <asp:SessionParameter Name="ideparta" SessionField="departamento" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="Ciudad" Type="String" />
                     <asp:Parameter Name="Departamento" Type="Int32" />
                     <asp:Parameter Name="Id_ciudad" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
             <br />
             <br />
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:OkConexionBase %>" 
                 DeleteCommand="DELETE FROM [Tabla_departamentos] WHERE [Id_departamento] = @Id_departamento" 
                 InsertCommand="INSERT INTO [Tabla_departamentos] ([Nombre]) VALUES (@Nombre)" 
                 ProviderName="<%$ ConnectionStrings:OkConexionBase.ProviderName %>" 
                 SelectCommand="SELECT [Id_departamento], [Nombre] FROM [Tabla_departamentos]" 
                 UpdateCommand="UPDATE [Tabla_departamentos] SET [Nombre] = @Nombre WHERE [Id_departamento] = @Id_departamento">
                 <DeleteParameters>
                     <asp:Parameter Name="Id_departamento" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Nombre" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="Nombre" Type="String" />
                     <asp:Parameter Name="Id_departamento" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
             <br />
             <br />
             &nbsp; &nbsp;<br />&nbsp;<asp:Button ID="b_edicion" runat="server" 
                 Text="Habilitar Edición" CssClass="botones" Height="26px" Width="142px" 
                 onclick="b_edicion_Click" Visible="False" />
             &nbsp;
             <asp:Button ID="b_eliminacion" runat="server" CssClass="botones" 
                 Text="Habilitar Eliminación" onclick="b_eliminacion_Click" 
                 Visible="False" />
             <br />
             <br />
             <br />
             <br />
             <br />

             





         </div>



        </ContentTemplate>


    </asp:UpdatePanel>


</asp:Content>

