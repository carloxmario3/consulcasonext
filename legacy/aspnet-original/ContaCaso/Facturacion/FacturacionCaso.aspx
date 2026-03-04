<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="FacturacionCaso.aspx.cs" Inherits="ContaCaso_LegalizacionCaso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="FormatoDiv"> 

      <div class="FormatoDivGrande"> 

          <asp:Label ID="Label2" runat="server" Text="FACTURAS"></asp:Label>
          <br />

          <br />

          </div>
                
      <br />
      <br />
         
      <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                       

      <asp:Button ID="Button1" runat="server" Text="NUEVA FACTURA INDIVIDUAL" Height="59px" OnClick="Button1_Click" Width="221px" /> 

              <br />
      <br />
                       

              </div>
              <br />


</asp:Content>

