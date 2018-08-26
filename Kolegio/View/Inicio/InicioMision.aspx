<%@ Page Title="" Language="C#" MasterPageFile="~/View/Inicio/MasterInicio.master" AutoEventWireup="true" CodeFile="~/Controller/Inicio/InicioMision.aspx.cs" Inherits="View_Inicio_Mision" %>

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
                        <asp:Label ID="L_Mision" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Large"></asp:Label>
                    </td>
                    <td>
                        <div class="card" style="width: 400px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/mision.png" Width="250px" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

