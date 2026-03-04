<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="FacturacioMultiple.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

       <script language="javascript" type="text/javascript">


           function printDiv(divID) {
               //Get the HTML of div
               var divElements = document.getElementById(divID).innerHTML;
               //Get the HTML of whole page
               var oldPage = document.body.innerHTML;

               //Reset the page's HTML with div's HTML only
               document.body.innerHTML =
                 "<html><head><title></title></head><body>" +
                 divElements + "</body>";

               //Print Page
               window.print();

               //Restore orignal HTML
               document.body.innerHTML = oldPage;


           }


           function imprimamen() {

               //Print Page
               window.print();




           }
    </script>



       <style type="text/css">
           .auto-style1 {
               height: 23px;
               width: 212px;
           }
           .auto-style2 {
               height: 28px;
               width: 215px;
           }
           .auto-style3 {
               height: 31px;
               width: 287px;
           }
           .auto-style4 {
               height: 20px;
               width: 245px;
           }
           .auto-style5 {
               height: 21px;
               width: 248px;
           }
           .auto-style6 {
               height: 30px;
               width: 218px;
           }
           .auto-style8 {
               width: 70%;
               height: 96px;
           }
       </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
    
    <div id ="Div1" runat ="server" class="FormatoDiv"> 

     <table  style="width: 100%;" border="0">
                      <tr>
                          <td align="center">




                
                  
                                 
                              &nbsp;<table style="width:100%;">
                                  <tr>
                                      <td align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR FACTURA SERVICIOS" onclick="javascript: printDiv('Div_facturaServicios')" class="auto-style6" /></td>
                                      <td  align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR FACTURA GASTOS" onclick="javascript: printDiv('Div_facturaGastos')" class="auto-style1" /></td>
                                      <td  align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR FACTURA GASTOS FIJOS" onclick="javascript: printDiv('Div_facturaGastosfijos')" class="auto-style4" /></td>
                                  </tr>
                                  <tr>
                                      <td align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR RELACION SERVICIOS" onclick="javascript: printDiv('Div_RelacionServicios')" class="auto-style2" /></td>
                                      <td align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR RELACION GASTOS VARIABLES" onclick="javascript: printDiv('Div_RelacionGastosVariables')" class="auto-style3" /></td>
                                      <td align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR RELACION GASTOS FIJOS" onclick="javascript: printDiv('Div_RelacionGastosFIJOS')" class="auto-style5" /></td>
                                  </tr>
                                  <tr>
                                      <td align="center"><asp:Label ID="Label4" runat="server" Text="Numero De Factura Fisica Servicios"></asp:Label>
                                          <br />
                              <asp:TextBox ID="TextBoxNumeroFacturaFisicaServicio" runat="server"></asp:TextBox>
                                          </td>
                                      <td  align="center">
                              <asp:Label ID="Label24" runat="server" Text="Numero De Factura Fisica Gastos Variables"></asp:Label>
                                          <br />
                              <asp:TextBox ID="TextBoxNumeroFacturaFisicaGastos" runat="server"></asp:TextBox>
                                          <br />
                                      </td>
                                      <td align="center">
                              <asp:Label ID="Label25" runat="server" Text="Numero De Factura Fisica Gastos Fijos"></asp:Label>
                                          <br />
                              <asp:TextBox ID="TextBoxNumeroFacturaFisicaGastosFijos" runat="server"></asp:TextBox>
                                          </td>
                                  </tr>
                                  <tr>
                                      <td align="center">&nbsp;</td>
                                      <td  align="center">
                                          <br />
                                          ACTUALIZAR FECHA FACTURA<asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                      </td>
                                      <td align="center">
                                          &nbsp;</td>
                                  </tr>
                              </table>
                            
              
              
                          </td>
                     </tr>
                     
                      
                  </table>

                              <br />
        <br />
        <br />

                              <asp:Button ID="ButtonPrefacturaOK" runat="server" Height="39px" OnClick="Button2_Click" Text="FINALIZAR FACTURA MULTIPLE" Width="233px" />

        <br />
    </div>

    <br />


      <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  


                                 Agregar Facturas a Facturacion Multiple<br />
                  

                  

                                 <asp:GridView ID="GridViewFacturas" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewFacturas_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Agregar" ShowSelectButton="True" />
                        <asp:BoundField DataField="N_ID_FACTURA" HeaderText="ID" />
                          <asp:BoundField DataField="FK_NUMERO_DE_CASO" HeaderText="CASO" />
                          <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                          <asp:BoundField DataField="Apellido" HeaderText="APELLIDO" />
                          <asp:BoundField DataField="Cedula" HeaderText="CEDULA" />
                          <asp:BoundField DataField="N_VALOR_SERVICIO_DE_INVESTIGACION" HeaderText="SERVICIO" />
                        <asp:BoundField DataField="N_VALOR_GASTOS_DE_INVESTIGACION" HeaderText="GASTOS" />
                        <asp:BoundField DataField="N_VALOR_SUBTOTAL" HeaderText="SUBTOTAL" />
                        <asp:BoundField DataField="N_VALOR_IVA" HeaderText="IVA" />
                        <asp:BoundField DataField="N_VALOR_TOTAL_A_PAGAR" HeaderText="TOTAL" />
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


                
                  
                              </td>
                          
                      </tr>
                     
                      
                  </table>

              
              </div>


      
   
    <br />

    

    
      <div id ="Div_RelacionServicios" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 &nbsp;RELACION SERVICIOS DE INVESTIGACION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               

                  

                                 &nbsp;&nbsp;&nbsp;
                                 <br />
                                                               

                  

                                 <asp:GridView ID="GridViewFacturasDeFacturasServicio" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewFacturasDeFacturas_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Quitar" ShowSelectButton="True" />
                        <asp:BoundField DataField="N_ID_FACTURA" HeaderText="ID" />
                          <asp:BoundField DataField="FK_NUMERO_DE_CASO" HeaderText="CASO" />
                          <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                          <asp:BoundField DataField="Apellido" HeaderText="APELLIDO" />
                          <asp:BoundField DataField="Cedula" HeaderText="CEDULA" />
                          <asp:BoundField DataField="N_VALOR_SERVICIO_DE_INVESTIGACION" HeaderText="SERVICIO" />
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


                
                  
                                 TOTAL SERVICIOS DE INVESTIGACION:
                                 <asp:Label ID="LabelCiudad1" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelServicioDeInvestigacion1" runat="server" Font-Size="Medium"></asp:Label>


                
                  
                          </tr>
                     
                      
                  </table>

              
              </div>



      <br />

    

     
      <div id ="Div_RelacionGastosVariables" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 &nbsp;RELACION GASTOS VARIABLES INVESTIGACION&nbsp;&nbsp;&nbsp;
                                 <br />
                                                               

                  

                                 <asp:GridView ID="GridViewGastosFacturaDeFactura" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewGastosFacturaDeFactura_SelectedIndexChanged"  >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                          <asp:BoundField DataField="FK_NUMERO_DE_CASO" HeaderText="CASO" />
                          <asp:BoundField DataField="T_NOMBRE" HeaderText="CONCEPTO GASTO" />
