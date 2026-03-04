<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="AbrirCarpeta.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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

    
    
      <a href='javascript:history.go(-1)'> <img src="/imagenes/wm-back.png" alt="Smiley face" > </a>

  
    
	

     <br />

   
    <br />

    

      <div id ="Div_ListaConceptos" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <img alt=""  src="../../ImagenNoProtegido/0.jpg" /><br />
                                 <br />
                                 <br />
                                 <br />
                                 HAGA CLIC EN EL BOTON AZUL PARA REGRESAR A LA INFORMACION DEL CASO<br />
                                 <br />
                                 <br />
                                 <br />
&nbsp;<br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                                 <br />
                  

                  

                                 <br />
&nbsp;<br />
                                 <br />
                                 <br />
                                 <br />
                                 
                          </tr>
                     
                      
                  </table>

              
              </div>



    

   


   


</asp:Content>

