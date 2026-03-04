<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="UsuariosPage.aspx.cs" Inherits="Administracion_UsuariosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align="center">
   
   <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

   <table border = "1" cellspacing = "5" style="height: 71px">
            <tr>
                <td class="style2">
                    <asp:Label ID="lb_Nusuario" runat="server" CssClass="subtitulo" 
                Text="Nombre De Usuario"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2">
                <asp:Label ID="lb_usuario" runat="server" CssClass="datoimportante">usu</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="Contraseña" CssClass="subtitulo"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lbcontrass" runat="server" Text="contra" 
                        CssClass="datoimportante"></asp:Label>
                    <br />
                    <asp:Label ID="lb_Ncontra" runat="server" CssClass="subtitulo" 
                Text="Escriba la Nueva Contraseña Contraseña" Visible="False"></asp:Label>
                    <br />
                    <asp:TextBox ID="tb_contra" runat="server" CssClass="cajastexto" 
                        BorderStyle="Double" Visible="False"></asp:TextBox>
                <br />
                
                </td>
            </tr>
            <tr>
                <td class="style2">
                                        
                
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Cambiar Contraseña" Visible="False" />
                                        
                
                </td>
            </tr>

            
            <tr>
                <td 2">
                    <asp:Label ID="lb_tipo" runat="server" CssClass="subtitulo" 
                Text="Tipo De Usuario"></asp:Label>
                                        
                
                </td>
            </tr>

            
            <tr>
                <td 2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                        Font-Bold="True">
                    </asp:DropDownList>
                                        
                
                    <br />
                    <asp:Label ID="lb_tipo0" runat="server" CssClass="subtitulo" 
                Text="Escoja Un Nuevo Tipo De Usuario" Visible="False"></asp:Label>
                                        
                
                    <br />
                    <asp:DropDownList ID="dd_tipo" runat="server" Visible="False" Font-Bold="True">
                    </asp:DropDownList>
                                        
                
                </td>
            </tr>

            
            <tr>
                <td 2">
                    <asp:Button ID="bt_boton" runat="server" Text="Cambiar Usuario" 
                        onclick="bt_boton_Click" Visible="False" />
                                        
                
                </td>
            </tr>

            
            <tr>
                <td 2">
                    <asp:Label ID="lb_mensaje" runat="server"></asp:Label>
                                        
                
                    <br />
                    <br />
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                        Text="Cambiar Detalles" />
                    <br />
                                        
                
                    <br />
                    <br />
                                        
                
                    <br />
                                        
                
                </td>
            </tr>

            
            </table>
   
   
       <br />
       <br />

       </div>

</asp:Content>

