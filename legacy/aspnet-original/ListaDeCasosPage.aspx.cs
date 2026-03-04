using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

public partial class ListaDeCasosPage : System.Web.UI.Page
{


    

    protected void Page_Load(object sender, EventArgs e)
    {


        if (this.IsPostBack == false)
        {


            this.DropDownList1.DataSource = this.SqlDataSource5;
            this.DropDownList1.DataTextField = "Nombre";
            this.DropDownList1.DataValueField = "Id_compania";
            this.DropDownList1.DataBind();

            Session["ComboIdCompania"] = DropDownList1.SelectedValue;

            this.DropDownList2.DataSource = this.SqlDataSource6;
            this.DropDownList2.DataTextField = "Ciudad";
            this.DropDownList2.DataValueField = "Id_oficina";
            this.DropDownList2.DataBind();

            Session["ComboIdOficina"] = DropDownList2.SelectedValue;

            this.DropDownList3.DataSource = this.SqlDataSource7;
            this.DropDownList3.DataTextField = "Nombres";
            this.DropDownList3.DataValueField = "Nombres";
            this.DropDownList3.DataBind();



            this.DropDownList4.DataSource = this.SqlDataSource8;
            this.DropDownList4.DataTextField = "Nombres";
            this.DropDownList4.DataValueField = "Nombres";
            this.DropDownList4.DataBind();




        }
        
        labelpruebas.Text = Convert.ToString(Membership.GetUser());

       

        if (Roles.IsUserInRole("Investigador"))

        {
           // Session["estadocasolistade"] = "1";

            Session["investigadorlista"] = Convert.ToString(Membership.GetUser());

            Session["analistalista"] = "%";

            Session["estadocasolistade"] = "%";
                                           
        }


        if (Roles.IsUserInRole("Analista"))
        {

            GridView1.Columns[8].Visible = false;

            GridView1.Columns[9].Visible = false;

            GridView1.Columns[10].Visible = false;

            GridView1.Columns[11].Visible = false;


            Button17.Visible = true;

           // botonvercasosactivos.Visible = true;
            
           // botonvercompletos.Visible = true;
            
           // botonversuspendidos.Visible = true;

            Panelbusqueda3.Visible = true;

            


            Session["analistalista"] = Convert.ToString(Membership.GetUser());

            Session["investigadorlista"] = "%";

            Session["estadocasolistade"] = "%";
                                                   
            

        }

        if (Roles.IsUserInRole("JefeAnalista"))

        {

            GridView1.DataSourceID = "SqlDataSource4";


            GridView1.Columns[8].Visible = false;

            GridView1.Columns[9].Visible = false;

            GridView1.Columns[10].Visible = false;

            GridView1.Columns[11].Visible = false;

           


            Panel4analista.Visible = true;


            botonvercasosactivos.Visible = true;

            botonvercompletos.Visible = true;

            botonversuspendidos.Visible = true;

            Panelbusqueda3.Visible = true;
            
           

            try
            {


                SqlDataSource3.SelectParameters["elcoreoaa"].DefaultValue = Convert.ToString(Membership.GetUser());


                SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;

                SqlDataReader registro = default(SqlDataReader);


                registro = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);



                if (registro.Read())
                {
                                       

                    Session["iddeoficinaaa"] = Convert.ToString(registro["Id_oficina"]);


                }
                else
                {

                    Label2.Text = "el caso no existe";


                }


            }
            catch (SqlException ex)
            {
                Label2.Text = ex.Message;
            }









        }


        if (Roles.IsUserInRole("AreaOperativa"))
        {

           // GridView1.Sort("investigadornombre", SortDirection.Descending);


            Session["investigadorlista"] = "%";

            Session["analistalista"] = "%";

            botonvercasosactivos.Visible = true;

            botonvercompletos.Visible = true;

            botonverfacturados0.Visible = true;

            botonversuspendidos.Visible = true;

            botonbuscar.Visible = true;

            botonverinvestigador.Visible = true;

            botonvercliente.Visible = true;

           

        }

       

