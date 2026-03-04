using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contenidos_InfoFallecimientoPage : System.Web.UI.Page
{

    private ClaseMuerte muerteok = new ClaseMuerte();
    private ClaseAfiliado afiliadook = new ClaseAfiliado();


    protected void Page_Load(object sender, EventArgs e)
    {

        


        if (this.IsPostBack == false)
        {
            this.DropDownList1.DataSource = this.SqlDataSource2;
            this.DropDownList1.DataTextField = "Nombre";
            this.DropDownList1.DataValueField = "Id_departamento";
            this.DropDownList1.DataBind();

            Session["departamento"] = "1";

            this.DropDownList2.DataSource = this.SqlDataSource3;
            this.DropDownList2.DataTextField = "Ciudad";
            this.DropDownList2.DataValueField = "Id_Ciudad";
            this.DropDownList2.DataBind();


        }


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["departamento"] = DropDownList1.SelectedValue;

        this.DropDownList2.DataSource = this.SqlDataSource3;
        this.DropDownList2.DataTextField = "Ciudad";
        this.DropDownList2.DataValueField = "Id_Ciudad";
        this.DropDownList2.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string varito = "no paso";
        string IdAfiliado = "nada";
        string varito2 = "no paso";

        afiliadook.leeridafiliado(Convert.ToString(Session["NumeroDeCaso"]), ref IdAfiliado, ref varito2);

        lb_info_operacion2.Text = varito2;


        muerteok.Id_afiliado = IdAfiliado;

        muerteok.Causa_muerte = tb_causa.Text;

        muerteok.Circustancias = tb_circustancias.Text;

        muerteok.Fecha = lb_fecha.Text;

        muerteok.Hora = tb_hora.Text;

        muerteok.Lugar = DropDownList2.SelectedValue;

        muerteok.nuevo(ref varito);


        lb_info_operacion.Text = varito;


        Response.Redirect("~/Contenidos/InfoFallecimientoPage.aspx");


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        lb_fecha.Text = Convert.ToString(Calendar1.SelectedDate.Day);

        lb_fecha.Text = lb_fecha.Text + "/" + Convert.ToString(Calendar1.SelectedDate.Month);

        lb_fecha.Text = lb_fecha.Text + "/" + Convert.ToString(Calendar1.SelectedDate.Year);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}