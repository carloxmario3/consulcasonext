<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="FacturacionUltimate.aspx.cs" Inherits="ContaCaso_GastosInvestigacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div id ="Div2" runat ="server" class="FormatoDiv"> 
        




                  <asp:Label ID="Label5" runat="server" Text="Seleccione Una Compania" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Compania" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Compania_SelectedIndexChanged" >
                  </asp:DropDownList>
              
              



        <br />
        <br />





                  <asp:Label ID="Label6" runat="server" Text="Seleccione Los Casos Por Facturar" ></asp:Label>
                  <br />
                  <asp:DropDownList ID="DropDownList_Casos" runat="server" AutoPostBack="True"    >
                  </asp:DropDownList>
              
              



                  &nbsp;<asp:Button ID="ButtonFacturarCaso" runat="server" Text="Facturar Caso" OnClick="ButtonFacturarCaso_Click" />
              
                              

        
                  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                  <br />
                  <br />
                  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
              
                              

        
    </div>


      <br />
        <br />
                  <br />
    

       <div id ="DivCaso" runat ="server" class="FormatoDiv"> 
        

           <asp:Panel ID="Panel1" runat="server"></asp:Panel>


        </div>
    






</asp:Content>

