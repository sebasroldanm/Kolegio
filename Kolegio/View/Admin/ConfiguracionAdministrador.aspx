<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/MasterAdministrador.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/ConfiguracionAdministrador.aspx.cs" Inherits="View_Admin_ConfiguraionAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            padding: 15px;
            left: 0px;
            top: 0px;
            width: 527px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Configuracion</span></h3>
        </div>
    </div>
    <div class="panel-img" style="margin: -100px 0px 0px 330px;">
        <img src="../../Imagenes/Panel.png" />
    </div>
    <div style="position: absolute; z-index: 1">
        <div class="auto-style1" style="margin: -535px 0px 0px 365px;">
            <div class="form-group">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                              <asp:Image ID="ImagenEst" runat="server" Height="150px" Width="130px" for="TB_Usuaro" />
                <br />
                <br />
                <div class="form-inline" role="form">
                    <label for="tb_usuario" typeof="text" class="control-label" style="color: #FFFFFF">Usuario : &nbsp;&nbsp;&nbsp;&nbsp;</label>
                    &nbsp;<asp:TextBox ID="tb_usuario" runat="server" class="form-control" title="Usuario" placeholder="Usuario" Width="126px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RV_user" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_usuario" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="REV_usuario" runat="server" ControlToValidate="tb_usuario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
                    <label for="tb_contrasenia" typeof="text" class="control-label" style="color: #FFFFFF">Contraseña :</label>
                    <asp:TextBox ID="tb_contrasenia" Type="text" runat="server" class="form-control" title="Contraseña" placeholder="Contraseña" Width="180px" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RV_contrasenia" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_contrasenia" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="REV_contrasenia" runat="server" ControlToValidate="tb_contrasenia" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
                </div>
                <div class="form-inline" role="form">
                    <label for="tb_correo" typeof="text" class="control-label" style="color: #FFFFFF">Correo :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tb_correo" Type="email" runat="server" class="form-control" title="Correo" placeholder="Correo" Width="209px" TextMode="Email" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_correo" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="REV_correo" runat="server" ControlToValidate="tb_correo" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ_@./]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
                    <asp:Label ID="lb_foto" for="tb_Foto" class="control-label" runat="server" Text="Foto :" Style="color: #FFFFFF" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="tb_Foto" runat="server" accept=".jpg,.png" class="form-control" ErrorMessage="Solo Imagenes" ValidationExpression="(.*).(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.bmp|.BMP|.png|.PNG)$" Width="156px" />
                    <asp:RequiredFieldValidator ID="RV_foto" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_foto" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-inline" role="form">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_Editar" runat="server" Text="Editar" class="btn btn-info btn-lg" Width="107px" BorderColor="#660033" OnClick="btn_Editar_Click" />
                </div>
                <br />
                <div class="form-inline">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                          
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" class="btn btn-success btn-lg" Width="107px" BorderColor="#660033" ValidationGroup="form_ejm" OnClick="btn_Aceptar_Click" Visible="False" />
                    &nbsp;&nbsp;
               <asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" class="btn btn-danger btn-lg" Width="107px" BorderColor="#660033" Visible="False" OnClick="btn_cancelar_Click" />
                    &nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>

</asp:Content>

