using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsulCaso9_AbrirArchivos : System.Web.UI.Page
{



    string RutaFile;
    protected void Page_Load(object sender, EventArgs e)
    {

        RutaFile = (string)Page.RouteData.Values["NombreFilexx"];

        

        string MensajeTipo = RutaFile.Substring(0, 5);
        
        if (MensajeTipo.Equals("Asign"))
        {

            Page.Response.Redirect("~\\Gestion\\AsignarCasosPage.aspx");
         
        }


        if (MensajeTipo.Equals("Remov"))
        {


          
        }

        
        if (MensajeTipo.Equals("Abrir"))
        {

            string serverIP = GetUser_IP();

            //string serverIP = "192.168.0.134";
            
            string message = RutaFile;
            Connect(serverIP, message);
            

            Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + RutaFile.Substring(11, 4));
                        


        }


        if (MensajeTipo.Equals("Makel"))
        {


            Page.Response.Redirect("~\\ConsulCaso9\\NewVisualizadorCasos.aspx" + RutaFile.Substring(5, 4));


        }



        

    }



    public string GetUser_IP()
    {
        string VisitorsIPAddr = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            VisitorsIPAddr = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress;
        }
        
        return VisitorsIPAddr;        
    }




    static void Connect(string serverIP, string message)
    {
        string output = "";

        try
        {
            // Create a TcpClient.
            // The client requires a TcpServer that is connected
            // to the same address specified by the server and port
            // combination.
            Int32 port = 13;
            TcpClient client = new TcpClient(serverIP, port);

            // Translate the passed message into ASCII and store it as a byte array.
            Byte[] data = new Byte[256];
            data = System.Text.Encoding.ASCII.GetBytes(message);

            // Get a client stream for reading and writing.
            // Stream stream = client.GetStream();
            NetworkStream stream = client.GetStream();

            // Send the message to the connected TcpServer. 
            stream.Write(data, 0, data.Length);

            output = "Sent: " + message;



            //MessageBox.Show(output);

            // Buffer to store the response bytes.
            data = new Byte[256];

            // String to store the response ASCII representation.
            String responseData = String.Empty;

            // Read the first batch of the TcpServer response bytes.
            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            output = "Received: " + responseData;
            //MessageBox.Show(output);

            // Close everything.
            stream.Close();
            client.Close();
        }
        catch (ArgumentNullException e)
        {
            output = "ArgumentNullException: " + e;
            ///MessageBox.Show(output);
        }
        catch (SocketException e)
        {
            output = "SocketException: " + e.ToString();
            ///MessageBox.Show(output);
        }
    }






}