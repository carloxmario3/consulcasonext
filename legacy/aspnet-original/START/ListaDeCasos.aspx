<%@ Page Title="" Language="C#" MasterPageFile="~/START/MasterPage.master" AutoEventWireup="true" CodeFile="ListaDeCasos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
* {
	padding:0;
	margin-left: 0;
    margin-right: 0;
    margin-bottom: 0;
}



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <br />
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Width="319px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" />
    <br />
               <br />
   
    

    
   
               

                
   
               

                                 <asp:GridView ID="GridViewCasosSuspendidos" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewCasosSuspendidos_SelectedIndexChanged"  >
                                     <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="Ver Caso" ShowSelectButton="True" />
                    </Columns>
                                     <FooterStyle BackColor="#CCCCCC" />
                                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                     <SortedAscendingHeaderStyle BackColor="Gray" />
                                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                     <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>


                
                  
                                 <br />
     
    

    <H1>LISTAS DE CASOS</H1>
    <br />

               
                    
                      <a href='/ConsulCaso9/SEGUIMIENTOSACTIVOS.aspx'><asp:Image ID="Image6" runat="server" ImageUrl="~/START/img/SEGUIMIENTOS ACTIVOS .png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>


      <a href='/ConsulCaso9/CASOSPORASIGNAR.aspx'><asp:Image ID="Image1" runat="server" ImageUrl="~/START/img/CASOS POR ASIGNAR.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSASIGNADOS.aspx'><asp:Image ID="Image2" runat="server" ImageUrl="~/START/img/CASOS ASIGNADOS.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSPORREVISAR.aspx'><asp:Image ID="Image3" runat="server" ImageUrl="~/START/img/CASOS POR REVISAR.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSPORENVIAR.aspx'><asp:Image ID="Image4" runat="server" ImageUrl="~/START/img/CASOS POR ENVIAR.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSCOMPLETOS.aspx'><asp:Image ID="Image5" runat="server" ImageUrl="~/START/img/CASOS COMPLETOS POR FACTURAR.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSFACTURADOS.aspx'><asp:Image ID="Image7" runat="server" ImageUrl="~/START/img/CASOS FACTURADOS.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSPAGADOS.aspx'><asp:Image ID="Image8" runat="server" ImageUrl="~/START/img/CASOS PAGADOS.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    

      <a href='/ConsulCaso9/CASOSSUSPENDIDOS.aspx'><asp:Image ID="Image9" runat="server" ImageUrl="~/START/img/CASOS SUSPENDIDOS.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>

    
      <a href='/ConsulCaso9/SeguimientoLaborales.aspx'><asp:Image ID="Image10" runat="server" ImageUrl="~/START/img/laboral.jpg" 
                                CssClass="imagenes" ToolTip="Lista De Casos"/></a>
                    
    <br />
                   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />
                        
                       
                      

                            
				



    

    
   
               

</asp:Content>

