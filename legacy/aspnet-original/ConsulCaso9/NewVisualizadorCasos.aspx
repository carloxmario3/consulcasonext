<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="NewVisualizadorCasos.aspx.cs" Inherits="ConsulCaso9_NewVisualizadorCasos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="XX-Small" ForeColor="#003399"></asp:Label>  
   
    <a href='javascript:history.go(-1)'> <img src="/imagenes/wm-back.png" alt="Smiley face" > </a>

       <div class='FormatoDivGrande'>
  
     <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>


           <h1>Bitacora De Caso</h1>
        
      <table style="width: 100%;">
                      <tr>
                          <td align="center">
                  

                  

                                 <asp:TextBox ID="TextBox1" runat="server" Height="94px" TextMode="MultiLine" Width="426px"></asp:TextBox>
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

    <br />

    <div class='FormatoDivGrande'>
    
        <h1>Informacion</h1>

        </div>
      

    <asp:Panel ID="PanelInformacion" runat="server">
          
                  
    </asp:Panel>

  

    <!-- <div class='FormatoDivGrande'>
    <h1>Informes</h1>
        </div>

    <asp:Panel ID="PanelInformes" runat="server">+

    </asp:Panel>

    <div class='FormatoDivGrande'>
    <h1>Anexos</h1>
        </div>

    <asp:Panel ID="PanelAnexos" runat="server">+

    </asp:Panel>

    

    <div class='FormatoDivGrande'>
    <h1>Videos</h1>
        </div>

    <asp:Panel ID="Videos" runat="server">+

    </asp:Panel>


    <div class='FormatoDivGrande'>
    <h1>Recursos Investigador</h1>
        </div>
    
    <asp:Panel ID="PanelRecursos" runat="server">+

    </asp:Panel> -->
    
      <div class='FormatoDivGrande'>
    
        <h1>Cambio De Estado</h1>
        <p>
            <asp:Button ID="ButtonActivo" runat="server" Text="Activo" Height="42px" OnClick="ButtonActivo_Click" Width="59px" Font-Bold="True" ForeColor="#0000CC" />
            <asp:Button ID="ButtonRevisar" runat="server" Text="Revisar Informe" Height="42px" OnClick="ButtonRevisar_Click" Width="105px" Font-Bold="True" ForeColor="#0000CC" />
            <asp:Button ID="ButtonPorEnviar" runat="server" Text="Por Enviar" Height="43px" OnClick="ButtonPorEnviar_Click" Width="72px" Font-Bold="True" ForeColor="#0000CC" />
            <asp:Button ID="ButtonCompleto" runat="server" Text="Completo Por Facturar" Height="41px" OnClick="ButtonCompleto_Click" Width="153px" Font-Bold="True" ForeColor="#0000CC" />
            <asp:Button ID="ButtonFacturado" runat="server" Text="Facturado" Height="43px" OnClick="ButtonFacturado_Click" Width="70px" Font-Bold="True" ForeColor="#0000CC" />
            <asp:Button ID="ButtonPagado" runat="server" Text="Pagado" Height="43px" OnClick="ButtonPagado_Click" Width="70px" Font-Bold="True" ForeColor="#0000CC" />
            <asp:Button ID="ButtonSusendido" runat="server" Text="Suspendido" Height="43px" OnClick="ButtonSusendido_Click" Width="81px" Font-Bold="True" ForeColor="#0000CC" />
        </p>
        <p>





                  <asp:Label ID="Label5" runat="server" Text="Pendiente de documentos laborales?" Font-Bold="True" ></asp:Label>
                  </p>
          <p>





            <asp:Button ID="ButtonSI" runat="server" Text="SI" Height="43px"  Width="81px" Font-Bold="True" ForeColor="#0000CC" OnClick="ButtonSI_Click" />
            <asp:Button ID="ButtonNO" runat="server" Text="NO" Height="43px"  Width="81px" Font-Bold="True" ForeColor="#0000CC" OnClick="ButtonNO_Click" />
                  </p>
          <p>





              <asp:Label ID="LabeLMensajeLaboral" runat="server"></asp:Label>
                  </p>
          <p>





                  <asp:Label ID="Label3" runat="server" Text="Seleccione Un Investigador Para Asignarle El Caso" Font-Bold="True" ></asp:Label>
                  </p>
        <p>
                  
                  <asp:DropDownList ID="DropDownListInvestigador" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListInvestigador_SelectedIndexChanged">
                  </asp:DropDownList>
                  </p>
        </div>

    <br />


     <div id ="EnviodeInformes" runat="server" class='FormatoDivGrande'>
    
        <h1>EnvioDeInformes</h1>
         <p>
             <asp:Label ID="Label4" runat="server"></asp:Label>
         </p>
         <p>Para <asp:TextBox ID="TextBoxCorreo" runat="server" Width="499px"></asp:TextBox>
         </p>
         <p>
             <asp:TextBox ID="TextBoxContenidoCorreo" runat="server" Height="229px" TextMode="MultiLine" Width="397px"></asp:TextBox>
         </p>
         <p>Se Adjuntara Todo el contenido de la carpeta Publicado y El Link Del Video</p>

         <asp:Panel ID="PanelAdjuntos" runat="server">+

    </asp:Panel>

         <p>
             <asp:Button ID="ButtonEnviarCorreo" runat="server" OnClick="Button2_Click" Text="Enviar" Height="53px" Width="133px" />
         </p>
       
     
        </div>



</asp:Content>