<asp:BoundField DataField="Nombre" HeaderText="NOMBRE"></asp:BoundField>
                        <asp:BoundField DataField="Apellido" HeaderText="APELLIDO" />
                          <asp:BoundField DataField="Cedula" HeaderText="CEDULA" />
                          <asp:BoundField DataField="N_VALOR" HeaderText="VALOR" />
                          <asp:BoundField DataField="N_VALOR_GASTOS_DE_INVESTIGACION" HeaderText="SUMA DE GASTOS" Visible="False" />
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


                
                  
                                 TOTAL GASTOS VARIABLES:
                                 <asp:Label ID="LabelCiudad2" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelGastosDeInvestigacion0" runat="server" Font-Size="Medium"></asp:Label>


                
                  
                          </tr>
                     
                      
                  </table>

              
              </div>


    <br />


       
      <div id ="Div_RelacionGastosFIJOS" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 &nbsp;RELACION GASTOS FIJOS INVESTIGACION&nbsp;&nbsp;&nbsp;
                                 <br />
                                                               

                  

                                 <asp:GridView ID="GridViewGastosFijos" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewGastosFijos_SelectedIndexChanged"  >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="N_ID_FACTURA" HeaderText="ID" />
                          <asp:BoundField DataField="FK_NUMERO_DE_CASO" HeaderText="CASO" />
                          <asp:BoundField DataField="Nombre" HeaderText="NOMBRE" />
                          <asp:BoundField DataField="Apellido" HeaderText="APELLIDO" />
                          <asp:BoundField DataField="Cedula" HeaderText="CEDULA" />
                        <asp:BoundField DataField="N_VALOR_GASTOS_DE_INVESTIGACION" HeaderText="GASTOS" />
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
                                 TOTAL GASTOS FIJOS:
                                 <asp:Label ID="LabelCiudad3" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelGastosFijosDeInvestigacion1" runat="server" Font-Size="Medium"></asp:Label>


                
                  
                          </tr>
                     
                      
                  </table>

              
              </div>
 

    <br />
    



    
 



