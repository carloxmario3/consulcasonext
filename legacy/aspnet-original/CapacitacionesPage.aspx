<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="CapacitacionesPage.aspx.cs" Inherits="CapacitacionesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>

    <div align="center">
    

     
    

     
        <br />

        <asp:Label ID="Label2" runat="server" 
            Text="Selecione Una Capacitacion De La Siguiente Lista" CssClass="subtitulo"></asp:Label>

        <br />

        <br />
        <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" Height="400px" 
            onselectedindexchanged="ListBox2_SelectedIndexChanged"></asp:ListBox>



      
        <br />



       
    	
	
	
		
	
        <br />
        <asp:Button ID="Button2" runat="server" Text="Subir Nueva Capacitacion" 
            onclick="Button2_Click" />
	
        <br />
        <br />
	
        <br />

    </div>

        <br />
    </asp:Content>

