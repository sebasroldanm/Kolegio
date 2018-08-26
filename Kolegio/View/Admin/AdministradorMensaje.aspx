<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/MasterAdministrador.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/AdministradorMensaje.aspx.cs" Inherits="View_Administrador_AdministradorMensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Mensaje Nuevo</span></h3>
        </div>
        <label class="control-label" style="color: #FFFFFF"></label>
        <br />
    </div>

    <div class="panel-img" style="margin: -100px 0px 0px 330px;">
        <img src="../../Imagenes/Panel.png" />
    </div>
    <div style="position: absolute; z-index: 1">
        <div class="modal-body" style="margin: -570px 0px 0px 380px;">

            <div class="form-group">

                <div class="form-inline" role="form">
                    <div class="form-group">

                        <label class="control-label" style="color: #FFFFFF"></label>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-inline" role="form">
                    <div class="form-group">

                        <label for="TB_Asuto" class="control-label" style="color: #FFFFFF">Asunto :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        &nbsp;<asp:TextBox ID="TB_Asuto" runat="server" class="form-control" Width="359px" MaxLength="30"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RV_Asunto" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="TB_Asuto" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <br /><asp:RegularExpressionValidator ID="REV_Asuto" runat="server" ControlToValidate="TB_Asuto" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ\s,.áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <br />
                </div>


                <div class="form-inline" role="form">
                    <div class="form-group">
                        <label for="TB_Destinatario" class="control-label" style="color: #FFFFFF">Destinatario :</label>
                        <asp:TextBox ID="TB_Destinatario" class="form-control" runat="server" Width="359px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RV_Destinatario" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="TB_Destinatario" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <br /><asp:RegularExpressionValidator ID="REV_Destinatario" runat="server" ControlToValidate="TB_Destinatario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ_@.]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <br />
                </div>


                <div class="form-inline" role="form">
                    <div class="form-group">
                        <label for="TB_Mensaje" class="control-label" style="color: #FFFFFF">Mensaje :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        &nbsp;<asp:TextBox ID="TB_Mensaje" class="form-control" runat="server" Height="100px" Width="378px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RV_Mensaje" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="TB_Mensaje" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <br /><asp:RegularExpressionValidator ID="REV_Mensaje" runat="server" ControlToValidate="TB_Mensaje" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ,.áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <br />
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="B_Enviar" runat="server" Text="Enviar" OnClick="B_Enviar_Click" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" />
                <asp:Label ID="L_Verificar" runat="server" ForeColor="White" CssClass="label-danger" Font-Bold="True"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