<br />

    
    
      <div id ="Div_facturaServicios" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="left">
                  

                  

                                 &nbsp;<asp:Label ID="LabelIDFACTURA" runat="server" Font-Size="Small"></asp:Label>
                                 &nbsp;:::&nbsp; <asp:Label ID="LabelIDFACTURAFISICA" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudadFactura" runat="server" Font-Size="Small">BOGOTA D.C.</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                 <asp:Label ID="LabelFechaDeFactura" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNombreAnalista" runat="server" Font-Size="Small">JHONATAN JAVIER HERRERA</asp:Label>
                                 &nbsp;&nbsp;&nbsp;
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCompania" runat="server" Font-Size="Small">COLFONDOS S. A PENSIONES Y CESANTIAS</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNitCpmpania" runat="server" Font-Size="Small">800,149,496-2</asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelDieccion" runat="server" Font-Size="Small">CALLE 67 N 7-94 BOGOTA</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelDieccion1" runat="server" Font-Size="Small">376-51-55</asp:Label>
                                 <br />
                                 <br />
                              
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                              
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelServicioDeInvestigacion" runat="server" Font-Size="Small" Text="SERVICIO DE INVESTIGACION............................................."></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad4" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelServicioDeInvestigacion0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               

                  

                                 <br />
                  

                  

&nbsp;&nbsp;&nbsp;
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label26" runat="server" Font-Size="Small" Text="FAVOR CONSIGNAR E LA CUENTA CORRIENTE"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label27" runat="server" Font-Size="Small" Text="DEL BANCO AVVILLAS"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label28" runat="server" Font-Size="Small" Text="NUMERO 480574-18"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label29" runat="server" Font-Size="Small" Text="A NOMBRE DE CONSULTANDO LTDA"></asp:Label>
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;<table class="auto-style8">
                                     <tr>
                                         <td>&nbsp;
                                             <asp:Label ID="Label30" runat="server" Font-Size="Small" Text="Son:"></asp:Label>
                                 <asp:Label ID="LabelValorEnLetras" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     </table>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad5" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelSubTotal" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad6" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelIVA" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad7" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelTotalAPagar" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>

    <br />

      <div id ="Div_facturaGastos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="left">
                  

                  

                                 &nbsp;<asp:Label ID="LabelIDFACTURA0" runat="server" Font-Size="Small"></asp:Label>
                                 &nbsp;:::&nbsp; <asp:Label ID="LabelIDFACTURAFISICA0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudadFactura0" runat="server" Font-Size="Small">BOGOTA D.C.</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                 <asp:Label ID="LabelFechaDeFactura0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNombreAnalista0" runat="server" Font-Size="Small">JHONATAN JAVIER HERRERA</asp:Label>
                                 &nbsp;&nbsp;&nbsp;
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCompania0" runat="server" Font-Size="Small">COLFONDOS S. A PENSIONES Y CESANTIAS</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNitCpmpania0" runat="server" Font-Size="Small">800,149,496-2</asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelDieccion2" runat="server" Font-Size="Small">CALLE 67 N 7-94 BOGOTA</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelDieccion3" runat="server" Font-Size="Small">376-51-55</asp:Label>
                                 <br />
                                 <br />
                              
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                              
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label23" runat="server" Font-Size="Small" Text="GASTOS DE INVESTIGACION..............................................."></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad8" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelGastosDeInvestigacion" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               

                  

                                 <br />
                  

                  

