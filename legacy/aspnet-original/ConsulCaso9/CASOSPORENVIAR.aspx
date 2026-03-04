<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="CASOSPORENVIAR.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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


    

</asp:Content>

