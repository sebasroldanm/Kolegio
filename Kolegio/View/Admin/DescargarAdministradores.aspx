<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/MasterAdministrador.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/DescargarAdministradores.aspx.cs" Inherits="View_Admin_DescargarAdministradores" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">

        <br />

    <CR:CrystalReportViewer ID="CRV_administradores" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" OnInit="CRV_administradores_Init" ReportSourceID="CRS_admin" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" />



    <CR:CrystalReportSource ID="CRS_admin" runat="server">
        <Report FileName="../Acudiente/Certificado/CertificadoEst.rpt">
        </Report>
    </CR:CrystalReportSource>

    </div>


</asp:Content>


