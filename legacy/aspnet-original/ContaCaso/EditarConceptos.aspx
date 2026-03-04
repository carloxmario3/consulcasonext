<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="EditarConceptos.aspx.cs" Inherits="ContaCaso_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/wm-back.png" OnClick="ImageButton1_Click" />
    
       <div id ="Div4" runat ="server" class="FormatoDiv" > 





           <asp:Button ID="Button2" runat="server" Height="47px" Text="Nuevo Concepto" Width="135px" OnClick="Button2_Click" />
           <asp:Button ID="Button3" runat="server" Height="48px" Text="Editar Valor General" Width="182px" OnClick="Button3_Click" />





           <asp:Button ID="Button4" runat="server" Height="48px" Text="Editar Valor Ciudad" Width="182px" OnClick="Button4_Click" />





       </div>

     <br />


    
         <div id ="DivNombreNumevo" runat ="server" class="FormatoDiv" visible="false" > 
              
              
                  <asp:Label ID="Label2" runat="server" Text="Escriba El Nombre Del Concepto" ></asp:Label>
                  <br />
              
              
                  <asp:TextBox ID="TextBoxNombreConcepto" runat="server" Height="20px" ></asp:TextBox>
              
              
              </div>


    <br />


              <div id ="DivSeleccioneConcepto" runat ="server" class="FormatoDiv" visible="false"> 
              
              
                  <asp:Label ID="Label3" runat="server" Text="Seleccione Un Concepto" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Concepto" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Concepto_SelectedIndexChanged" >
                  </asp:DropDownList>
              
              
              </div>

    <br />
    

         <div id ="DivDiligencieElValor" runat ="server" class="FormatoDiv" visible="false"> 
              
              
                  <asp:Label ID="Label1" runat="server" Text="Diligencie El Valor General" ></asp:Label>
                  <br />
              
              
                  <asp:TextBox ID="TextBoxValor" runat="server" ></asp:TextBox>
              
              
                  <br />
              
              
              </div>


    
              <br />


              <div id ="Div_ciudadSelecioneCiudad" runat ="server" class="FormatoDiv" visible="false"> 
              
              
                  <asp:Label ID="Label4" runat="server" Text="Seleccione Una Ciudad" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Ciudad" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropDownList_Ciudad_SelectedIndexChanged" Width="225px">
                  </asp:DropDownList>
              
              
              </div>

              <br />


              <div id ="Diligencie_Valor" runat ="server" class="FormatoDiv" visible="false"> 
              
              
                  <asp:Label ID="Label5" runat="server" Text="Diligencie El Valor Para La Ciudad" ></asp:Label>
                  <br />
                  <asp:TextBox ID="TextBox_ValorConcepto" runat="server" ></asp:TextBox>
              
              
              </div>

              <br />



               <div id ="DivValorEditable" runat ="server" class="FormatoDiv" visible="false"> 
              
              
                   <asp:CheckBox ID="CheckBoxEditable" runat="server" Text="Valor Fijo" />
              
              
              </div>

              <br />


    
               <div id ="Div3" runat ="server" class="FormatoDiv" > 
              
              
                   <asp:Button ID="ButtonCrearConcepto" runat="server" Text="Crear Concepto" Height="49px" Width="121px" OnClick="ButtonCrearConcepto_Click" Visible="False" />
                   <asp:Button ID="ButtonGuardarValor" runat="server" Text="Guardar Valor General" Height="49px" Width="152px" Visible="False" OnClick="ButtonGuardarValor_Click" />
                   <asp:Button ID="ButtonGuardarValorCiudad" runat="server" Text="Guardar Valor Ciudad" Height="49px" Width="152px" Visible="False" OnClick="ButtonGuardarValorCiudad_Click" />

              
              
              </div>




</asp:Content>

