<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="FacturacionIndividual.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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
               height: 58px;
               width: 186px;
           }
           .auto-style2 {
               height: 58px;
               width: 234px;
           }
           .auto-style4 {
               width: 230px;
           }
           .auto-style5 {
               width: 46px;
           }
           .auto-style6 {
               height: 28px;
               width: 837px;
           }
           .auto-style7 {
               width: 100%;
           }
           .auto-style13 {
               width: 111px;
           }
           .auto-style14 {
               width: 837px;
           }
           .auto-style20 {
               width: 181px;
               height: 30px;
           }
           .auto-style21 {
               width: 181px;
               height: 23px;
           }
           .auto-style22 {
               width: 181px;
               height: 28px;
           }
       </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



      <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 GASTOS GENERADOS EN INVESTIGACION<br />
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewGastos" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewGastos_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField SelectText="Agregar" ShowSelectButton="True" />
                        <asp:BoundField DataField="N_ID_GASTO" HeaderText="ID" />
                          <asp:BoundField DataField="FECHA" HeaderText="FECHA" />
                          <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" />
                          <asp:BoundField DataField="CONCEPTO" HeaderText="CONCEPTO" />
                          <asp:BoundField DataField="FK_ID_LEGALIZACION" HeaderText="LEGALIZACION" />
                          <asp:BoundField DataField="N_VALOR" HeaderText="VALOR" />
                        <asp:CheckBoxField AccessibleHeaderText="test" />
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


    

    <br />

    <div id ="Div1" runat ="server" class="FormatoDiv"> 





                  <asp:Label ID="Label3" runat="server" Text="Seleccione Un Concepto" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Concepto" runat="server" AutoPostBack="True" >
                  </asp:DropDownList>
              
              



                  <br />
                  <br />
                  <asp:TextBox ID="TextBoxValor" runat="server"></asp:TextBox>
                  <br />
                  <br />
                  <asp:Button ID="Button1" runat="server" Height="48px" OnClick="Button1_Click" Text="Ingresar Gasto" Width="163px" />
              
              



                  <br />
                  <br />
              
              



    </div>


    <br />

    
      <div id ="Div_Gastos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 RESUMEN DE FACTURA<br />
                              
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewFacturaGastos" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." AllowSorting="True" Width="598px"  AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewFacturaGastos_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Quitar" ShowSelectButton="True" />
                        <asp:BoundField HeaderText="ID" DataField="N_ID_GASTO" />
                        <asp:BoundField HeaderText="CONCEPTO" DataField="CONCEPTO" />
                        <asp:BoundField HeaderText="VALOR" DataField="N_VALOR" />
                    </Columns>
                </asp:GridView>


                
                  
                                 <br />
                                 TOTAL GASTOS INVESTIGACION:&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad6" runat="server" Font-Size="Medium" Text="$"></asp:Label>
                                 <asp:Label ID="LabelGastosInvestigacion0" runat="server" Font-Size="Medium"></asp:Label>
                                 <br />
                                 <br />
                                 SERVICIO DE INVESTIGACION :
                                 <asp:Label ID="LabelCiudad7" runat="server" Font-Size="Medium" Text="$"></asp:Label>
                                 <asp:Label ID="LabelServicioDeInvestigacion2" runat="server" Font-Size="Medium"></asp:Label>
                                 <br />
                                 <br />
                                 SUBTOTAL INVESTIGACION :
                                 <asp:Label ID="LabelCiudad8" runat="server" Font-Size="Medium" Text="$"></asp:Label>
                                 <asp:Label ID="LabelSubTotal0" runat="server" Font-Size="Medium"></asp:Label>
                                 <br />
                                 <br />
                                 IVA : 
                                 <asp:Label ID="LabelCiudad9" runat="server" Font-Size="Medium" Text="$"></asp:Label>
                                 <asp:Label ID="LabelIVA0" runat="server" Font-Size="Medium"></asp:Label>
                                 <br />
                                 <br />
                                 TOTAL A PAGAR :
                                 <asp:Label ID="LabelCiudad10" runat="server" Font-Size="Large" Text="$"></asp:Label>
                                 <asp:Label ID="LabelTotalAPagar0" runat="server" Font-Size="X-Large"></asp:Label>


                
                  
                                 <br />
