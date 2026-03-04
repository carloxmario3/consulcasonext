<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="IngresoACuentas.aspx.cs" Inherits="ContaCaso_IngresoACuentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />

       <div id ="DivNombreNumevo" runat ="server" class="FormatoDiv"  >               
              
                  <asp:Label ID="Label2" runat="server" Text="Seleccione un Investigador" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownListInvestigador" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListInvestigador_SelectedIndexChanged">
                  </asp:DropDownList>
                  <br />                           
              </div>

    <br />


    <div id ="Div3" runat ="server" class="FormatoDiv"  >               
              
                  <asp:Label ID="Label3" runat="server" Text="Saldo Investigador" ></asp:Label>
                  <br />
                  
                  <asp:Label ID="LabelSaldo" runat="server" Text="0000" ></asp:Label>
                  
                  <br />                           
              </div>
    
    <br />

      <div id ="Div1" runat ="server" class="FormatoDiv"  >               
              
                  <asp:Label ID="Label1" runat="server" Text="Ingrese El Valor a Ingresar" ></asp:Label>
                  <br />
                  <asp:TextBox ID="TextBoxValor" runat="server"></asp:TextBox>
                  <br />
                  <br />
                  Fecha (año-mes-dia)<br />
                  <asp:TextBox ID="TextBox_Fecha" runat="server"></asp:TextBox>
                  <br />
                  <br />
                  Hora (hora:minuto)<br />
                  <asp:TextBox ID="TextBoxHora" runat="server"></asp:TextBox>
                  <br />
                  <br />
                  Subir Soporte<br />
                  <asp:FileUpload ID="FileUpload1" runat="server" />
                  <br />                           
              </div>

    <br />

    <div id ="Div2" runat ="server" class="FormatoDiv"  >               
              
                  <asp:Button ID="Button1" runat="server" Height="45px" Text="Ingresar Valor" Width="124px" OnClick="Button1_Click" />
                  <br />
                  <asp:Label ID="LabelEstado" runat="server"></asp:Label>
                  <br />
                  <asp:Button ID="Button2" runat="server" Height="43px" OnClick="Button2_Click" Text="Terminar" Visible="False" Width="108px" />
                  <br />                           
              </div>


</asp:Content>

