<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="VideosPageOk.aspx.cs" Inherits="Multimedia_VideosPageOk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
    <br />
    
    <div align="center">
    
   <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True" NavigateUrl="~/Multimedia/VideosPage.aspx">Atras</asp:HyperLink>
    
        <br />
    
      <asp:Label ID="Label2" runat="server" 
            Text="Subir Video " CssClass="titulos" ></asp:Label>

        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Bold="True" 
            ForeColor="Black">
            <asp:ListItem Value="0.mp4">Video 1</asp:ListItem>
            <asp:ListItem Value="1.mp4">Video 2</asp:ListItem>
            <asp:ListItem Value="2.mp4">Video 3</asp:ListItem>
            <asp:ListItem Value="3.mp4">Video 4</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <telerik:RadProgressArea ID="RadProgressArea1" Runat="server" Skin="Outlook">
        <Localization Uploaded="Subido" Cancel="Cancelar" CurrentFileName="Subiendo Archivo: " 
                ElapsedTime="Tiempo Transcurrido: " EstimatedTime="Tiempo Estimado: " 
                TransferSpeed="Velocidad: " UploadedFiles="Archivos Subidos: "></Localization>
        </telerik:RadProgressArea>

        <br />
    
    <br />


        <telerik:RadUpload ID="RadUpload1" Runat="server"    
       
   
   
    InputSize="40" 
    OverwriteExistingFiles="True" 
    ControlObjectsVisibility="All" 
    FocusOnLoad="True"
    Width="500px" MaxFileInputsCount="1" MaxFileSize="1073741824" 
            AllowedFileExtensions=".mp4">
        
         <Localization Add="Agregar" Clear="Limpiar" Delete="Borrar" Remove="Remover" 
                Select="Seleccion" />
        
        </telerik:RadUpload>
    
    <br />

        <asp:Button ID="btnUpload3" runat="server" Text="Subir" Width="60px" 
            onclick="btnUpload3_Click" />
        <br />
        <br />

        <br />

        </div>



</asp:Content>