&nbsp;&nbsp;&nbsp;
                                 <br />
                          </tr>
                     
                      
                  </table>

              
              </div>


   
    <br />

    
    <div id ="Div2" runat ="server" class="FormatoDiv"> 

     <table style="width: 100%;">
                      <tr>
                          <td align="center">




                
                  
                                 
                              ACTUALIZAR FECHA FACTURA<br />
                              <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                              <br />




                
                  
                                 
                              <input type="button" value="IMPRIMIR FACTURA" onclick="javascript: printDiv('Div3')" class="auto-style1" />&nbsp;<br />
                              <br />




                
                  
                                 
                              <input type="button" value="IMPRIMIR RELACION DE GASTOS" onclick="javascript: printDiv('Div_Gastos')" class="auto-style2" /><br />
                              <br />
                              <asp:Label ID="Label4" runat="server" Text="Numero De Factura Fisica"></asp:Label>
                              <br />
                              <asp:TextBox ID="TextBoxNumeroFacturaFisica" runat="server"></asp:TextBox>
                              <br />
                              <br />
                              <asp:Button ID="ButtonPrefacturaOK" runat="server" Height="54px" OnClick="Button2_Click" Text="FINALIZAR FACTURA" Width="179px" />
                              <br />
                              <br />




                
                  
                                 
                              <br />
                            
              
              
                          </td>
                     </tr>
                     
                      
                  </table>


    </div>


    <br />

    
     

      <div id ="Div_factura" class="FormatoDiv" runat ="server"> 
           <div id ="Div3"  >
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
                                 <asp:Label ID="LabelCiudadFactura" runat="server" Font-Size="Small"></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                 <asp:Label ID="LabelFechaDeFactura" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNombreAnalista" runat="server" Font-Size="Small"></asp:Label>
                                 &nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelFechaVencimiento" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCompania" runat="server" Font-Size="Small"></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                 <asp:Label ID="LabelNitCpmpania" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelDieccion" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 <br />
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNombreDelAfiliado0" runat="server" Font-Size="Small" Text="ASEGURADO:"></asp:Label>
                                 &nbsp;<asp:Label ID="LabelNombreDelAfiliado" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCC" runat="server" Font-Size="Small" Text="CEDULA:  CC."></asp:Label>
                                 <asp:Label ID="LabelCedula" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelTipoDeCaso0" runat="server" Font-Size="Small" Text="RAMO:"></asp:Label>
                                 <asp:Label ID="LabelTipoDeCaso" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelNumeroDeCaso1" runat="server" Font-Size="Small" Text="ORDEN DE TRABAJO:"></asp:Label>
                                 &nbsp;<asp:Label ID="LabelNumeroDeCaso" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad0" runat="server" Font-Size="Small" Text="CIUDAD:"></asp:Label>
                                 &nbsp;<asp:Label ID="LabelCiudad" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                              
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelServicioDeInvestigacion" runat="server" Font-Size="Small" Text="SERVICIO DE INVESTIGACION............................................."></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad1" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelServicioDeInvestigacion0" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelServicioDeInvestigacion1" runat="server" Font-Size="Small" Text="GASTOS DE INVESTIGACION..............................................."></asp:Label>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Label ID="LabelCiudad2" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelGastosInvestigacion" runat="server" Font-Size="Small"></asp:Label>
                                 <br />
                                 <br />
                                 <table class="auto-style7">
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre0" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad11" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor0" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre1" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad12" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor1" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre2" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad13" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor2" runat="server" Font-Size="Small"></asp:Label>
                              
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre3" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad14" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor3" runat="server" Font-Size="Small"></asp:Label>
                  

                  

                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre4" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad15" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor4" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre5" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad16" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor5" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre6" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad17" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor6" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre7" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad18" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor7" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre8" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad19" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor8" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre9" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad20" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor9" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre10" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad21" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor10" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre11" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad22" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor11" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre12" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad23" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor12" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style5">&nbsp;</td>
                                         <td class="auto-style4"><asp:Label ID="LabelNombre13" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style13">
                                             <asp:Label ID="LabelCiudad24" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelValor13" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     </table>
                              &nbsp;
                                
&nbsp;&nbsp;<table class="auto-style7">
                                     <tr>
                                         <td class="auto-style14" rowspan="2"><asp:Label ID="LabelValorEnLetras" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                         <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="LabelCiudad3" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelSubTotal" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="LabelCiudad4" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelIVA" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td class="auto-style6">
                                         </td>
                                         <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="LabelCiudad5" runat="server" Font-Size="Small" Text="$"></asp:Label>
                                 <asp:Label ID="LabelTotalAPagar" runat="server" Font-Size="Small"></asp:Label>
                                         </td>
                                     </tr>
                                     </table>
                                 <br />
                          </tr>
                     
                      
                  </table>
               </div>
              
              </div>


         


      <br />



</asp:Content>

