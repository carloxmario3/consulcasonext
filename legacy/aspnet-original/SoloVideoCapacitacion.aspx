<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SoloVideoCapacitacion.aspx.cs" Inherits="SoloVideoCapacitacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" src="flowplayer-3.1.4.min.js"></script>

    <link href="~/Estilos/consulstyle.css" rel="stylesheet" type="text/css" />

    <style type="text/css">


a:link, a:visited
{
    color: #034af3;
}

    </style>


</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    



     <script runat="server">
       string mivar;
       protected void Page_Load(object sender, EventArgs e)
       {



           Label1.Text = Convert.ToString(Session["capacitavideo"]);
           

           mivar = System.Web.Configuration.WebConfigurationManager.AppSettings["RutaPagina"] + "/Condata/Capacitacion/" + Convert.ToString(Session["usuariocapacita"]) + "/" + Convert.ToString(Session["capacitavideo"]);
           
       }

       
            
      
   </script>




   <br />
   
   
   <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True" NavigateUrl="~/CapacitacionesPage.aspx">Ver Listas De Capacitaciones</asp:HyperLink>
    
        <br />
   
   
   <br />
        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="titulos"></asp:Label>
        <br />
   <br />


      <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -->
	<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="520" height="330"> 
		<param name="movie" value="player.swf" /> 
		<param name="allowfullscreen" value="true" /> 
		<param name="allowscriptaccess" value="always" /> 
		<param name="flashvars" value="file=<%Response.Write(mivar);%>&skin=whotube.zip&frontcolor=ffffff&lightcolor=cc9900&screencolor=000000&stretching=fill&autostart=true&provider=http" /> 
		<embed 
			type="application/x-shockwave-flash"
			id="player2"
			name="player2"
			src="player.swf" 
			width="520" 
			height="330"
			allowscriptaccess="always" 
			allowfullscreen="true"
			flashvars="file=<%Response.Write(mivar);%>" 
		/> 
	</object> 
	<!-- END OF THE PLAYER EMBEDDING -->
    
        <br />




    </div>
    </form>
</body>
</html>
