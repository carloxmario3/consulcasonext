<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="PanelDeCuentasLegalizacion.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />

    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
              </ContentTemplate>
    </asp:UpdatePanel>



             <br />
             <div id="Div1" runat="server" class="FormatoDiv">
                 <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                     <ProgressTemplate>
                         <div align="center">
                             <asp:Image ID="Image2" runat="server" Height="31px" ImageUrl="~/imagenes/image003.gif" Width="31px" />
                             <br />
                             <asp:Label ID="Label91" runat="server" ForeColor="#000099" Text="REALIZANDO CUENTAS POR FAVOR ESPERE.......... UN MINUTO APROX....... "></asp:Label>
                         </div>
                     </ProgressTemplate>
                 </asp:UpdateProgress>
                 <br />
                 <asp:Label ID="Label3" runat="server" Text="Seleccione Un Investigador"></asp:Label>
                 <br />
                 <asp:DropDownList ID="DropDownListInvestigador" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListInvestigador_SelectedIndexChanged">
                 </asp:DropDownList>
             </div>
             <br />
            
        


    <br />

    
    <div id ="Div2" runat ="server" class="FormatoDiv"> 
        
    <asp:Label ID="Label4" runat="server" Text="SALDO INVESTIGADOR" ></asp:Label>
                  <br />

        
                                 <asp:Label ID="Labelsigno" runat="server" Font-Size="Medium" Text="$"></asp:Label>

        
                  <asp:Label ID="LabeLPendientePorLegalizar" runat="server" Text="00000000" ></asp:Label>
    </div>



    <br />


      <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">

                              Consignaciones<br />
                              <br />
                              <br />
                              Total Consignaciones:
                                 <asp:Label ID="Labelsigno0" runat="server" Font-Size="Medium" Text="$"></asp:Label>

        
                  <asp:Label ID="LabelTotalConsignaciones" runat="server" Text="00000000" ></asp:Label>
                              <br />
                  

                  

                                 <asp:GridView ID="GridViewGastos" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewGastos_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="N_ID_INGRESO_VIATICOS" HeaderText="CODIGO" />
                          <asp:BoundField DataField="N_VALOR" HeaderText="VALOR" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                          <asp:BoundField DataField="T_FECHA_HORA" HeaderText="FECHA" />
                          <asp:BoundField DataField="FK_TRANSACCION" HeaderText="TRANSACCION" Visible="False" />
                          <asp:BoundField DataField="ID_INVESTIGADOR" HeaderText="INVESTIGADOR" Visible="False" />
                        <asp:CommandField SelectText="VER SOPORTE" ShowSelectButton="True" />
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


                
                  
                              </td>
                          
                           <td align="center">
                  
                               Legalizaciones
                  

                                 <br />
                               <br />
                               <br />
                               Total Legalizaciones:
                                 <asp:Label ID="Labelsigno1" runat="server" Font-Size="Medium" Text="$"></asp:Label>

        
                  <asp:Label ID="LabelTotalLegalizaciones" runat="server" Text="00000000" ></asp:Label>
                               <br />
                  

                                 <asp:GridView ID="GridViewLegalizaciones" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewLegalizaciones_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="CODIGO" HeaderText="NUMERO" />
                          <asp:BoundField DataField="TOTALLEGALIZACION" HeaderText="VALOR" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FK_CASO" HeaderText="CASO" />
                          <asp:BoundField DataField="T_FECHA" HeaderText="FECHA" />
                          <asp:BoundField DataField="TERMINADO" HeaderText="TERMINADO" />
                          <asp:BoundField DataField="FK_TRANSACCION" HeaderText="TRANSACCION" Visible="False" />
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


                
                  
                              </td>
                          

                      </tr>
                     
                      
                  </table>

              
                  <br />

              
              </div>


    <br />


     <div id ="Div4" runat ="server" class="FormatoDiv"> 

           &nbsp;<asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click1" Text="Ver Legalizaciones" Height="51px" Width="173px" />

     </div>

   


     <div id ="Div3" runat ="server" class="FormatoDiv2"> 

     <asp:Panel ID="Panel1" runat="server">
       
         </asp:Panel>

         </div>
     

</asp:Content>

