<%@ Page Title="" Language="C#" MasterPageFile="~/View/Profesor/MasterProfesor.master" AutoEventWireup="true" CodeFile="~/Controller/Profesor/ProfesorMensaje.aspx.cs" Inherits="View_Profesor_ProfesorMensaje" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 321px;
        }
    </style>
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
            <h3><span class="label label-danger">Mensaje Acudiente</span></h3>
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
                <div class="form-inline">

                    <div class="form-inline" role="form">
                        <label typeof="text" class="control-label" style="color: #FFFFFF">Curso :</label>

                        <asp:DropDownList ID="DDL_Curso" CssClass="form-control" runat="server" DataSourceID="ODS_Obterner_curso" DataTextField="nombre_curso" DataValueField="id_ancu" AutoPostBack="True" ValidationGroup="actua"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RVF_Curso" runat="server" ErrorMessage="*" ControlToValidate="DDL_Curso" ValidationGroup="actua" ForeColor="Red" Font-Size="X-Large"></asp:RequiredFieldValidator>

                        <asp:ObjectDataSource ID="ODS_Obterner_curso" runat="server" SelectMethod="cursoProfesor" TypeName="DaoUser">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="userId" Name="id_p" SessionField="userId" Type="String" />
                                <asp:SessionParameter DefaultValue="" Name="anio" SessionField="anio" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

                        <label typeof="text" class="control-label" style="color: #FFFFFF">Materia :</label>
                        <asp:DropDownList ID="DDL_Materia" CssClass="form-control" runat="server" DataSourceID="ODS_Traer_materia" DataTextField="nombre_materia" DataValueField="id_materia" AutoPostBack="True" ValidationGroup="actua"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFV_Materia" runat="server" ErrorMessage="*" ControlToValidate="DDL_Materia" ValidationGroup="actua" ForeColor="Red" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <asp:ObjectDataSource ID="ODS_Traer_materia" runat="server" SelectMethod="obtenermateriadecurso" TypeName="DaoUser">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_Curso" Name="reg" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

                    </div>
                    <br />
                    <div class="form-inline" role="form">

                        <label typeof="text" class="control-label" style="color: #FFFFFF">Alumno :</label>
                        <asp:DropDownList ID="DDL_Alumno" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="ODS_Obtener_alumno" DataTextField="nombre_usua" DataValueField="id_usua" ValidationGroup="actua"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFV_Alumno" runat="server" ErrorMessage="*" ControlToValidate="DDL_Alumno" ValidationGroup="actua" ForeColor="Red" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <asp:ObjectDataSource ID="ODS_Obtener_alumno" runat="server" SelectMethod="obtenerEstApel" TypeName="DaoUser">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_Curso" Name="curs" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>

                    <div class="form-inline" role="form">
                        <div class="form-group">
                            <label class="control-label" style="color: #FFFFFF"></label>
                            <asp:Button ID="B_Actualizar" runat="server" Text="Actualizar Destinatario" class="btn btn-info btn-lg" BorderColor="#660033" OnClick="B_Actualizar_Click" ValidationGroup="actua" />
                        </div>
                        <br />

                    </div>

                    <div class="form-inline" role="form">
                        <div class="form-group">

                            <label for="TB_Asuto" class="control-label" style="color: #FFFFFF">Asunto :</label>
                            <asp:TextBox ID="TB_Asuto" runat="server" class="form-control" Width="359px" MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Asuto" runat="server" ControlToValidate="TB_Asuto" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <br /><asp:RegularExpressionValidator ID="REV_Asuto" runat="server" ControlToValidate="TB_Asuto" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ\s,.áéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                        </div>
                    </div>


                    <div class="form-inline" role="form">
                        <div class="form-group">
                            <label for="TB_Destinatario" class="control-label" style="color: #FFFFFF">Destinatario :</label>
                            <asp:TextBox ID="TB_Destinatario" class="form-control" runat="server" Width="359px" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Destinatario" runat="server" ControlToValidate="TB_Destinatario" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="REV_Destinatario" runat="server" ControlToValidate="TB_Destinatario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9,ñÑ_@./]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                        </div>
                    </div>


                    <div class="form-inline" role="form">
                        <div class="form-group">
                            <label for="TB_Mensaje" class="control-label" style="color: #FFFFFF">Mensaje :</label>
                            <asp:TextBox ID="TB_Mensaje" class="form-control" runat="server" Height="100px" Width="378px" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Mensaje" runat="server" ControlToValidate="TB_Mensaje" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                            <br /><asp:RegularExpressionValidator ID="REV_Mensaje" runat="server" ControlToValidate="TB_Mensaje" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ,.\sáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="B_Enviar" runat="server" Text="Enviar" OnClick="B_Enviar_Click" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" />

                    <asp:Label ID="L_Verificar" runat="server" ForeColor="White" CssClass="label-danger" Font-Bold="True"></asp:Label>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

