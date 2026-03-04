<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="jamming.aspx.cs" Inherits="jamming" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
      
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
    <br />
    
    <div align="center">
    
    
     <asp:Image ID="Image1" runat="server" BorderStyle="Double" />

    
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

    
      <br />
    
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
    
    <br />


        <telerik:RadUpload ID="RadUpload1" Runat="server"    
       
   
   
    InputSize="40" 
    OverwriteExistingFiles="True" 
    ControlObjectsVisibility="All" 
    FocusOnLoad="True"
    Width="500px">
        
        
        </telerik:RadUpload>
    
    <br />
    
    <br />

        <asp:Button ID="btnUpload3" runat="server" Text="Upload" Width="60px" 
            onclick="btnUpload3_Click" />
        <br />
        <br />
        <telerik:RadProgressArea ID="RadProgressArea1" Runat="server">
        </telerik:RadProgressArea>

    <br />

    <br />

    </div>
    <br />
    <br />
    </asp:Content>

