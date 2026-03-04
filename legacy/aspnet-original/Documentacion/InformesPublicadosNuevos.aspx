<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="InformesPublicadosNuevos.aspx.cs" Inherits="Documentacion_InformesPublicadosNuevos" %>

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
            Font-Underline="True" 
            NavigateUrl="~/Documentacion/InformesPublicadosPage.aspx">Atras</asp:HyperLink>

        <br />
    
      <asp:Label ID="Label2" runat="server" 
            Text="Nuevo Informe Publicado" CssClass="titulos" ></asp:Label>

        <br />
        <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
        <br />

    
      <br />
    
        <asp:Label ID="Label5" runat="server" Text="Descripción del Informe" 
            CssClass="subtitulo"></asp:Label>
        <br />
        <asp:TextBox ID="tb_nombre" runat="server" Width="285px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="tb_nombre" ErrorMessage="Debe Escribir la descripcion" 
            ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <telerik:RadProgressArea ID="RadProgressArea1" Runat="server" Skin="Outlook">

        <Localization Uploaded="Subido" Cancel="Cancelar" CurrentFileName="Subiendo Archivo: " 
                ElapsedTime="Tiempo Transcurrido: " EstimatedTime="Tiempo Estimado: " 
                TransferSpeed="Velocidad: " UploadedFiles="Archivos Subidos: "></Localization>

        </telerik:RadProgressArea>

    <br />


        <telerik:RadUpload ID="RadUpload1" Runat="server"    
       
   
   
    InputSize="40" 
    OverwriteExistingFiles="True" 
    ControlObjectsVisibility="All" 
    FocusOnLoad="True"
    Width="500px" MaxFileInputsCount="1">

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

