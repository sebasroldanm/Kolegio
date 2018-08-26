<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/MasterAdministrador.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/EditarPaginaInicio.aspx.cs" Inherits="View_Admin_EditarPaginaInicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
            .auto-style2 {
                width: 50%;
            }
        </style>
        </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Paginas Inicio</span></h3>
        </div>
        <label class="control-label" style="color: #FFFFFF"></label>
        <br />
    </div>

    <%--<div class="panel-img" style="margin: -100px 0px 0px 330px;">
        <img src="../../Imagenes/Panel.png" />
    </div>--%>
    <div class="container">

        <table class="nav-justified">
            <tr>
                <td class="auto-style2">
                    

<label for="TB_Asuto" class="control-label" style="color: #FFFFFF">Nosotros :</label>
                        <asp:TextBox ID="TB_Nosotros" runat="server" class="form-control" Width="370px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Nosotros" runat="server" ControlToValidate="TB_Nosotros" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <br /><asp:RegularExpressionValidator ID="REV_Nosotros" runat="server" ControlToValidate="TB_Nosotros" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñÑ,.\s\n()áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <label for="TB_Mision" class="control-label" style="color: #FFFFFF">Misión :&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        &nbsp;<asp:TextBox ID="TB_Mision" class="form-control" runat="server" Width="370px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Mision" runat="server" ControlToValidate="TB_Mision" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <br /><asp:RegularExpressionValidator ID="REV_Mision" runat="server" ControlToValidate="TB_Mision" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñ,.\s\nÑ()áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><label for="TB_Vision" class="control-label" style="color: #FFFFFF">Visión :&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        &nbsp;<asp:TextBox ID="TB_Vision" class="form-control" runat="server" Width="370px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Vision" runat="server" ControlToValidate="TB_Vision" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <br /><asp:RegularExpressionValidator ID="REV_Vision" runat="server" ControlToValidate="TB_Vision" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñÑ,.\s\n()áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator></td>
                <td>
                    <asp:Button ID="B_Modificar" runat="server" Text="Modificar" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" OnClick="B_Modificar_Click" />
                <asp:Button ID="B_Traer" runat="server" Text="Traer Datos" BorderColor="#660033" OnClick="B_Traer_Click" class="btn btn-info btn-lg" CausesValidation="False" />
                <asp:Label ID="L_Verificar" runat="server" ForeColor="White" CssClass="label-danger" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <label for="fechanac" class="control-label" style="color: #FFFFFF">Fecha Terminacion Año:</label>
                <asp:TextBox ID="fechanac" runat="server" class="form-control" title="Fecha de Año" placeholder="Dijite Fecha de Fin Año"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_fechaNac" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="fechanac" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MMMM/yyyy" PopupButtonID="btnigm_calendar" PopupPosition="BottomRight" TargetControlID="fechanac" />
                </td>
                <td>
                    <asp:Button ID="B_Terminaranio" runat="server" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" Text="Insertar Fin" OnClick="B_Terminaranio_Click" />
                </td>
            </tr>
        </table>

    </div>

</asp:Content>

