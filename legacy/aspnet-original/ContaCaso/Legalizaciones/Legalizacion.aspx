<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Legalizacion.aspx.cs" Inherits="ContaCaso_Legalizaciones_Legalizacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Legalizaciones</title>
    
    <link rel="stylesheet" href="StyleRespon.css">
	<link rel="stylesheet" href="http://i.icomoon.io/public/temp/7d96e2500b/UntitledProject7/style.css">
	<link rel="stylesheet" href="fonts.css">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">


</head>
<body>
    <form id="form1" runat="server">
    

        
        <header>
		<div class="menu_bar">
			<a class="bt-menu" href="#"><span class="icon-list2"></span>Menu</a>
		</div>

		<nav>
			<ul>
				<li><a href="#"> <img src="../Recursos/file-text.png"/>Inicio</a></li>
				<li><a href="#"><span class="icon-suitcase"></span>Trabajos</a></li>
				<li><a href="#"><span class="icon-rocket"></span>Proyectos</a></li>
				<li><a href="#"><span class="icon-earth"></span>Servicios</a></li>
				<li><a href="#"><span class="icon-mail"></span>Contacto</a></li>
			</ul>
		</nav>
	</header>

        <section>
       <div class="FormatoDiv">
                 
           
           
           <asp:Panel ID="Panel1" runat="server">
           </asp:Panel>

           
               
             <table style="width:100%;" class="Alineacion">
               <tr>
                                     
                   <td>Felicitaciones su legalizacion a Terminado</td>
               </tr>
               
               <tr>
                   <td>
                       <br />
                       <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                       <br />
                       <br />
                       <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                       <br />
                       <br />
                       <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2" Text="Button" Visible="False" />
                       <br />
                       <br />
                       <br />
                       <br />
                   </td>                   
               </tr>               
               
           </table>          

       </div>

            </section>
         	
	    <script src="../ContaCaso/Recursos/jquery-latest.js"></script>	        
        <script src="../ContaCaso/Recursos/menu.js"></script>

        
    </form>
</body>
</html>
