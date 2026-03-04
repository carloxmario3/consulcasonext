<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
   
<meta name="application-name" content="Consultando 8"/> 
<meta name="msapplication-tooltip" content="Consultando 8"/> 


<META name="msapplication-task" content="name=Revisar Informes;action-uri=http://consulcaso.consultandoltda.com/ListaDeInformes/Revisar;icon-uri=http://consultandoweb.com/favicon_azul.ico"/>
<META name="msapplication-task" content="name=Lista De Casos Activos;action-uri=http://consulcaso.consultandoltda.com/ListaDeCasosPage.aspx;icon-uri=http://consultandoweb.com/favicon_morado.ico"/>
<META name="msapplication-task" content="name=Bitacora De Casos;action-uri=http://consulcaso.consultandoltda.com/Resumenes/Revisar;icon-uri=http://consultandoweb.com/favicon_rojo.ico"/>
<META name="msapplication-task" content="name=Nuevo Caso;action-uri=http://consulcaso.consultandoltda.com/nuevocaso/1;icon-uri=http://consultandoweb.com/Favicon_verde.ico"/>
    
    
    <meta name="msapplication-navbutton-color" content="#FFCC00"/>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">





    <LINK rel="shortcut icon" type=image/x-icon href="http://consultandoweb.com/FaviconWeb.ico">
    <LINK rel=icon type=image/ico href="http://consultandoweb.com/FaviconWeb.ico">


     <link href="~/Estilos/consulstyle.css" rel="stylesheet" type="text/css" />

      <!-- Start of Zopim Live Chat Script <script type="text/javascript">    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) { z._.push(c) }, $ =z.s = d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) { z.set._.push(o) }; $.setAttribute('charset', 'utf-8'); $.async = !0; z.set._ = []; $.src = ('https:' == d.location.protocol ? 'https://ssl' : 'http://cdn') +'.zopim.com/?9mDICZUfknExghxjoOwO891X6ZN8a1PW'; $.type = 'text/java' + s; z.t = +new Date; z._ = []; e.parentNode.insertBefore($, e)
    })(document, 'script')</script>    End of Zopim Live Chat Script -->


    <style type="text/css">
        .auto-style1 {
            width: 197px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
     <div align="center" >
    
         <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Label"></asp:Label>
         <br />
    
    <asp:Image ID="Image1" runat="server" 
             ImageUrl="~/ImagenNoProtegido/0.jpg" Width="269px" />

       

        <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="10pt" onauthenticate="Login1_Authenticate" 
             LoginButtonText="Inicio de sesión" 
             FailureText="El intento de conexión no fue correcto. Inténtelo de nuevo." 
             PasswordLabelText="Contraseña:" 
             PasswordRequiredErrorMessage="La contraseña es obligatoria." 
             RememberMeText="Recordármelo la próxima vez." TitleText="Iniciar sesión" 
             UserNameLabelText="Nombre de usuario:" 
             UserNameRequiredErrorMessage="El nombre de usuario es obligatorio." 
             Width="261px">
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0" style="width: 263px;">
                                <tr>
                                    <td align="center" 
                                        style="color: White; background-color: #6B696B; font-weight: bold;">
                                        Iniciar sesión</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        &nbsp;<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">    

                                          <asp:TextBox ID="UserName" runat="server" Width="246px" Height="47px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" 
                                            ErrorMessage="El nombre de usuario es obligatorio." 
                                            ToolTip="El nombre de usuario es obligatorio." ValidationGroup="Login1">*</asp:RequiredFieldValidator>


                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." 
                                            ToolTip="La contraseña es obligatoria." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="Password" runat="server" Height="55px" TextMode="Password" Width="251px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Recordármelo la próxima vez." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Height="60px" Text="Inicio de sesión" ValidationGroup="Login1" Width="184px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" 
                ForeColor="#FFFFFF" />
        </asp:Login>
    
    </div>
        <br />

        <div align="center" >

            
            <a  href="http://mail.consultandoweb.com">
            <img border="0" alt="W3Schools" src="/ImagenNoProtegido/correo.jpg" width="100" height="100">
            </a>
            <br />
            <a  href="http://mail.consultandoweb.com">
            Correo Corporativo
            </a>


            
            </div>

    </form>
</body>
</html>
