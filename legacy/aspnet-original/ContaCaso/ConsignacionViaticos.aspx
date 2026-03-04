<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ConsignacionViaticos.aspx.cs" Inherits="ContaCaso_IngresoACuentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />


      <div id ="Div4" runat ="server" class="FormatoDiv"  >               
              
                  <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="IngresoManual" />
                  <br />
              
                  <asp:Label ID="LabelFecha" runat="server" Text="Label"></asp:Label>
                  <br />
                  <br />
              
                  <asp:Label ID="Label4" runat="server" Text="Seleccione un Investigador Consignar" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownListInvesConsigna" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListInvesConsigna_SelectedIndexChanged" >
                  </asp:DropDownList>
                  &nbsp;&nbsp;
                  <br />
              
                  <asp:Label ID="Label5" runat="server" Text="Valor" ></asp:Label>
                  <br />
                  <asp:TextBox ID="TextBoxValorConsigacion" runat="server">0</asp:TextBox>
                  <br />
                  <br />
                  <asp:Button ID="ButtonAgregar" runat="server" Text="Agregar" Height="47px" Width="93px" OnClick="ButtonAgregar_Click" />
                  <asp:Button ID="ButtonLimpiar" runat="server" Text="Limpiar" Height="47px" Width="92px" OnClick="ButtonLimpiar_Click"  />
                  <asp:Button ID="ButtonDescargar" runat="server" Text="DESCARGAR ARCHIVO DE NOMINA" OnClick="ButtonDescargar_Click" Height="46px" Width="237px" />
                  <br />
                  <br />
              
                  <asp:Label ID="LabelValores" runat="server" ></asp:Label>
                  <br />
                  <br />
              
                  Subir Soporte<br />
                  <asp:FileUpload ID="FileUpload1" runat="server" />
                  <br />
                  <br />
              
                  <asp:Button ID="Button1" runat="server" Height="45px" Text="Ingresar Consignaciones Al Sistema" Width="239px" OnClick="Button1_Click" />
                  <br />
                  <br />
                  <asp:Label ID="LabelEstado" runat="server" Font-Size="XX-Large"></asp:Label>
                  <br />
                  <br />
                  <asp:Button ID="Button2" runat="server" Height="43px" OnClick="Button2_Click" Text="Terminar" Width="108px" />
                  <br />                           
              </div>

   
           
    <br />

 

</asp:Content>

