<%@ Page Title="" Language="C#" MasterPageFile="~/View/Acudiente/MasterAcudiente.master" AutoEventWireup="true" CodeFile="~/Controller/Acudiente/DescargarCertificado.cs" Inherits="View_Acudiente_AcudienteExcuda" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container">
         <div class="text-center">
                                 <h3><span class="label label-info">Excusa</span></h3>
                                 </div>

    </div>

    <div class="container">


        <CR:CrystalReportViewer ID="CRV_certificado1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CRS_certificado" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" />



        <CR:CrystalReportSource ID="CRS_certificado" runat="server">
            <Report FileName="View\Acudiente\Certificado\CertificadoEst.rpt">
            </Report>
        </CR:CrystalReportSource>



    </div>


</asp:Content>

