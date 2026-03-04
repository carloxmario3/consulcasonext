<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="NuevaLegalizacion.aspx.cs" Inherits="ContaCaso_NuevaLegalizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />

  
    
	<section>
		<h3>Legalizaciones</h3>
		
		
        <asp:ScriptManager ID="ScriptManagerLegalizaciones" runat="server">
            </asp:ScriptManager>


        <asp:UpdatePanel ID="UpdatePanel_Legalizaciones" runat="server">
            <ContentTemplate>
			

		  <div class="FormatoDivGrande">



              <div id ="Div_TerminarLegalizacion" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Button ID="Button_TerminarLegalizacion" runat="server" OnClick="Button_TerminarLegalizacion_Click" Text="Terminar Legalizacion" Height="82px" Width="225px" Font-Bold="True"  />
              
              
              </div>

              <br />



              <div class="FormatoDiv"> 

                   <asp:Label ID="Label10" runat="server" Text="Legalizacion Numero"></asp:Label>
                       <br />
                       <asp:Label ID="LabelNumeroLegalizacion" runat="server" Text="000000"></asp:Label>
                                    

              </div>
              <br />

              <div id ="DivInvestigador" runat ="server" class="FormatoDiv"> 
              
                  <asp:Label ID="Label1" runat="server" Text="Investigador"></asp:Label>
                  
                  <br />
                  <asp:Label ID="Label1NombreInvestigador" runat="server" Text="NombreInvestigador"></asp:Label>
                  
                  <br />
                  
              </div>

              <br />

              <div id ="DivPendienteLegalizar" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                           <asp:Label ID="Label6" runat="server" Text="Valor Pendiente Por Legalizar" ></asp:Label>
                           <br />
                   <asp:Label ID="Label_ValorPorLegalizar" runat="server" Text="000000000" ></asp:Label>


              </div>

              <br />


              <div id ="DivCaso" runat ="server" class="FormatoDiv" Visible="False"> 
              
              
                  <asp:Label ID="Label2" runat="server" Text="Caso Numero" ></asp:Label>
                  <br />
                  <asp:Label ID="LabelCaso" runat="server" Text="Caso"></asp:Label>
                  <br />
              
              
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
              
              
                  <br />
                  <asp:Button ID="ButtonEstaCiudad" runat="server" OnClick="ButtonEstaCiudad_Click" Text="Esta Ciudad" Height="53px" Width="139px" />
              
              
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
              
              
                  <asp:Button ID="Button_AgregarConcepto2" runat="server" OnClick="Button_AgregarConcepto2_Click" Text="Agregar Concepto" Height="57px" Width="167px"  />
              
              
              </div>

              <br />

              <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv" Visible="False"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                              <asp:GridView ID="GridView_Gastos" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView_Gastos_SelectedIndexChanged">
                                  <Columns>
                                      <asp:CommandField SelectText="Quitar" ShowSelectButton="True" />
                                      <asp:BoundField DataField="N_ID_GASTO" HeaderText="ID" />
                                      <asp:BoundField DataField="CONCEPTO" HeaderText="CONCEPTO" />
                                      <asp:BoundField DataField="FECHA" HeaderText="FECHA" />
                                      <asp:BoundField DataField="VALOR" HeaderText="VALOR" />
                                  </Columns>
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

              

              



        
       </div>

                


           </ContentTemplate>
        </asp:UpdatePanel>


	</section>
	




</asp:Content>

