<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="LegalizacionCaso.aspx.cs" Inherits="ContaCaso_LegalizacionCaso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />

  <div class="FormatoDiv"> 

      
      <div class="FormatoDivGrande"> 

          <asp:Button ID="Button3" runat="server" Height="53px" OnClick="Button2_Click" Text="Imprimir Legalizaciones y Ver Consolidado de Cuenta" Width="356px" Font-Bold="True" />

          <br />
          <br />

          <asp:Label ID="Label2" runat="server" Text="VALOR POR LEGALIZAR"></asp:Label>
          <br />

      <asp:Label ID="LabelPendienteLegalizar" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>

          <br />
          <asp:Button ID="Button2" runat="server" Height="43px" OnClick="Button2_Click" Text="Ver Gastos Investigacion" Width="161px" Visible="False" />

          </div>
                
      <br />
      <br />
         
      <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                       

      <asp:Button ID="Button1" runat="server" Text="NUEVA LEGALIZACION" Height="59px" OnClick="Button1_Click" Width="221px" /> 

              </div>
              <br />


</asp:Content>

