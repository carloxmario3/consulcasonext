<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="RecivoCajaMenor.aspx.cs" Inherits="ContaCaso_RecivoCajaMenor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
    
       <div id ="DivNombreNumevo" runat ="server" class="FormatoDiv"  >               
              
          Caja Menor<br />
           <br />
&nbsp;<asp:Label ID="Label2" runat="server" Text="Seleccione un Investigador" ></asp:Label>
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
              </div>

    <br />

    <div id ="Div2" runat ="server" class="FormatoDiv"  >               
              
                  <asp:Button ID="Button1" runat="server" Height="35px" Text="Ingresar Valor" Width="99px" OnClick="Button1_Click" />
                  <br />                           
              </div>
 



</asp:Content>