        Session["Verfoto"] = "";

        Session["vervideo"] = "";

        Session["identifireclamantes"] = "";

        Session["identifiafiliado"] = "";

      

            Session["estadorevicasos"] = "%";

    


     

        
        Session["tipodecaso"] = "";

        Session["vermenu"] = "si";

        Label3.Text = Convert.ToString(Session["tipodecaso"]);

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        

       

            GridViewRow row = GridView1.SelectedRow;

            Session["NumeroDeCaso"] = row.Cells[1].Text;

            Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");

     


    

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Session["estadocasolistade"] = "1";

        Session["cedulalista"] = "%";

        Session["afiliadolista"] = "%";

        Panel2clientes.Visible = false;

        Panel3investigador.Visible = false;

        Panel1Busquedas.Visible = false;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session["estadocasolistade"] = "2";

        Session["cedulalista"] = "%";

        Session["afiliadolista"] = "%";

        Panel2clientes.Visible = false;

        Panel3investigador.Visible = false;

        Panel1Busquedas.Visible = false;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session["estadocasolistade"] = "3";

        Session["cedulalista"] = "%";

        Session["afiliadolista"] = "%";

        Panel2clientes.Visible = false;

        Panel3investigador.Visible = false;

        Panel1Busquedas.Visible = false;
    }




   
   
    
    protected void Button7_Click(object sender, EventArgs e)
    {
        Session["analista222"] = "%";
        
        Session["cedulalista"] = "%";

        Session["afiliadolista"] = "%";
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        Panel1Busquedas.Visible = true;

        
        Panel2clientes.Visible = false;


        Panel3investigador.Visible = false;


    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Panel3investigador.Visible = true;

        Panel1Busquedas.Visible = false;


        Panel2clientes.Visible = false;
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Panel2clientes.Visible = true;

        Panel3investigador.Visible = false;

        Panel1Busquedas.Visible = false;

    }

    protected void DropDownList1_DropDownList1analist(object sender, EventArgs e)
    {
       
    }
  
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ComboIdCompania"] = DropDownList1.SelectedValue;

        this.DropDownList2.DataSource = this.SqlDataSource6;
        this.DropDownList2.DataTextField = "Ciudad";
        this.DropDownList2.DataValueField = "Id_oficina";
        this.DropDownList2.DataBind();

        Session["ComboIdOficina"] = DropDownList2.SelectedValue;

        this.DropDownList3.DataSource = this.SqlDataSource7;
        this.DropDownList3.DataTextField = "Nombres";
        this.DropDownList3.DataValueField = "Nombres";
        this.DropDownList3.DataBind();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ComboIdOficina"] = DropDownList2.SelectedValue;

        this.DropDownList3.DataSource = this.SqlDataSource7;
        this.DropDownList3.DataTextField = "Nombres";
        this.DropDownList3.DataValueField = "Nombres";
        this.DropDownList3.DataBind();
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if (DropDownListbusqueda.SelectedValue == "0")
        {
            GridViewnumerocaso.Visible = true;

            Session["busquedasnumerodecaso"] = TextBox1.Text;
                        
            GridViewAfiliados.Visible = false;
            
            GridViewreclamante.Visible = false;
            
            GridViewRecAfiliado.Visible = false;
            
            GridViewRecEmpresa.Visible = false;

        }


        if (DropDownListbusqueda.SelectedValue == "1")
        {

            GridViewAfiliados.Visible = true;

            Session["busquedasafiliado"] = TextBox1.Text;

            Session["busquedasafiliadocedula"] = "%";



            GridViewnumerocaso.Visible = false;
            

            GridViewreclamante.Visible = false;


            GridViewRecAfiliado.Visible = false;


            GridViewRecEmpresa.Visible = false;


        }

        if (DropDownListbusqueda.SelectedValue == "2")
        {


            GridViewAfiliados.Visible = true;

            Session["busquedasafiliado"] = "%";

            Session["busquedasafiliadocedula"] = TextBox1.Text;



            GridViewnumerocaso.Visible = false;







            GridViewreclamante.Visible = false;


            GridViewRecAfiliado.Visible = false;


            GridViewRecEmpresa.Visible = false;


        }


        if (DropDownListbusqueda.SelectedValue == "3")
        {

            GridViewreclamante.Visible = true;

            Session["busquedasReclamante"] = TextBox1.Text;

            Session["busquedasReclamantecedula"] = "%";


            GridViewnumerocaso.Visible = false;



            GridViewAfiliados.Visible = false;






            GridViewRecAfiliado.Visible = false;


            GridViewRecEmpresa.Visible = false;


        }



        if (DropDownListbusqueda.SelectedValue == "4")
        {
            GridViewreclamante.Visible = true;

            Session["busquedasReclamante"] = "%";

            Session["busquedasReclamantecedula"] = TextBox1.Text;


            GridViewnumerocaso.Visible = false;
                        
            GridViewAfiliados.Visible = false;
                        
            GridViewRecAfiliado.Visible = false;
            
            GridViewRecEmpresa.Visible = false;


        }



        if (DropDownListbusqueda.SelectedValue == "5")
        {


            GridViewRecAfiliado.Visible = true;


            GridViewRecEmpresa.Visible = true;

            Session["busquedasEmpresa"] = TextBox1.Text;


            GridViewnumerocaso.Visible = false;



            GridViewAfiliados.Visible = false;



            GridViewreclamante.Visible = false;

        }
    }
    protected void DropDownListbusqueda_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button13_Click(object sender, EventArgs e)
    {

        GridViewFiltroCliente.Visible = true;


        Session["filtroclientenombre"] = DropDownList3.SelectedValue;


        Session["filtroclienteEstado"] = DropDownList5.SelectedValue;
       

    }
    protected void Button14_Click(object sender, EventArgs e)
    {


        GridViewFiltroInvestigador.Visible = true;


        Session["filtroInvestigadorNombre"] = DropDownList4.SelectedValue;


        Session["filtroInvestigadorEstado"] = DropDownList6.SelectedValue;



    }
    protected void GridViewnumerocaso_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridViewnumerocaso_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GridViewRow row = GridViewnumerocaso.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");
    }
    protected void GridViewAfiliados_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewAfiliados.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");



    }
    protected void GridViewreclamante_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridViewreclamante.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");
    }
    protected void GridViewRecAfiliado_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewRecAfiliado.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");


    }
    protected void GridViewRecEmpresa_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewRecEmpresa.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");


    }
    protected void GridViewFiltroCliente_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewFiltroCliente.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");


    }
    protected void GridViewFiltroInvestigador_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewFiltroInvestigador.SelectedRow;

        Session["NumeroDeCaso"] = row.Cells[1].Text;

        Page.Response.Redirect("~/VisualizadorDeCasos.aspx" + row.Cells[1].Text + "punto" + "normal");



    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        Session["analista222"] = DropDownListanalista.SelectedValue;
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        if (DropDownListbusnormal.SelectedValue == "0")
        {

            Session["cedulalista"] = TextBox2.Text;

            Session["afiliadolista"] = "%";

            Session["estadocasolistade"] = "%";

            Session["analista222"] = "%";

                                   


        }


        if (DropDownListbusnormal.SelectedValue == "1")
        {

            Session["cedulalista"] = "%";

            Session["afiliadolista"] = TextBox2.Text;

            Session["estadocasolistade"] = "%";

            Session["analista222"] = "%";

        }

       
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        Session["estadocasolistade"] = "%";
        
        Session["cedulalista"] = "%";

        Session["afiliadolista"] = "%";

        Panel2clientes.Visible = false;

        Panel3investigador.Visible = false;

        Panel1Busquedas.Visible = false;

    }
    protected void Buttonfactura_Click(object sender, EventArgs e)
    {
        Session["estadocasolistade"] = "4";

        Session["cedulalista"] = "%";

        Session["afiliadolista"] = "%";

        Panel2clientes.Visible = false;

        Panel3investigador.Visible = false;

        Panel1Busquedas.Visible = false;
    }
}