<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/SubMasterAcudiente.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/EditarEliminarAcudiente.aspx.cs" Inherits="View_Admin_EditarEliminarAcudiente" %>

<%-- Agregue aquí los controles de contenido --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Editar Acudiente</span></h3>
            <br />
        </div>
    </div>
    <div class="modal-body" style="margin: 0% 0% 0% 10%">
        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_AcudienteId" class="control-label" style="color: #FFFFFF">Numero de Documento :</label>
                <asp:TextBox ID="tb_AcudienteId" runat="server" class="form-control" title="Numero de Documento" placeholder="Numero de Documento" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_id" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteId" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_id" runat="server" ControlToValidate="tb_AcudienteId" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
                <asp:Label ID="L_ErrorAdmin" class="control-label" Style="color: crimson" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

            </div>

            <div class="form-group">
                <label for="tb_AcudienteNombre" class="control-label" style="color: #FFFFFF">Nombres :</label>
                <asp:TextBox ID="tb_AcudienteNombre" runat="server" class="form-control" title="Nombres Acudiente" placeholder="Nombres Acudiente" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_nombre" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteNombre" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_nombre" runat="server" ControlToValidate="tb_AcudienteNombre" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñ\sÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm2"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="control-label" style="color: #FFFFFF">Apellidos :</label>
                <asp:TextBox ID="tb_AcudienteApellido" runat="server" class="form-control" title="Apellidos Acudiente" placeholder="Apellidos Acudiente"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rv_apellido" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteApellido" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AcudienteApellido" runat="server" ControlToValidate="tb_AcudienteApellido" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñ\sÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
        </div>
        <br />
        <br />



        <div class="form-inline" role="form">

            <label for="lugarnac1" class="control-label" style="color: #FFFFFF">Lugar Nacimiento.:</label>
            <asp:DropDownList ID="ddt_lugarnacimDep" class="form-control" runat="server" DataSourceID="ObjectDataSourceDep" DataTextField="nom_dep" DataValueField="id_dep" AutoPostBack="True" Width="119px"></asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSourceDep" runat="server" SelectMethod="departamento" TypeName="DaoUser"></asp:ObjectDataSource>

            <asp:DropDownList ID="DDT_Ciudad" Class="form-control" runat="server" DataSourceID="ODS_Ciudad" DataTextField="nombre_ciudad" DataValueField="id_ciudad" Width="141px">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ODS_Ciudad" runat="server" SelectMethod="ciudad" TypeName="DaoUser">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddt_lugarnacimDep" Name="idDepart" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <div class="form-group">
                <label for="tb_AdministradorFoto" class="control-label" style="color: #FFFFFF">Foto :</label>
                <asp:FileUpload ID="FileUpload1" runat="server" accept=".jpg,.png" class="form-control" ErrorMessage="Solo Imagenes" ValidationExpression="(.*).(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.bmp|.BMP|.png|.PNG)$" Width="240px" />
                <label for="fechanac" class="control-label" style="color: #FFFFFF">Fecha Nacimiento:</label>
                <asp:TextBox ID="fechanac" runat="server" class="form-control" title="Fecha de Nacimiento" placeholder="Fecha de Nacimiento"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_fechaNac" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="fechanac" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MMMM/yyyy" PopupButtonID="btnigm_calendar" PopupPosition="BottomRight" TargetControlID="fechanac" />
            </div>
            <div class="form-group">
                <asp:ImageButton ID="btnigm_calendar" runat="server" ImageUrl="~/Imagenes/calendario 3030.png" />
            </div>
        </div>
        <br />
        <br />
        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_AcudienteCorreo" class="control-label" style="color: #FFFFFF">Correo :</label>
                <asp:TextBox type="email" runat="server" class="form-control" MaxLength="50" ID="tb_AcudienteCorreo" title="Email" placeholder="Email" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rv_correo" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteCorreo" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_email" runat="server" ControlToValidate="tb_AcudienteCorreo" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ_@./]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_AcudienteDireccion" class="control-label" style="color: #FFFFFF">Direccion :</label>
                <asp:TextBox type="text" runat="server" class="form-control" MaxLength="50" ID="tb_AcudienteDireccion" title="Direccion" placeholder="Direccion" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rv_direccion" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteDireccion" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AcudienteDireccion" runat="server" ControlToValidate="tb_AcudienteDireccion" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ#,./]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_AcudienteTelefono" class="control-label" style="color: #FFFFFF">Telefono :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_AcudienteTelefono" MaxLength="15" title="Telefono" placeholder="Telefono" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rv_telefono" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteTelefono" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV__AcudienteTelefono" runat="server" ControlToValidate="tb_AcudienteTelefono" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-z0-9()-+]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_AcudienteUsuario" class="control-label" style="color: #FFFFFF">Usuario :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_AcudienteUsuario" title="Usuario" placeholder="Usuario" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rv_usuario" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteUsuario" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AcudienteUsuario" runat="server" ControlToValidate="tb_AcudienteUsuario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="tb_AcudienteContrasenia" class="control-label" style="color: #FFFFFF">Contraseña:</label>
                <asp:TextBox type="text" class="form-control" ID="tb_AcudienteContrasenia" title="Contraseña" placeholder="Contraseña" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rv_contrasenia" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AcudienteContrasenia" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AcudienteContrasenia" runat="server" ControlToValidate="tb_AcudienteContrasenia" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="estado" class="control-label" style="color: #FFFFFF">Estado :</label>&nbsp;
                       <asp:DropDownList ID="DDL_Estado" Class="form-control" runat="server">
                           <asp:ListItem>Activo</asp:ListItem>
                           <asp:ListItem>Inactivo</asp:ListItem>
                       </asp:DropDownList>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div class="form-inline container">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btn_AcudienteAceptar" runat="server" Text="Aceptar" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" ValidationGroup="form_ejm" OnClick="btn_AcudienteAceptar_Click" />
            <asp:Button ID="btn_AcudienteEditar" runat="server" Text="Editar" class="btn btn-primary btn-lg" Width="141px" BorderColor="#660033" Visible="False" ValidationGroup="form_ejm2" OnClick="btn_AcudienteEditar_Click" />
            <asp:Label ID="L_Error" runat="server" CssClass="label-danger" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
            <asp:Button ID="btn_AcudienteNuevo" runat="server" class="btn btn-info btn-lg" Width="141px" BorderColor="#660033" Text="Nuevo" Visible="False" OnClick="btn_AcudienteNuevo_Click" />
        </div>
    </div>
</asp:Content>