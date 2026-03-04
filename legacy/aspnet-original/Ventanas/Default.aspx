<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Ventanas_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      
    
    
    <div>
       
    
       <script type="text/javascript">
           
           function GetRadWindow() {
               var oWindow = null;
               if (window.radWindow) oWindow = window.radWindow;
               else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
               return oWindow;
           }

          

           function populateCityName(arg) {
               var cityName = document.getElementById("cityName");
               cityName.value = arg;
           }

           function AdjustRadWidow() {
               setTimeout(function () { GetRadWindow().autoSize(true) }, 500);
           }

           function returnToParent() {
               //create the argument that will be returned to the parent page
               var oArg = new Object();

               //get the city's name 
               oArg.cityName = document.getElementById("TextBox1").value;

                                                          

               //Close the RadWindow and send the argument to the parent page
               if (oArg.selDate && oArg.cityName) {
                   oWnd.close(oArg);
               }
               else {
                   alert("Please fill both fields");
               }
           }
        </script>   
       
       
       
       
       
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <br />
        <br />
        <button id="close" onclick="returnToParent(); return false;" title="Submit">
            este es
        </button>
        <br />
        <br />

    </div>
    </form>
</body>
</html>
