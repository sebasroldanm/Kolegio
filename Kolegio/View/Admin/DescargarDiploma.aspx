<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Admin/DescargarDiploma.aspx.cs" Inherits="View_Admin_Default" %>

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
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CRS_desdiploma" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" OnInit="CrystalReportViewer1_Init" />
            <CR:CrystalReportSource ID="CRS_desdiploma" runat="server">
                <Report FileName="../../Reportes/Diploma.rpt">
                </Report>
            </CR:CrystalReportSource>
        </div>
    </form>
</body>
</html>
