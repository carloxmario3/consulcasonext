<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- Start of Zopim Live Chat Script   <script runat="server">
       string mivar;
       string correousuario()
       {



           mivar = Convert.ToString(Membership.GetUser());

           return mivar;
            
       }

      
      
      
      
   </script><script type="text/javascript">    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) { z._.push(c) }, $ = z.s = d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) { z.set._.push(o) }; $.setAttribute('charset', 'utf-8'); $.async = !0; z.set._ = []; $.src = ('https:' == d.location.protocol ? 'https://ssl' : 'http://cdn') + '.zopim.com/?9mDICZUfknExghxjoOwO891X6ZN8a1PW'; $.type = 'text/java' + s; z.t = +new Date; z._ = []; e.parentNode.insertBefore($, e)
    })(document, 'script')
    $zopim(function () {
        $zopim.livechat.set({
            language: 'es',
            name: 'Visitor',
            email: '<%Response.Write(correousuario());%>'
        });
    });</script> End of Zopim Live Chat Script -->



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
  
    <div align="center">

        <asp:Label ID="Label2" runat="server" 
            Text="Bienvenido a ConsulCaso8" CssClass="titulos" Font-Italic="True" ></asp:Label>

            <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/logo.png" 
            Height="81px" Width="234px" />

                <br />

                <br />
        
        <table style="width:100%;" align="center">
            <tr>
                <td align="right">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="102px" 
            ImageUrl="~/imagenes/p01_lupa.jpg" PostBackUrl="~/ListaDeCasosPage.aspx" 
            Width="160px" />   
                    &nbsp;   
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="Small" 
            Font-Underline="True" NavigateUrl="~/ListaDeCasosPage.aspx">Ver Mis Casos Activos</asp:HyperLink>  &nbsp;  </td>
                <td align="left">
                    &nbsp;
               <asp:ImageButton ID="ImageButton2" runat="server" Height="102px" 
            ImageUrl="~/imagenes/capacitacion1.jpg" PostBackUrl="~/CapacitacionesPage.aspx" 
            Width="160px" />   
                    <br />
                    &nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="Small" 
            Font-Underline="True" NavigateUrl="~/CapacitacionesPage.aspx">Ver Videos De Capacitacion</asp:HyperLink>  </td>
            </tr>
            <tr>
                <td colspan="2" class="subtitulo">
                    <br />
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        <br />
        
        <br />
        <br />

            </div>

</asp:Content>

