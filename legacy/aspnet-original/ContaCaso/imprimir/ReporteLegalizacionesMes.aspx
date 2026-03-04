<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ReporteLegalizacionesMes.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div id ="Div2" runat ="server" class="FormatoDiv"> 
        
    <asp:Label ID="Label4" runat="server" Text="PENDIENTE POR LEGALIZAR" ></asp:Label>
                  <br />

        
                  <asp:Label ID="LabeLPendientePorLegalizar" runat="server" Text="00000000" ></asp:Label>
    </div>

    <br />

    <div  class="FormatoDiv"> 

     <table style="width: 100%;">
                      <tr>
                          <td align="center">





                  <asp:Label ID="Label5" runat="server" Text="Fecha Inicial" ></asp:Label>
                  <br />
                  <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                              <br />





                  <asp:Label ID="Label6" runat="server" Text="Fecha Final" ></asp:Label>
                  <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                              <br />





                  <asp:Label ID="Label3" runat="server" Text="Seleccione Un Investigador" ></asp:Label>
                  <br />
                              <br />
                  <asp:DropDownList ID="DropDownListInvestigador" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListInvestigador_SelectedIndexChanged">
                  </asp:DropDownList>
                  <br />
                              <br />


                
                  
                                 
                              <input type="button" value="IMPRIMIR" onclick="javascript: printDiv('Div_ListaConceptos')" style="height: 58px; width: 126px" /><br />
                              <br />
                              <br />
                              <asp:Button ID="Button1" runat="server" Height="56px" OnClick="Button1_Click2" Text="Guardar Pdf" Width="153px" />
                              <br />
              
              
                          </td>
                     </tr>
                     
                      
                  </table>


    </div>

    <br />
    <br />



    

      <div id ="Div_ListaConceptos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <asp:GridView ID="GridViewGastos" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewGastos_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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


                
                  
                                 
                              &nbsp;</tr>
                     
                      
                  </table>

              
              </div>


    <br />


    

    <br />

   


</asp:Content>

