<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="VerTodosLosCasos.aspx.cs" Inherits="ConsulCaso9_NewVisualizadorCasos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="XX-Small" ForeColor="#003399"></asp:Label>  
    


    <div id ="DivBusqueda" visible ="false" class='FormatoDivGrande' runat ="server">
    
        <h1>Busqueda De Casos</h1>

        Escriba el numero de caso <br />

        <asp:TextBox ID="TextBox1" runat="server" Height="65px" Width="180px"></asp:TextBox>


        <br />
        <br />


        <asp:Button ID="Button1" runat="server" Text="Traer Caso" Height="59px" OnClick="Button1_Click" Width="139px" />


        </div>






    <div class='FormatoDivGrande'>
    
        <h1>Informacion</h1>
        </div>

    <asp:Panel ID="PanelInformacion" runat="server">
          
                  
    </asp:Panel>

    <div class='FormatoDivGrande'>
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

    </asp:Panel>
    



</asp:Content>

