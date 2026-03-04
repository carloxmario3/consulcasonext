<%@ Page Title="" Language="C#" MasterPageFile="~/START/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

               <br />
     <br />

    <H1>CONSULCASO </H1>
    <br />

               
                    
                      <a href='/START/ListaDeCasos.aspx'><asp:Image ID="Image6" runat="server" ImageUrl="~/START/img/LISTADO.png" 
                                CssClass="imagenes" ToolTip="Lista De Casos" Visible="False" /></a>
                    
                   
                        
                       
                        <a href='/nuevocaso/1'><asp:Image ID="Image9" runat="server" ImageUrl="~/START/img/Nuevos Casos.png" 
                                CssClass="imagenes" ToolTip="Nuevos Casos" Visible="False" /></a>

               
                        <a href='/Administracion/ClientesPage.aspx'><asp:Image ID="Image14" runat="server" ImageUrl="~/START/img/Administrar Clientes.png" 
                                CssClass="imagenes" ToolTip="Administrar Clientes" Visible="False" /></a>

                        <a href='/Administracion/InvestigadoresPage.aspx'><asp:Image ID="Image15" runat="server" ImageUrl="~/START/img/Administrar Investigadores.png" 
                                CssClass="imagenes" ToolTip="Administrar Investigadores" Visible="False" /></a>

                        <a href='/Administracion/DepartamentosPage.aspx'><asp:Image ID="Image16" runat="server" ImageUrl="~/START/img/Administrar Ciudades.png" 
                                CssClass="imagenes" ToolTip="Administrar Ciudades" Visible="False" /></a>
                                           

                        <a href='/ConsulCaso9/LogOut.aspx'><asp:Image ID="Image22" runat="server" ImageUrl="~/START/img/Cerrar Sesion.png" 
                                CssClass="imagenes" ToolTip="Cerrar Sesion" /></a>



                            
				



      <br />
               <br />
    <H1>CONTACASO </H1>

               <br />

               

                   
                     <a href='/Contacaso/BitacoraDeInvestigadore.aspx'><asp:Image ID="Image88" runat="server" ImageUrl="~/START/img/bitacorainvestigador.jpg" 
                                CssClass="imagenes" ToolTip="PanelDeCuentasLegalizacion" Visible="False" /></a>


                      <a href='/ContaCaso/EditarConceptos.aspx'><asp:Image ID="Image17" runat="server" ImageUrl="~/START/img/Administrar Conceptos.png" 
                                CssClass="imagenes" ToolTip="Administrar Conceptos" Visible="False" /></a><a href='/ContaCaso/ConsignacionViaticos.aspx'><asp:Image ID="Image3" runat="server" ImageUrl="~/START/img/Consignacion Investigadores.png" 
                                CssClass="imagenes" ToolTip="Consignacion Investigadores" Visible="False" /></a>


                   
                    

                       <a href='/Contacaso/PanelDeCuentasLegalizacion.aspx'><asp:Image ID="Image19" runat="server" ImageUrl="~/START/img/Saldos Investigadores.png" 
                                CssClass="imagenes" ToolTip="PanelDeCuentasLegalizacion" Visible="False" /></a>

                                 
				
    
    <br />
     <br />
     
    

    
   
               

               
   
               

               <asp:Label ID="LabelUsuario" runat="server"></asp:Label>
     
    

    
   
               

</asp:Content>

