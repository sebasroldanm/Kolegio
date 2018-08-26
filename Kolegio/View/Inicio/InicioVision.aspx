<%@ Page Title="" Language="C#" MasterPageFile="~/View/Inicio/MasterInicio.master" AutoEventWireup="true" CodeFile="~/Controller/Inicio/InicioVision.aspx.cs" Inherits="View_Inicio_Vision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h1><span class="label label-info">Mision</span></h1>
            <br />
        </div>
    </div>
    <div class="container">
        <div class="jumbotron">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/vision.png" Width="250px" />
                    </td>
                    <td>
                        <div class="card" style="width: 400px">
                            <asp:Label ID="L_Vision" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Large"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

