<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="SubirCapacitacion.aspx.cs" Inherits="SubirCapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



   

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
    
    
    <div align="center">
    
   <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True" NavigateUrl="~/CapacitacionesPage.aspx">Atras</asp:HyperLink>
    
        <br />
    
        <br />
    
      <asp:Label ID="Label2" runat="server" 
            Text="Subir Capacitacion" CssClass="titulos" ></asp:Label>

        <br />

        <br />
    
       
        <telerik:RadProgressArea ID="RadProgressArea1" Runat="server" Skin="Outlook">
        <Localization Uploaded="Subido" Cancel="Cancelar" CurrentFileName="Subiendo Archivo: " 
                ElapsedTime="Tiempo Transcurrido: " EstimatedTime="Tiempo Estimado: " 
                TransferSpeed="Velocidad: " UploadedFiles="Archivos Subidos: "></Localization>
        </telerik:RadProgressArea>

   

        <telerik:RadUpload ID="RadUpload1" Runat="server"    
       
   
   
    InputSize="40" 
    OverwriteExistingFiles="True" 
    ControlObjectsVisibility="All" 
    FocusOnLoad="True"
    Width="500px" MaxFileInputsCount="1" AllowedFileExtensions=".mp4">
        
         <Localization Add="Agregar" Clear="Limpiar" Delete="Borrar" Remove="Remover" 
                Select="Seleccion" />
        
        </telerik:RadUpload>
    
    <br />

        <asp:Button ID="btnUpload3" runat="server" Text="Subir" Width="60px" 
            onclick="btnUpload3_Click" />
       
        <br />

        </div>


</asp:Content>

