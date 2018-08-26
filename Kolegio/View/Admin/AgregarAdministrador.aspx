<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/SubMasterAdministrador.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/AgregarAdministrador.aspx.cs" Inherits="View_Admin_AgregarAdministrador" %>



<%-- Agregue aquí los controles de contenido --%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../../Bootstrap/Mio/calendario.css" rel="stylesheet" />

    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Agregar Administrador</span></h3>
            <br />
        </div>
    </div>
    <div class="modal-body" style="margin: 0% 0% 0% 10%">
        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_AministradorAdministradorId" typeof="number" class="control-label" style="color: #FFFFFF">Numero de Documento :</label>
                <asp:TextBox ID="tb_AministradorAdministradorId" runat="server" class="form-control" MaxLength="10" title="Numero de Documento" placeholder="Numero de Documento"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_id" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AministradorAdministradorId" ValidationGroup="form_ejm3" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AministradorAdministradorId" runat="server" ControlToValidate="tb_AministradorAdministradorId" ErrorMessage="Digitar solo números" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm3"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_AdministradorAdministradorNombre" class="control-label" style="color: #FFFFFF">Nombres :</label>
                <asp:TextBox ID="tb_AdministradorAdministradorNombre" runat="server" class="form-control" title="Nombres Administrador" MaxLength="30" placeholder="Nombres Administrador"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_nombre" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorAdministradorNombre" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorAdministradorNombre" runat="server" ControlToValidate="tb_AdministradorAdministradorNombre" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Zñ\sÑáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>

            </div>

            <div class="form-group">
                <label class="control-label" style="color: #FFFFFF">Apellidos :</label>
                <asp:TextBox ID="tb_AdministradorAdministradorApellido" MaxLength="30" runat="server" class="form-control" title="Apellidos Administrador" placeholder="Apellidos Administrador"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_Apellido" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorAdministradorApellido" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorAdministradorApellido" runat="server" ControlToValidate="tb_AdministradorAdministradorApellido" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-ZñÑ\sáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
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
                <asp:FileUpload ID="tb_AdministradorFoto" runat="server" class="form-control" Width="240px" />
                <asp:RequiredFieldValidator ID="RV_foto" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorFoto" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                <label for="fechanac" class="control-label" style="color: #FFFFFF">Fecha Nacimiento:</label>
                <asp:TextBox ID="fechanac" runat="server" class="form-control" title="Fecha de Nacimiento" placeholder="Fecha de Nacimiento"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_fechaNac" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="fechanac" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>

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
                <label for="tb_AdministradorAdministradorCorreo" class="control-label" style="color: #FFFFFF">Correo :</label>
                <asp:TextBox type="email" MaxLength="50" runat="server" class="form-control" ID="tb_AdministradorAdministradorCorreo" title="Email" placeholder="Email" Width="400px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_correo" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorAdministradorCorreo" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorAdministradorCorreo" runat="server" ControlToValidate="tb_AdministradorAdministradorCorreo" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ_./@]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_AdministradorAdministradorDireccion" class="control-label" style="color: #FFFFFF">Direccion :</label>
                <asp:TextBox type="text" runat="server" class="form-control" ID="tb_AdministradorAdministradorDireccion" MaxLength="50" title="Direccion" placeholder="Direccion" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_direccion" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorAdministradorDireccion" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorAdministradorDireccion" runat="server" ControlToValidate="tb_AdministradorAdministradorDireccion" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ#,./\sáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>
        </div>
        <br />
        <br />
        <div class="form-inline" role="form">

            <div class="form-group">
                <label for="tb_AdministradorTelefono" class="control-label" style="color: #FFFFFF" id="lb_telefono">Telefono :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_AdministradorTelefono" title="Telefono" MaxLength="15" placeholder="Telefono" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_telefono" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorTelefono" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorTelefono" runat="server" ControlToValidate="tb_AdministradorTelefono" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-z0-9ñ\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_AdministradorUsuario" class="control-label" style="color: #FFFFFF">Usuario :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_AdministradorUsuario" MaxLength="20" title="Usuario" placeholder="Usuario" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_usuario" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorUsuario" ValidationGroup="form_ejm3" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorUsuario" runat="server" ControlToValidate="tb_AdministradorUsuario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm3"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="tb_AdministradorContrasenia" class="control-label" style="color: #FFFFFF">Contraseña:</label>
                <asp:TextBox type="text" class="form-control" ID="tb_AdministradorContrasenia" title="Contraseña" placeholder="Contraseña" runat="server" MaxLength="20"></asp:TextBox>
                <asp:TextBox type="text" class="form-control" ID="tb_Vusuario" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox type="text" class="form-control" ID="tb_Vdocumento" runat="server" Visible="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_contrasenia" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_AdministradorContrasenia" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_AdministradorContrasenia" runat="server" ControlToValidate="tb_AdministradorContrasenia" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator><br />
                
            </div>
            <div class="form-group">
                <asp:Button ID="btn_validar" runat="server" Text="Validar Usuario" class="btn btn-success btn-lg" Width="159px" BorderColor="#660033" OnClick="btn_validar_Click" ValidationGroup="form_ejm3" />
            </div>
        </div>

        <br />
        <br />
        <div class="form-inline" role="form">
            <div class="form-group">
                <asp:Label ID="L_ErrorUsuario" class="control-label" Style="color: #F81809" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Large"></asp:Label>
                <asp:Label ID="L_OkUsuario" class="control-label" Style="color: #09F831" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Large"></asp:Label>
            </div>
        </div>
        <br />
        <br />
        <div class="form-inline container">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btn_AdministradorAceptar" runat="server" Text="Agregar" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" OnClick="btn_AdministradorAceptar_Click2" ValidationGroup="form_ejm" Visible="False" />
            <asp:Button ID="btn_EstudianteNuevo" runat="server" class="btn btn-info btn-lg" Width="141px" BorderColor="#660033" Text="Nuevo" OnClick="btn_AdministradorNuevo_Click" Visible="False" />
        </div>
    </div>
</asp:Content>



