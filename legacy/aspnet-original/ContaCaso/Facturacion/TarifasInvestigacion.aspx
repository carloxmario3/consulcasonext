<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="TarifasInvestigacion.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

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



      <div id ="Div_ListaConceptos" runat ="server" class="FormatoDiv"> 
                  <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <br />
                                 <br />
                  

                  

                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="N_ID_SERVICIO" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="725px">
                                     <AlternatingRowStyle BackColor="#CCCCCC" />
                                     <Columns>
                                         <asp:BoundField DataField="N_ID_SERVICIO" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="N_ID_SERVICIO" />
                                         <asp:BoundField DataField="Expr1" HeaderText="TIPO DE CASO" SortExpression="Expr1" />
                                         <asp:BoundField DataField="Nombre" HeaderText="COMPAÑIA" SortExpression="Nombre" />
                                         <asp:BoundField DataField="VALOR" HeaderText="VALOR" SortExpression="VALOR" />
                                         <asp:CommandField ShowEditButton="True" />
                                     </Columns>
                                     <FooterStyle BackColor="#CCCCCC" />
                                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                     <SortedAscendingHeaderStyle BackColor="#808080" />
                                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                     <SortedDescendingHeaderStyle BackColor="#383838" />
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:contacasoConnectionString2 %>" DeleteCommand="DELETE FROM [TBL_VALOR_SERVICIO_INVESTIGACION] WHERE [N_ID_SERVICIO] = @N_ID_SERVICIO" InsertCommand="INSERT INTO [TBL_VALOR_SERVICIO_INVESTIGACION] ([FK_COMPANIAID], [FK_TIPODECASO], [VALOR]) VALUES (@FK_COMPANIAID, @FK_TIPODECASO, @VALOR)" ProviderName="<%$ ConnectionStrings:contacasoConnectionString2.ProviderName %>" SelectCommand="SELECT TBL_VALOR_SERVICIO_INVESTIGACION.VALOR, TBL_VALOR_SERVICIO_INVESTIGACION.N_ID_SERVICIO, consulbase73.dbo.Tabla_Compania.Nombre, consulbase73.dbo.Tabla_Tipodecaso.Nombre AS Expr1 FROM TBL_VALOR_SERVICIO_INVESTIGACION INNER JOIN consulbase73.dbo.Tabla_Compania ON TBL_VALOR_SERVICIO_INVESTIGACION.FK_COMPANIAID = consulbase73.dbo.Tabla_Compania.Id_compania INNER JOIN consulbase73.dbo.Tabla_Tipodecaso ON TBL_VALOR_SERVICIO_INVESTIGACION.FK_TIPODECASO = consulbase73.dbo.Tabla_Tipodecaso.Id_tipocaso" UpdateCommand="UPDATE [TBL_VALOR_SERVICIO_INVESTIGACION] SET   [VALOR] = @VALOR WHERE [N_ID_SERVICIO] = @N_ID_SERVICIO">
                                     <DeleteParameters>
                                         <asp:Parameter Name="N_ID_SERVICIO" Type="Int32" />
                                     </DeleteParameters>
                                     <InsertParameters>
                                         <asp:Parameter Name="FK_COMPANIAID" Type="Int64" />
                                         <asp:Parameter Name="FK_TIPODECASO" Type="Int64" />
                                         <asp:Parameter Name="VALOR" Type="Int64" />
                                     </InsertParameters>
                                     <UpdateParameters>
                                         <asp:Parameter Name="FK_COMPANIAID" Type="Int64" />
                                         <asp:Parameter Name="FK_TIPODECASO" Type="Int64" />
                                         <asp:Parameter Name="VALOR" Type="Int64" />
                                         <asp:Parameter Name="N_ID_SERVICIO" Type="Int32" />
                                     </UpdateParameters>
                                 </asp:SqlDataSource>
                  

                  

                                 <br />
                                 <br />
                  

                  

                              </td>
                          
                      </tr>
                     
                      
                  </table>

              
              </div>


    <br />


    

    <br />


    
   
    <br />

    




      <br />

 

</asp:Content>

