<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="PanelDeControlSimple.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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
           .auto-style3 {
               height: 28px;
               width: 218px;
           }
           .auto-style4 {
               height: 28px;
               width: 258px;
           }
           .auto-style5 {
               height: 25px;
               width: 303px;
           }
           .auto-style6 {
               height: 27px;
               width: 234px;
           }
           .auto-style7 {
               height: 25px;
               width: 307px;
           }
           </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  
    
    
     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/START/img/laboral.jpg"  Height="98px" Width="108px" OnClick="ImageButton2_Click" />

  
    
	

     

    

     
      <div id ="Div_SEGUIMIENTOS" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 SEGUIMIENTOS ACTIVOS 
                                 <br />
                                 (ESTAR PENDIENTE FECHAS)<br />
                  

                  

                                 <asp:GridView ID="GridViewSeguimientos" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewSeguimientos_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />

    
      <div id ="Div_Gastos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS POR ASIGNAR<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewCasoSinAsignar" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewCasoSinAsignar_SelectedIndexChanged">
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />

  
    
      <div id ="DivCasosAsignados" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS ASIGNADOS<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewCasosAsignados" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewCasosAsignados_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />
    
         
    
      <div id ="DivCasosPorRevisar" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS POR REVISAR<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewCasosPorRevisar" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewCasosPorRevisar_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />

    
      <div id ="DivCasoEnviar" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS POR ENVIAR<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewCasoEnviar" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewCasoEnviar_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />


    
      <div id ="DivCompletos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS COMPLETOS POR FACTURAR<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewCompletos" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewCompletos_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />

    
      <div id ="DivFacturados" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS FACTURADOS<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewFacturados" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewFacturados_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />


     
      <div id ="DivPagados" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS PAGADOS<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewPagados" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  CellPadding="3" ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="GridViewPagados_SelectedIndexChanged" >
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>



      <br />


     
      <div id ="DivPagados" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 CASOS SUSPENDIDOS<br />
                              
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


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


        
    <div id ="Div2" runat ="server" class="FormatoDiv"> 

     <table style="width: 100%;">
                      <tr>
                          <td align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR SEGUIMIENTOS" onclick="javascript: printDiv('Div_SEGUIMIENTOS')" class="auto-style3" /><input type="button" value="IMPRIMIR CASOS POR ASIGNAR" onclick="    javascript: printDiv('Div_Gastos')" class="auto-style3" />




                
                  
                                 
                              <input type="button" value="IMPRIMIR CASOS CASOS ASIGNADOS" onclick="javascript: printDiv('DivCasosAsignados')" class="auto-style4" /><input type="button" value="IMPRIMIR CASOS POR REVISAR" onclick="    javascript: printDiv('DivCasosPorRevisar')" class="auto-style6" /><input type="button" value="IMPRIMIR CASOS POR ENVIAR" onclick="    javascript: printDiv('DivCasoEnviar')" class="auto-style6" /><input type="button" value="IMPRIMIR CASOS COMPLETOS POR FACTURAR" onclick="    javascript: printDiv('DivCompletos')" class="auto-style7" />




                
                  
                                 
                              <input type="button" value="IMPRIMIR CASOS FACTURADOS" onclick="javascript: printDiv('DivFacturados')" class="auto-style5" /><input type="button" value="IMPRIMIR CASOS PAGADOS" onclick="    javascript: printDiv('DivPagados')" class="auto-style5" /><br />




                
                  
                                 
                          </td>
                     </tr>
                     
                      
                  </table>


    </div>


    <br />

   
    <br />

      <br />



</asp:Content>

