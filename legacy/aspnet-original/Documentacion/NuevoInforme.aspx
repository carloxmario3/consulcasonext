<%@ Page Title="" Language="C#" MasterPageFile="~/ConsulCaso9/MasterPage.master" AutoEventWireup="true" CodeFile="NuevoInforme.aspx.cs" Inherits="Documentacion_NuevoInforme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadProgressManager ID="RadProgressManager1" Runat="server" />
    
    
    <div align="center">
    
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Overline="False" Font-Size="X-Large" 
            Font-Underline="True">Atras</asp:HyperLink>

        <br />
    
      <asp:Label ID="Label2" runat="server" 
            Text="Subir Informe" CssClass="titulos" ></asp:Label>

        <br />
    
        <asp:Label ID="lb_info_operacion" runat="server"></asp:Label>
        
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Nombre" 
            DataValueField="Id_tipoinforme" Font-Bold="True" ForeColor="Black">
        </asp:RadioButtonList>
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
    Width="500px"
    MaxFileInputsCount="1">
            <Localization Add="Agregar" Clear="Limpiar" Delete="Borrar" Remove="Remover" 
                Select="Seleccion" />
        
        
        </telerik:RadUpload>
    
    
    
    <br />

        <asp:Button ID="btnUpload3" runat="server" Text="Subir" Width="60px" 
            onclick="btnUpload3_Click" />
        <br />
        <br />

        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:consulbase71ConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Tabla_Tipodeinforme] WHERE [Id_tipoinforme] = @Id_tipoinforme" 
            InsertCommand="INSERT INTO [Tabla_Tipodeinforme] ([Nombre]) VALUES (@Nombre)" 
            ProviderName="<%$ ConnectionStrings:consulbase71ConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [Id_tipoinforme], [Nombre] FROM [Tabla_Tipodeinforme]" 
            UpdateCommand="UPDATE [Tabla_Tipodeinforme] SET [Nombre] = @Nombre WHERE [Id_tipoinforme] = @Id_tipoinforme">
            <DeleteParameters>
                <asp:Parameter Name="Id_tipoinforme" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nombre" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Id_tipoinforme" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />

    <br />

    <br />

    </div>


</asp:Content>

