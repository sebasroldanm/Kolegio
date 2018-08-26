<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/SubMasterEstudiante.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/AgregarEstudiante.aspx.cs" Inherits="View_Admin_AgregarEstudiante" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Agregar Estudiante</span></h3>
            <br />
        </div>
    </div>
    <div class="modal-body" style="margin: 0% 0% 0% 10%">

        <div class="form-inline" role="form">

            <div class="form-group">
                <label for="tb_AcudienteId" class="control-label" style="color: #FFFFFF">Numero de Documento Acudiente :</label>
                <asp:TextBox ID="tb_AcudienteId" runat="server" class="form-control" title="Numero de Documento" placeholder="Numero de Documento" MaxLength="10"></asp:TextBox>
                <asp:Button ID="btn_buscarAcudiente" runat="server" Text="Buscar" class="btn btn-primary btn-lg" Width="113px" BorderColor="#660033" OnClick="btn_buscarAcudiente_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <asp:RegularExpressionValidator ID="REV_AcudienteId" runat="server" ControlToValidate="tb_AcudienteId" ErrorMessage="Digitar solo números" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                <asp:Label ID="L_ErrorAcudiente" class="control-label" Style="color: #FFFFFF" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

            </div>
        </div>
        <br />

        <div class="form-inline" role="form">
            <div class="form-group">

                <label for="tb_AcudienteNombre" class="control-label" style="color: #FFFFFF">Nombre Acudiente :</label>
                <asp:TextBox ID="tb_AcudienteNombre" runat="server" class="form-control" title="Nombre Acudiente" placeholder="Nombre Acudiente" MaxLength="30"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="REV_AcudienteNombre" runat="server" ControlToValidate="tb_AcudienteNombre" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-ZñÑ\sáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">

                <label for="tb_AcudienteApellido" class="control-label" style="color: #FFFFFF">Apellido Acudiente :</label>
                <asp:TextBox ID="tb_AcudienteApellido" runat="server" class="form-control" title="Apellido Estudiante" placeholder="Apellido Estudiante" MaxLength="30"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="REV_AcudienteApellido" runat="server" ControlToValidate="tb_AcudienteApellido" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-ZñÑ\sáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                <asp:TextBox ID="tb_id_estacu" runat="server" class="form-control" title="id estudiante" placeholder="id estudiante" Visible="False"></asp:TextBox>
                <asp:Label ID="L_ErrorUser" class="control-label" Style="color: #F81809" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Large"></asp:Label>
                <asp:Label ID="L_OkUsuario" class="control-label" Style="color: #09F831" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Large"></asp:Label>
            </div>
        </div>
        <br />


        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_EstudianteId" class="control-label" style="color: #FFFFFF">Numero de Documento :</label>
                <asp:TextBox ID="tb_EstudianteId" runat="server" class="form-control" title="Numero de Documento" MaxLength="10" placeholder="Numero de Documento"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteId" ID="RequiredFieldValidator6" ValidationGroup="form_ejm3" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteId" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteId" runat="server" ControlToValidate="tb_EstudianteId" ErrorMessage="Digitar solo números" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm3"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="tb_EstudianteNombre" class="control-label" style="color: #FFFFFF">Nombres :</label>
                <asp:TextBox ID="tb_EstudianteNombre" runat="server" class="form-control" title="Nombres Estudiante" MaxLength="30" placeholder="Nombres Estudiante"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteNombre" ID="RequiredFieldValidator1" ValidationGroup="form_ejm" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteNombre" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteNombre" runat="server" ControlToValidate="tb_EstudianteNombre" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z\sñÑáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="tb_EstudianteApellido" class="control-label" style="color: #FFFFFF">Apellidos :</label>
                <asp:TextBox ID="tb_EstudianteApellido" runat="server" class="form-control" title="Apellidos Administrador" MaxLength="30" placeholder="Apellidos Estudiante"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteApellido" ID="RequiredFieldValidator2" ValidationGroup="form_ejm" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteApellido" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteApellido" runat="server" ControlToValidate="tb_EstudianteApellido" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z\sñÑáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>
        </div>
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
                <label for="tb_Foto" class="control-label" style="color: #FFFFFF">Foto :</label>
                <asp:FileUpload ID="tb_Foto" runat="server" accept=".jpg,.png" class="form-control" ErrorMessage="Solo Imagenes" ValidationExpression="(.*).(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.bmp|.BMP|.png|.PNG)$" Width="240px" />
                <asp:RequiredFieldValidator ID="RV_foto" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_Foto" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                <label for="fechanac" class="control-label" style="color: #FFFFFF">Fecha Nacimiento:</label>
                <asp:TextBox ID="fechanac" runat="server" class="form-control" title="Fecha de Nacimiento" placeholder="Fecha de Nacimiento"></asp:TextBox>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MMMM/yyyy" PopupButtonID="btnigm_calendar" PopupPosition="BottomRight" TargetControlID="fechanac" />

            </div>

            <div class="form-group">

                <asp:ImageButton ID="btnigm_calendar" runat="server" ImageUrl="~/Imagenes/calendario 3030.png" />
            </div>
        </div>
        <br />
        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_EstudianteCorreo" class="control-label" style="color: #FFFFFF">Correo :</label>
                <asp:TextBox type="email" runat="server" MaxLength="50" class="form-control" ID="tb_EstudianteCorreo" title="Direccion de Correo" placeholder="Direccion de Correo" Width="400px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteCorreo" ID="RequiredFieldValidator3" ValidationGroup="form_ejm" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteCorreo" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteCorreo" runat="server" ControlToValidate="tb_EstudianteCorreo" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ_@./]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_EstudianteDireccion" class="control-label" style="color: #FFFFFF">Direccion :</label>
                <asp:TextBox type="text" runat="server" class="form-control" ID="tb_EstudianteDireccion" MaxLength="50" title="Direccion" placeholder="Direccion" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteDireccion" ID="RequiredFieldValidator4" ValidationGroup="form_ejm" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteDireccion" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteDireccion" runat="server" ControlToValidate="tb_EstudianteDireccion" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ#,./\sáéíóú]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
            </div>
        </div>
        <br />
        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_EstudianteTelefono" class="control-label" style="color: #FFFFFF">Telefono :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_EstudianteTelefono" title="Telefono" placeholder="Telefono" MaxLength="15" runat="server" TextMode="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteTelefono" ID="RequiredFieldValidator5" ValidationGroup="form_ejm" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteTelefono" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <%--<asp:RegularExpressionValidator ID="REV_EstudianteTelefono" runat="server" ControlToValidate="tb_EstudianteTelefono" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^a-z0-9()+\s]+$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>--%>
            </div>
            <div class="form-group">
                <label for="tb_EstudianteUsuario" class="control-label" style="color: #FFFFFF">Nombre de Usuario :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_EstudianteUsuario" title="Usuario" placeholder="Usuario" MaxLength="20" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteUsuario" ID="RequiredFieldValidator7" ValidationGroup="form_ejm3" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteUsuario" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteUsuario" runat="server" ControlToValidate="tb_EstudianteUsuario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RV_fechaNac" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="fechanac" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="tb_EstudianteContrasenia" class="control-label" style="color: #FFFFFF">Contraseña:</label>
                <asp:TextBox type="text" class="form-control" ID="tb_EstudianteContrasenia" title="Contraseña" placeholder="Contraseña" MaxLength="20" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator for="tb_EstudianteContrasenia" ID="RequiredFieldValidator8" ValidationGroup="form_ejm" runat="server" ErrorMessage="*" ControlToValidate="tb_EstudianteContrasenia" SetFocusOnError="True" Font-Bold="True" ForeColor="#FC2424" ToolTip="El campo es obligatorio" Font-Size="X-Large"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteContrasenia" runat="server" ControlToValidate="tb_EstudianteContrasenia" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White" ValidationGroup="form_ejm"></asp:RegularExpressionValidator>
                <asp:TextBox type="text" class="form-control" ID="tb_Vusuario" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox type="text" class="form-control" ID="tb_Vdocumento" runat="server" Visible="False"></asp:TextBox>
                
            </div>
            <div class="form-group">
                <asp:Button ID="btn_validar" runat="server" Text="Validar Usuario" class="btn btn-success btn-lg" Width="159px" BorderColor="#660033" OnClick="btn_validar_Click" ValidationGroup="form_ejm3" />
            </div>
        </div>

        <div class="form-group">
            <br />
            <asp:Label ID="L_ErrorUsuario" class="control-label" Style="color: #FFFFFF" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </div>
        <div class="form-inline container">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btn_EstudianteAceptar" runat="server" Text="Agregar" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" OnClick="btn_AdministradorAceptar_Click2" ValidationGroup="form_ejm" Visible="False" />
            <asp:Button ID="btn_EstudianteNuevo" runat="server" class="btn btn-info btn-lg" Width="141px" BorderColor="#660033" Text="Nuevo" OnClick="btn_EstudianteNuevo_Click" Visible="False" />
        </div>
    </div>
</asp:Content>


