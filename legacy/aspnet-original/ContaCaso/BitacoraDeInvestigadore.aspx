<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="BitacoraDeInvestigadore.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />

    <br />


    


             <br />
             <div id="Div1" runat="server" class="FormatoDiv">
                 <br />
                 <asp:Label ID="Label3" runat="server" Text="Seleccione Un Investigador"></asp:Label>
                 <br />
                 <asp:DropDownList ID="DropDownListInvestigador" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListInvestigador_SelectedIndexChanged">
                 </asp:DropDownList>
             </div>
             <br />
            
        

    <br />


       <div class='FormatoDivGrande'>
  
         


           <h1>Bitacora De Investigador</h1>
        
      <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <br />
                  

                  

                                 <asp:TextBox ID="TextBox1" runat="server" Height="92px" TextMode="MultiLine" Width="426px"></asp:TextBox>
                                 <br />
                                 <asp:Button ID="Button1" runat="server" Height="29px" OnClick="Button1_Click" Text="Agregar" Width="102px" />
                                 <br />
                                 <br />
                  

                  

                                 <asp:GridView ID="GridViewBitacora" runat="server" 
                    
                    EmptyDataText="No hay registros de datos para mostrar." 
                     CellPadding="4" 
                    ForeColor="#333333" AllowSorting="True" Width="492px" >
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



  
     

</asp:Content>

