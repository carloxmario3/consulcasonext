<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ListaDeCasosNew.aspx.cs" Inherits="ConsulCaso9_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
       
       
        .auto-style29 {
            width: 134%;
        }
        
        
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




   <table border="1" class="auto-style29">
        <tr>

             <td><b>Todos Los Casos</b></td>
            <td ><b>Casos Sin Asignar</b></td>
            <td ><b>Casos Por Revisar</b> </td>
            <td ><b>Casos Por Enviar</b> </td>
            <td ><b>Casos Completos</b></td>
            <td ><b>Casos Facturados</b></td>
            <td ><b>Casos Pagados</b></td>
            <td ><b>Casos Suspendidos</b></td>
            <td ><b>Casos Ricardo</b></td>
             <td ><b>Casos David</b></td>
            
            <td ><b>Casos Fabiola</b></td>
            <td ><b>Casos Fanny</b></td>
           
             <td><b>Casos Irma</b></td>
           
            
        </tr>
        <tr>
            <td valign="top" class="auto-style2" >
                <asp:Button ID="Button1" runat="server" Text="Cargar Todos Los Casos" OnClick="Button1_Click" Width="153px" /><asp:Panel ID="PanelTodosLosCasos" runat="server"> </asp:Panel>
                <br />
            </td>
            <td valign="top" class="auto-style24" ><asp:Panel ID="PanelSinAsignar" runat="server"> </asp:Panel></td>
            <td valign="top" class="auto-style28" ><asp:Panel ID="PanelPorRevisar" runat="server"> </asp:Panel></td>
            <td valign="top" class="auto-style28" ><asp:Panel ID="PanelPorEnviar" runat="server"> </asp:Panel></td>
            <td valign="top" class="auto-style25" ><asp:Panel ID="PanelCompletos" runat="server"> </asp:Panel></td>
             <td valign="top" class="auto-style26" ><asp:Panel ID="PanelFacturados" runat="server"> </asp:Panel></td>
            <td valign="top" class="auto-style26" ><asp:Panel ID="PanelPagados" runat="server"> </asp:Panel></td>
             <td valign="top" class="auto-style27" ><asp:Panel ID="PanelSusendidos" runat="server"> </asp:Panel></td>
             <td valign="top" class="auto-style30" ><asp:Panel ID="PanelRicardo" runat="server"> </asp:Panel></td>
             <td valign="top" class="auto-style31" ><asp:Panel ID="PanelDavid" runat="server"> </asp:Panel></td>
            
             <td valign="top" class="auto-style33" ><asp:Panel ID="PanelFabiola" runat="server"> </asp:Panel></td>
             <td valign="top" class="auto-style22" ><asp:Panel ID="PanelFanny" runat="server"> </asp:Panel></td>
             
             <td valign="top" class="auto-style2" ><asp:Panel ID="Panelirma" runat="server"> </asp:Panel></td>
            
            
        </tr>
       
    </table>
    





</asp:Content>

