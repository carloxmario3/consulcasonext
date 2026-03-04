<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InvConsignaciones.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div id ="Div2" runat ="server" class="FormatoDiv"> 
        
    <asp:Label ID="Label4" runat="server" Text="PENDIENTE POR LEGALIZAR" ></asp:Label>
                  <br />

        
                  <asp:Label ID="LabeLPendientePorLegalizar" runat="server" Text="00000000" ></asp:Label>
    </div>

    <br />

     <div id ="Div1" runat ="server" class="FormatoDiv"> 





                  <asp:Label ID="Label3" runat="server" Text="Seleccione Un Investigador" ></asp:Label>
                  <br />
              
              



                  <br />
                  <br />
                  <br />
                  <br />
              
              



    </div>

    <br />
    <br />


      <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <asp:GridView ID="GridViewGastos" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px" OnSelectedIndexChanged="GridViewGastos_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="N_ID_INGRESO_VIATICOS" HeaderText="ID" />
                          <asp:BoundField DataField="T_FECHA_HORA" HeaderText="FECHA" />
                          <asp:BoundField DataField="FK_TRANSACCION" HeaderText="TRANSACCION" Visible="False" />
                          <asp:BoundField DataField="ID_INVESTIGADOR" HeaderText="INVESTIGADOR" Visible="False" />
                          <asp:BoundField DataField="N_VALOR" HeaderText="VALOR" />
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


                
                  
                              </td>
                          
                      </tr>
                     
                      
                  </table>

              
              </div>


    <br />


    

    <br />

   


</asp:Content>

