using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ConsulCaso9_NewFolder1_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
           
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        string serverIP = "192.168.0.134";
        string message = TextBox1.Text;
        Connect(serverIP, message);


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





    protected void Button2_Click(object sender, EventArgs e)
    {


        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Condata/5659/Informes"));
        List<ListItem> files = new List<ListItem>();
        foreach (string filePath in filePaths)
        {
            files.Add(new ListItem(Path.GetFileName(filePath), filePath));
        }
        GridView1.DataSource = files;
        GridView1.DataBind();


    }
    protected void Button3_Click(object sender, EventArgs e)
    {


    

    }




}

