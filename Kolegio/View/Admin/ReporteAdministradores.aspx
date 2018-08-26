<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Admin/ReporteAdministradores.aspx.cs" Inherits="View_Admin_ReporteAdministradores" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>





            <CR:CrystalReportViewer ID="CRV_reporteAdmin" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CRS_reporteAdmin" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" />


            <CR:CrystalReportSource ID="CRS_reporteAdmin" runat="server">
                <Report FileName="../../Reportes/ListaAdministradores.rpt">
                </Report>
            </CR:CrystalReportSource>





        </div>
    </form>
</body>
</html>
