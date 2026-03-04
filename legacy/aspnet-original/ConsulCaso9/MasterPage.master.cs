using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsulCaso9_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Label1.Text = Server.MachineName;

        string Records = null;


        if (Roles.IsUserInRole("Analista"))

        {

            Records = "<li><a href='/ConsulCaso9/PanelDeControlSimple.aspx'><img src='/ConsulCaso9/file-text.png'/>   Lista De Casos</a></li><li><a href='/nuevocaso/1'><img src='/ConsulCaso9/file-text.png'/>   Nuevos Casos</a></li><li><a href='/ConsulCaso9/LogOut.aspx'><img src='/ConsulCaso9/file-text.png'/>   Cerrar Sesion</a></li>";
        
        }


         if (Roles.IsUserInRole("JefeAnalista") )
        
        {

            Records = "<li><a href='/ConsulCaso9/PanelDeControlSimple.aspx'><img src='/ConsulCaso9/file-text.png'/>   Lista De Casos</a></li><li><a href='/nuevocaso/1'><img src='/ConsulCaso9/file-text.png'/>   Nuevos Casos</a></li><li><a href='/ConsulCaso9/LogOut.aspx'><img src='/ConsulCaso9/file-text.png'/>   Cerrar Sesion</a></li>";

        }



               if (Roles.IsUserInRole("AreaOperativa"))

            {


                Records = "<li><a href='/ContaCaso/Facturacion/FacturacionCasoMultipleColfodos.aspx'><img src='/ConsulCaso9/file-text.png'/>   Facturacion Colfondos</a></li><li><a href='/ContaCaso/Facturacion/TarifasInvestigacion.aspx'><img src='/ConsulCaso9/file-text.png'/>   Tarifas Investigacion</a></li><li><a href='/ContaCaso/ConsignacionViaticos.aspx'><img src='/ConsulCaso9/file-text.png'/>   Consignacion Investigadores</a></li><li><a href='/ConsulCaso9/PanelDeControlSimple.aspx'><img src='/ConsulCaso9/file-text.png'/>   Lista De Casos</a></li><li><a href='/ConsulCaso9/VerTodosLosCasos.aspx'><img src='/ConsulCaso9/file-text.png'/>   Buscar Casos</a></li><li><a href='/ListaDeCasosPage.aspx'><img src='/ConsulCaso9/file-text.png'/>   Lista De Casos Antigua</a></li><li><a href='/nuevocaso/1'><img src='/ConsulCaso9/file-text.png'/>   Nuevos Casos</a></li><li><a href='/Gestion/AsignarCasosPage.aspx'><img src='/ConsulCaso9/file-text.png'/>   Asignar Casos</a></li><li><a href='/Gestion/EstadoPage.aspx'><img src='/ConsulCaso9/file-text.png'/>   Cambiar Estado Casos</a></li><li><a href='/ListaDeInformes/Revisar'><img src='/ConsulCaso9/file-text.png'/>   Revisar Informes</a></li><li><a href='/ListaDeInformes/Publicados'><img src='/ConsulCaso9/file-text.png'/>   Informes Publicados</a></li><li><a href='/Administracion/ClientesPage.aspx'><img src='/ConsulCaso9/file-text.png'/>   Administrar Clientes</a></li><li><a href='/Administracion/InvestigadoresPage.aspx'><img src='/ConsulCaso9/file-text.png'/>   Administrar Investigadores</a></li><li><a href='/Administracion/DepartamentosPage.aspx'><img src='/ConsulCaso9/file-text.png'/>   Administrar Ciudades</a></li><li><a href='/ContaCaso/EditarConceptos.aspx'><img src='/ConsulCaso9/file-text.png'/>   Administrar Conceptos</a></li><li><a href='/ContaCaso/RecivoCajaMenor.aspx'><img src='/ConsulCaso9/file-text.png'/>   Regreso A Caja Menor</a></li><li><a href='/Contacaso/Consignaciones.aspx'><img src='/ConsulCaso9/file-text.png'/>   Saldos Investigadores</a></li><li><a href='/ContaCaso/imprimir/ReporteLegalizacionesMes.aspx'><img src='/ConsulCaso9/file-text.png'/>   Reporte Legalizacion</a></li><li><a href='/ContaCaso/RecivoCajaMenor.aspx'><img src='/ConsulCaso9/file-text.png'/>   Regreso A Caja Menor</a></li><li><a href='/ConsulCaso9/LogOut.aspx'><img src='/ConsulCaso9/file-text.png'/>   Cerrar Sesion</a></li>";


                   
                   
                   


                       

            }


                   if (Roles.IsUserInRole("Investigador"))
             {


                 Records = "<li><a href='/ConsulCaso9/PanelDeControlSimple.aspx'><img src='/ConsulCaso9/file-text.png'/>   Lista De Casos</a></li><li><a href='/ListaDeInformes/Revisar'><img src='/ConsulCaso9/file-text.png'/>   Revisar Informes</a></li><li><a href='/Contacaso/InvConsignaciones.aspx'><img src='/ConsulCaso9/file-text.png'/>   Consignaciones</a></li><li><a href='/ConsulCaso9/LogOut.aspx'><img src='/ConsulCaso9/file-text.png'/>   Cerrar Sesion</a></li>";

            }


                   //Panel1.Controls.Add(new LiteralControl(Records));


    }
}
