<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ContaCaso_Menu_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>ContaCaso</title>
	<link rel="stylesheet" href="estilos.css">
	<link rel="stylesheet" href="http://i.icomoon.io/public/temp/7d96e2500b/UntitledProject7/style.css">
	<link rel="stylesheet" href="fonts.css">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    </style>

</head>
<body>


    <form id="form1" runat="server">
  

        <header>
		<div class="menu_bar">
			<a class="bt-menu" href="#"><img src="file-text.png"/>Menu</a>
		</div>

		<nav>
			<ul>
				
                <li><a href="Conceptos.aspx"><img src="file-text.png"/>Conceptos</a></li>
                <li><a href="#"><img src="file-text.png"/>Legalizar</a></li>				
				<li><a href="#"><img src="file-text.png"/>Gastos Casos</a></li>
                <li><a href="#"><img src="file-text.png"/>Legalizaciones</a></li>
				<li><a href="#"><img src="file-text.png"/>Investigadores</a></li>
				
                
			</ul>
		</nav>
	</header>

	<section>
		<h3>Legalizaciones</h3>
		
		
        <asp:ScriptManager ID="ScriptManagerLegalizaciones" runat="server">
            </asp:ScriptManager>


        <asp:UpdatePanel ID="UpdatePanel_Legalizaciones" runat="server">
            <ContentTemplate>
			

		  <div class="FormatoDivGrande">


              <div class="FormatoDiv"> 

                   <asp:Label ID="Label10" runat="server" Text="Legalizacion Numero"></asp:Label>
                       <br />
                       <asp:Label ID="LabelNumeroLegalizacion" runat="server" Text="000000"></asp:Label>
                                    

              </div>
              <br />

              <div id ="DivInvestigador" runat ="server" class="FormatoDiv"> 
              
                  <asp:Label ID="Label1" runat="server" Text="Seleccione Un Investigador"></asp:Label>
                  
                  <br />
                  
              <asp:DropDownList ID="DropDownList_Investigador" runat="server" OnSelectedIndexChanged="DropDownList_Investigador_SelectedIndexChanged" AutoPostBack="True">
                       </asp:DropDownList>

              </div>

              <br />

              <div id ="DivPendienteLegalizar" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                           <asp:Label ID="Label6" runat="server" Text="Valor Pendiente Por Legalizar" ></asp:Label>
                           <br />
                   <asp:Label ID="Label_ValorPorLegalizar" runat="server" Text="000000000" ></asp:Label>


              </div>

              <br />


              <div id ="DivCaso" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label2" runat="server" Text="Seleccione Un Caso" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Caso" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Caso_SelectedIndexChanged" >
                  </asp:DropDownList>
              
              
              </div>

              <br />


              <div id ="DivConcepto" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label3" runat="server" Text="Seleccione Un Concepto" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Concepto" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Concepto_SelectedIndexChanged" >
                  </asp:DropDownList>
              
              
              </div>

              <br />


              <div id ="Div_ciudad" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label4" runat="server" Text="Seleccione Una Ciudad" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Ciudad" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropDownList_Ciudad_SelectedIndexChanged" Width="225px">
                  </asp:DropDownList>
              
              
              </div>

              <br />


              <div id ="Diligencie_Valor" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label5" runat="server" Text="Diligencie El Valor" ></asp:Label>
                  <br />
                  <asp:Label ID="Label_ValorConcepto" runat="server" Text="00000000000000" Visible="False"></asp:Label>
              
              
                  <br />
                  <asp:TextBox ID="TextBox_ValorConcepto" runat="server" Visible="False"></asp:TextBox>
              
              
              </div>

              <br />


              <div id ="Div_Fecha" runat ="server" class="FormatoDiv" align="center" Visible="False"> 
              
                   <table style="width: 100%;">
                      <tr>
                          <td align="center">
              
                              <asp:Label ID="Label11" runat="server" Text="Seleccione Una Fecha"></asp:Label>
              
                  <asp:Calendar ID="CalendarFechaGasto" runat="server" OnSelectionChanged="CalendarFechaGasto_SelectionChanged" ></asp:Calendar>
              
                              </td>
                          
                      </tr>
                     
                      
                  </table>

              
              </div>

              <br />

              <div id ="Div_AgregarConcepto" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Button ID="Button_AgregarConcepto2" runat="server" OnClick="Button_AgregarConcepto2_Click" Text="Agregar Concepto"  />
              
              
              </div>

              <br />

              <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv" Visible="False"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                              <asp:GridView ID="GridView_Gastos" runat="server">
                              </asp:GridView>
                          </td>
                          
                      </tr>
                     
                      
                  </table>

              
              </div>

              <br />

              <div id ="Div_TotalLegalizacion" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label7" runat="server" Text="TOTAL LEGALIZACION ACTUAL" ></asp:Label>
                  <br />
                  <asp:Label ID="Label_TotalLegalizacion" runat="server" Text="000000000" ></asp:Label>
              
              
              </div>

              <br />

              <div id ="Div_PendientePorLegalizar" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label8" runat="server" Text="PENDIENTE POR LEGALIZAR" ></asp:Label>
                  <br />
                  <asp:Label ID="Label_PendienteLegalizarLuego" runat="server" Text="0000000" ></asp:Label>
              
              
              </div>

              <br />

              <div id ="Div_TerminarLegalizacion" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Button ID="Button_TerminarLegalizacion" runat="server" OnClick="Button_TerminarLegalizacion_Click" Text="Terminar Legalizacion"  />
              
              
              </div>

              



        
       </div>

                


           </ContentTemplate>
        </asp:UpdatePanel>


	</section>
	



	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="menu.js"></script>


    </form>



</body>
</html>
