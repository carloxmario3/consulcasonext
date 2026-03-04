<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="Marcarpetas.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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
             width: 743px;
             height: 334px;
         }
     </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />

  
    
	

     <br />

    <div  class="FormatoDiv"> 

     <table style="width: 100%;">
                      <tr>
                          <td align="center">




                
                  
                                 
                              <input type="button" value="IMPRIMIR" onclick="javascript: printDiv('Div_ListaConceptos')" style="height: 58px; width: 126px" /><br />
                            
              
              
                          </td>
                     </tr>
                     
                      
                  </table>


    </div>

   
    <br />

    

      <div id ="Div_ListaConceptos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <img alt=""  src="../../ImagenNoProtegido/0.jpg" /><br />
                                 <asp:Label ID="LabelCompania" runat="server" Font-Size="XX-Large" Text="COMPANIA DE SEGUROS"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Label ID="LabelNumeroDeCaso" runat="server" Font-Size="XX-Large" Text="00000"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Label ID="LabelNombreDelAfiliado" runat="server" Font-Size="XX-Large" Text="Nombre Del Afiliado"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Label ID="LabelCC" runat="server" Font-Size="XX-Large" Text="CC."></asp:Label>
&nbsp;<asp:Label ID="LabelCedula" runat="server" Font-Size="XX-Large" Text="00.000.000"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Label ID="LabelDFAS3" runat="server" Font-Size="XX-Large" Text="Fecha De Entrega:" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True"></asp:Label>
                                 <asp:Label ID="Labelfechadeentrega" runat="server" Font-Size="XX-Large" Text="00000" Font-Underline="True"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:Label ID="LabelTipoDeCaso" runat="server" Font-Size="XX-Large" Text="TIPO DE CASO"></asp:Label>
                                 <br />
                                 <br />
                                 <br />
                                 <asp:Label ID="LabelCiudad" runat="server" Font-Size="XX-Large" Text="CIUDAD"></asp:Label>
                                 <br />
                  

                  

                                 <img alt="" class="auto-style1" src="CASOS.png" /><br />
&nbsp;<asp:Label ID="LabeliNVESTIGADOR0" runat="server" Font-Size="Medium" Text="NOMBRE INVESTIGADOR"></asp:Label>
                                 <br />
                                 <asp:Label ID="LabelDFAS2" runat="server" Font-Size="XX-Large" Text="Fecha De Asignacion:"></asp:Label>
                                 <asp:Label ID="Labelfechadeasignacion" runat="server" Font-Size="XX-Large" Text="00000"></asp:Label>
                                 <br />
                                 <br />
                                 <br />
                                 
                          </tr>
                     
                      
                  </table>

              
              </div>



    

   


   


</asp:Content>

