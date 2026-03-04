<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="ImageVisorDeCasos.aspx.cs" Inherits="ImageVisorDeCasos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                    <asp:ImageButton  OnClick="SubmitBtn_Click" ID="ImageButton1" runat="server" Height="102px" 
            ImageUrl="~/imagenes/p01_lupa.jpg" />   


    <asp:Label   ID="Label1" runat="server" Text="Label"></asp:Label>

    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
         

    <script language="C#" runat=server>
        string mivar;
      void SubmitBtn_Click(Object sender, EventArgs e) 
      {
          Label1.Text = "ddddd";
          mivar ="ESTE ESSSSSS"; 

      }

   </script>

   <br />
   <br />

   <div class='titulos'>  probandoestilo  </div>
   <br />
   <br />
   <br />
               <%Response.Write(mivaiable34);%>     
    
</asp:Content>