&nbsp;&nbsp;&nbsp;
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label31" runat="server" Font-Size="Small" Text="FAVOR CONSIGNAR E LA CUENTA CORRIENTE"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label32" runat="server" Font-Size="Small" Text="DEL BANCO AVVILLAS"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label33" runat="server" Font-Size="Small" Text="NUMERO 480574-18"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label34" runat="server" Font-Size="Small" Text="A NOMBRE DE CONSULTANDO LTDA"></asp:Label>
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;<table class="auto-style8">
                                     <tr>
                                         <td>&nbsp;
                                             <asp:Label ID="Label35" runat="server" Font-Size="Small" Text="Son:"></asp:Label>
                                 <asp:Label ID="LabelValorEnLetras0" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     </table>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad9" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelSubTotal0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad10" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelIVA0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad11" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelTotalAPagar0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


    <br />

     
      <div id ="Div_facturaGastosfijos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="left">
                  

                  

                                 &nbsp;<asp:Label ID="LabelIDFACTURA1" runat="server" Font-Size="Small"></asp:Label>
                                 &nbsp;:::&nbsp; <asp:Label ID="LabelIDFACTURAFISICA1" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label3" runat="server" Font-Size="Small">BOGOTA D.C.</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                 <asp:Label ID="LabelFechaDeFactura1" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label6" runat="server" Font-Size="Small">JHONATAN JAVIER HERRERA</asp:Label>
                                 &nbsp;&nbsp;&nbsp;
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label7" runat="server" Font-Size="Small">COLFONDOS S. A PENSIONES Y CESANTIAS</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label8" runat="server" Font-Size="Small">800,149,496-2</asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label9" runat="server" Font-Size="Small">CALLE 67 N 7-94 BOGOTA</asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label10" runat="server" Font-Size="Small">376-51-55</asp:Label>
                                 <br />
                                 <br />
                              
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                              
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="Label11" runat="server" Font-Size="Small" Text="GASTOS DE INVESTIGACION..............................................."></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad12" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelGastosFijosInvestigacion" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               

                  

                                 <br />
                  

                  

&nbsp;&nbsp;&nbsp;
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label36" runat="server" Font-Size="Small" Text="FAVOR CONSIGNAR E LA CUENTA CORRIENTE"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label37" runat="server" Font-Size="Small" Text="DEL BANCO AVVILLAS"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label38" runat="server" Font-Size="Small" Text="NUMERO 480574-18"></asp:Label>
                                 <br />
                                 &nbsp;
                                 <asp:Label ID="Label39" runat="server" Font-Size="Small" Text="A NOMBRE DE CONSULTANDO LTDA"></asp:Label>
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;<table class="auto-style8">
                                     <tr>
                                         <td>&nbsp;
                                             <asp:Label ID="Label40" runat="server" Font-Size="Small" Text="Son:"></asp:Label>
                                 <asp:Label ID="LabelValorEnLetras1" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     </table>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad13" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelSubTotal1" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad14" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelIVA1" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LabelCiudad15" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelTotalAPagar1" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>

    <br />

      


</asp:Content>

