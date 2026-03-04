<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="GastosInvestigacion.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div id ="Div2" runat ="server" class="FormatoDiv"> 
        
    <asp:Label ID="Label4" runat="server" Text="Total Gastos Caso" ></asp:Label>
                  <br />

        
                  <asp:Label ID="LabelTotalGastos" runat="server" Text="00000000" ></asp:Label>
    </div>

    <br />


      <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <asp:GridView ID="GridViewGastos" runat="server" AutoGenerateColumns="False" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="795px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="N_ID_GASTO" HeaderText="ID" />
                          <asp:BoundField DataField="FECHA" HeaderText="FECHA" />
                          <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" />
                          <asp:BoundField DataField="CONCEPTO" HeaderText="CONCEPTO" />
                          <asp:BoundField DataField="FK_ID_LEGALIZACION" HeaderText="LEGALIZACION" />
                          <asp:BoundField DataField="N_VALOR" HeaderText="VALOR" />
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
              
              



    </div>



</asp:Content>

