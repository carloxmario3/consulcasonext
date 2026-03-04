<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprimirLegalizacion.aspx.cs" Inherits="ContaCaso_ImprimirLegalizacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
* {
	padding:0;
	margin-left: 0;
    margin-right: 0;
    margin-bottom: 0;
}



     a, a:visited, a:hover, a:active {
  color: #003399;
}


        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        LEGALIZACION DE GASTOS ORDEN NUMERO:
        <asp:Label ID="LabelNumeroDeCaso" runat="server" Text="LabelNumeroDeCaso" Font-Bold="True"></asp:Label>
        <br />
        LEGALIZACION NUMERO:
        <asp:Label ID="LabelLegalizacionNumero" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        INVESTIGADOR: <asp:Label ID="LabelInvestigador" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        <br />
        ASEGURADO:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Labelasegurado" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        COMPAÑIA:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelCompañia" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        CIUDAD:&nbsp;&nbsp;
        <asp:Label ID="LabelCiudad" runat="server" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        FECHA DE ASIGNACION :
        <asp:Label ID="LabelDateAsignacion" runat="server" Font-Bold="True" Text="Label"></asp:Label>
        <br />
        <br />
        CONSIGNACIONES<asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        GASTOS GENERADOS<br />
                              <asp:GridView ID="GridView_Gastos" runat="server" AutoGenerateColumns="False" >
                                  <Columns>
                                      <asp:BoundField DataField="N_ID_GASTO" HeaderText="ID" />
                                      <asp:BoundField DataField="CONCEPTO" HeaderText="CONCEPTO" />
                                      <asp:BoundField DataField="FECHA" HeaderText="FECHA" />
                                      <asp:BoundField DataField="VALOR" HeaderText="VALOR" />
                                  </Columns>
                              </asp:GridView>
                          <br />
        VALOR TOTAL: <asp:Label ID="LabelValorTotal" runat="server" Text="LabelValorTotal" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <br />
        <br />
        <br />
        SALDO INVESTIGADOR:
        <asp:Label ID="LabelValorLegalizar" runat="server" Font-Bold="True" Text="Label"></asp:Label>
        <br />
        FECHA DE LEGALIZACION :
        <asp:Label ID="LabelDateOfLegalizacion" runat="server" Text="LabelFechaDeLegalizacion" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
