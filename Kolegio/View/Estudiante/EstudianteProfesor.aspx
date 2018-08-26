<%@ Page Title="" Language="C#" MasterPageFile="~/View/Estudiante/MasterEstudiante.master" AutoEventWireup="true" CodeFile="~/Controller/Estudiante/EstudianteProfesor.aspx.cs" Inherits="View_Estudiante_EstudianteProfesor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Mensaje Profesor</span></h3>
        </div>
        <label class="control-label" style="color: #FFFFFF"></label>
        <br />
    </div>
    <div class="panel-img" style="margin: -100px 0px 0px 330px;">
        <img src="../../Imagenes/Panel.png" />
    </div>
    <div style="position: absolute; z-index: 1">
        <div class="modal-body" style="margin: -535px 0px 0px 365px;">

            <div class="form-group">

                <div class="form-inline" role="form">
                    <div class="form-group">

                        <label class="control-label" style="color: #FFFFFF"></label>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-inline">
                    <label for="ddl_materia" class="control-label" style="color: #FFFFFF">Profesor :</label>
                    <asp:DropDownList class="control-label" ID="DDL_Materia" runat="server" AutoPostBack="True" DataSourceID="ODS_MensajeProfe" DataTextField="nombre_usua" DataValueField="correo"></asp:DropDownList>
                    <asp:ObjectDataSource ID="ODS_MensajeProfe" runat="server" SelectMethod="profemensaje" TypeName="DaoUser">
                        <SelectParameters>
                            <asp:SessionParameter Name="id_usua" SessionField="userId" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="form-inline" role="form">
                    <div class="form-group">
                        <label for="TB_Asuto" class="control-label" style="color: #FFFFFF">Asunto :</label>
                        <asp:TextBox ID="TB_Asuto" runat="server" class="form-control" Width="359px" IsReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Asuto" runat="server" ControlToValidate="TB_Asuto" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="REV_Asuto" runat="server" ControlToValidate="TB_Asuto" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-z&A-z&0-9ñÑ,.\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-inline" role="form">
                    <div class="form-group">
                        <label for="TB_Destinatario" class="control-label" style="color: #FFFFFF">Destinatario :</label>
                        <asp:TextBox ID="TB_Destinatario" class="form-control" runat="server" Width="359px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Destinatario" runat="server" ControlToValidate="TB_Destinatario" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <%--<asp:RegularExpressionValidator ID="REV_Destinatario" runat="server" ControlToValidate="TB_Destinatario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-z&A-z&0-9ñÑ.,/@_-]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>--%>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-inline" role="form">
                    <div class="form-group">
                        <label for="TB_Mensaje" class="control-label" style="color: #FFFFFF">Mensaje :</label>
                        <asp:TextBox ID="TB_Mensaje" class="form-control" runat="server" Height="100px" Width="378px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Mensaje" runat="server" ControlToValidate="TB_Mensaje" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="REV_Mensaje" runat="server" ControlToValidate="TB_Mensaje" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-z&A-z&0-9ñÑ,.\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                    </div>
                    <br />
                    <br />
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="B_Enviar" runat="server" Text="Enviar" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" OnClick="B_Enviar_Click" />

                <asp:Label ID="L_Verificar" runat="server" ForeColor="White" CssClass="label-danger" Font-Bold="True"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
