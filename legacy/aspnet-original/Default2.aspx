<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
             
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<%--Needed for JavaScript IntelliSense in VS2010--%>
			<%--For VS2008 replace RadScriptManager with ScriptManager--%>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>
	<script type="text/javascript">
	    //Put your Java Script code here.
    </script>
	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
	</telerik:RadAjaxManager>
	


    

      
      
   </script>


    
    <script type="text/javascript">
        //<![CDATA[
        function openWin() {
            var oWnd = radopen("Ventanas/Default.aspx", "RadWindow1");
        }

        function OnClientClose(oWnd, args) {
            //get the transferred arguments
            var arg = args.get_argument();
            if (arg) {
                var cityName = arg.cityName;
                var seldate = arg.selDate;
                alert = 'si senor';
                $get("order").innerHTML = "You chose to fly to <strong>" + cityName + "</strong> on <strong>" + seldate + "</strong>";
            }
        }
        //]]>
    </script>






    
   <telerik:RadWindowManager ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
        ReloadOnShow="true" runat="server" Skin="Sunset">
        <Windows>
            
            <telerik:RadWindow ID="RadWindow2" Width="650" Height="445" Modal="true" NavigateUrl="Dialog2.aspx">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <div id="offsetElement" class="bigModule" style="height: 400px; padding: 8px;">
        <p>
            Click the button to open the Travel Planner form in a RadWindow.
        </p>
        <p>
            &nbsp;</p>
        
        
        
        <button onclick="openWin(); return false;">
            Abrir La Ventana</button>
        <div id="order" class="orderText">
            <!---->
        
        </div>
        <br />
        <br />
    </div>


</asp:Content>

