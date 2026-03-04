<%@ Page Language="C#" AutoEventWireup="true" CodeFile="noooo.aspx.cs" Inherits="ContaCaso_Menu_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>ContaCaso</title>
	<link rel="stylesheet" href="estilos.css">
	<link rel="stylesheet" href="http://i.icomoon.io/public/temp/7d96e2500b/UntitledProject7/style.css">
	<link rel="stylesheet" href="fonts.css">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    </head>
<body>
    <form id="form1" runat="server">
  

        <header>
		<div class="menu_bar">
			<a class="bt-menu" href="#"><img src="file-text.png"/>Menu</a>
		</div>

		<nav>
			<ul>
				
                <li><a href="Conceptos.aspx"><img src="file-text.png"/>Lista De Casos</a></li>
                <li><a href="#"><img src="file-text.png"/>Nuevos Casos </a></li>
                <li><a href="#"><img src="file-text.png"/>Gestion De Casos</a></li>
				<li><a href="#"><img src="file-text.png"/>Gestion De Informes</a></li>
                <li><a href="#"><img src="file-text.png"/>Bitacora De Casos</a></li>
                <li><a href="#"><img src="file-text.png"/>ContaCaso</a></li>
                <li><a href="../VisualizadorDeCasos.aspx"><img src="file-text.png"/>Administracion</a></li>
				
                
			</ul>
		</nav>
	</header>

	<section>
		<h3>Visualizador De Casos</h3>
		
		
        <asp:ScriptManager ID="ScriptManagerLegalizaciones" runat="server">
            </asp:ScriptManager>


        <asp:UpdatePanel ID="UpdatePanel_Legalizaciones" runat="server">
            <ContentTemplate>
			
                             

                   
                  <asp:Panel ID="Panel1" runat="server">
                  </asp:Panel>




                


                
           </ContentTemplate>
        </asp:UpdatePanel>


	</section>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="menu.js"></script>


    </form>
</body>
</html>
