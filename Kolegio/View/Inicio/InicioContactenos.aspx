<%@ Page Title="" Language="C#" MasterPageFile="~/View/Inicio/MasterInicio.master" AutoEventWireup="true" CodeFile="~/Controller/Inicio/InicioContactenos.aspx.cs" Inherits="View_Inicio_InicioContactenos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="text-center">
            <h3><span class="label label-Warning">Contactenos</span></h3>
            <br />
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend class="text-center header">Contacto con Kolegio</legend>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TB_Nombres" runat="server" CssClass="form-control" MaxLength="30" placeholder="Nombres"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Nombres" runat="server" ErrorMessage="*" SetFocusOnError="True" ControlToValidate="TB_Nombres"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="REV_Nombres" runat="server" ControlToValidate="TB_Nombres" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Zñ\sÑáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TB_Apellidos" runat="server" CssClass="form-control" MaxLength="30" placeholder="Apellios"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Apellidos" runat="server" ErrorMessage="*" SetFocusOnError="True" ControlToValidate="TB_Apellidos"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="REV_Apellidos" runat="server" ControlToValidate="TB_Apellidos" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Zñ\sÑáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TB_Correo" runat="server" CssClass="form-control" MaxLength="50" placeholder="Correo" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Correo" runat="server" ErrorMessage="*" SetFocusOnError="True" ControlToValidate="TB_Correo"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="REV_Correo" runat="server" ControlToValidate="TB_Correo" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ_@./]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TB_Telefono" runat="server" CssClass="form-control" MaxLength="10" placeholder="Teléfono" TextMode="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Telefono" runat="server" ErrorMessage="*" SetFocusOnError="True" ControlToValidate="TB_Telefono"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="REV_TB_Telefono" runat="server" ControlToValidate="TB_Telefono" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-z0-9ñ\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                                <div class="col-md-8">
                                    <asp:TextBox ID="TB_Mensaje" runat="server" CssClass="form-control" placeholder="Enviamos tu mensaje, nos contactaremos contigo lo mas pronto posible" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Mensaje" runat="server" ErrorMessage="*" SetFocusOnError="True" ControlToValidate="TB_Mensaje"></asp:RequiredFieldValidator><br />
                                    <asp:RegularExpressionValidator ID="REV_Mensaje" runat="server" ControlToValidate="TB_Mensaje" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñÑ,.\s\n()áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <asp:Button ID="B_Enviar" runat="server" Text="Enviar" CssClass="btn btn-primary btn-lg" OnClick="B_Enviar_Click" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

