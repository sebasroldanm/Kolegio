<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/SubMasterEstudiante.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/EditarEliminarEstudiante.aspx.cs" Inherits="View_Admin_EditarEliminarEstudiante" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Editar Estudiante</span></h3>
            <br />
        </div>
    </div>
    <div class="modal-body" style="margin: 0% 0% 0% 10%">

        <div class="form-inline" role="form">
            <div class="form-group">
                <label for="tb_EstudianteId" class="control-label" style="color: #FFFFFF">Numero de Documento :</label>
                <asp:TextBox ID="tb_EstudianteId" runat="server" class="form-control" title="Numero de Documento" placeholder="Numero de Documento" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV_id" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteId" ValidationGroup="form_ejm" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_id" runat="server" ControlToValidate="tb_EstudianteId" ErrorMessage="Digite solo números" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                <asp:Label ID="L_ErrorEstudiante" class="control-label" Style="color: crimson" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

            </div>

            <div class="form-group">
                <label for="tb_EstudianteNombre" class="control-label" style="color: #FFFFFF">Nombres :</label>
                <asp:TextBox ID="tb_EstudianteNombre" runat="server" class="form-control" title="Nombres Estudiante" placeholder="Nombres Estudiante" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteNombre" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteNombre" runat="server" ControlToValidate="tb_EstudianteNombre" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñÑ\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="tb_EstudianteApellido" class="control-label" style="color: #FFFFFF">Apellidos :</label>
                <asp:TextBox ID="tb_EstudianteApellido" runat="server" class="form-control" title="Apellidos Administrador" placeholder="Apellidos Estudiante" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteApellido" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteApellido" runat="server" ControlToValidate="tb_EstudianteApellido" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñÑ\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
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
                <label for="tb_EstudianteCorreo" class="control-label" style="color: #FFFFFF">Correo :</label>
                <asp:TextBox type="email" runat="server" class="form-control" ID="tb_EstudianteCorreo" title="Direccion de Correo" placeholder="Direccion de Correo" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteCorreo" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="tb_EstudianteDireccion" class="control-label" style="color: #FFFFFF">Direccion :</label>
                <asp:TextBox type="text" runat="server" class="form-control" ID="tb_EstudianteDireccion" title="Direccion" placeholder="Direccion" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteDireccion" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator>

            </div>
        </div>
        <br />
        <br />
        <div class="form-inline" role="form">

            <div class="form-group">
                <label for="tb_EstudianteTelefono" class="control-label" style="color: #FFFFFF">Telefono :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_EstudianteTelefono" title="Telefono" placeholder="Telefono" runat="server" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteTelefono" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteTelefono" runat="server" ControlToValidate="tb_EstudianteTelefono" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="tb_EstudianteUsuario" class="control-label" style="color: #FFFFFF">Nombre de Usuario :</label>
                <asp:TextBox type="text" class="form-control" ID="tb_EstudianteUsuario" title="Usuario" placeholder="Usuario" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteUsuario" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteUsuario" runat="server" ControlToValidate="tb_EstudianteUsuario" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="tb_EstudianteContrasenia" class="control-label" style="color: #FFFFFF">Contraseña:</label>
                <asp:TextBox type="text" class="form-control" ID="tb_EstudianteContrasenia" title="Contraseña" placeholder="Contraseña" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo Obligatorio" ControlToValidate="tb_EstudianteContrasenia" ValidationGroup="form_ejm2" ForeColor="Red" Font-Size="X-Large">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="REV_EstudianteContrasenia" runat="server" ControlToValidate="tb_EstudianteContrasenia" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="estado" class="control-label" style="color: #FFFFFF">Estado :</label>
                <select class="form-control" id="estado">
                    <option>Activo</option>
                    <option>Inactivo</option>
                </select>
            </div>
        </div>
        <br />
        <br />
        <div class="form-inline container">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

             <asp:Button ID="btn_EstudianteAceptar" runat="server" Text="Aceptar" class="btn btn-success btn-lg" Width="141px" BorderColor="#660033" OnClick="btn_AdministradorAceptar_Click" ValidationGroup="form_ejm" />
            <asp:Button ID="btn_EstudianteEditar" runat="server" Text="Editar" class="btn btn-primary btn-lg" Width="141px" BorderColor="#660033" OnClick="btn_AdministradorEdditar_Click" Visible="False" ValidationGroup="form_ejm2" />
            <asp:Label ID="L_Error" runat="server" CssClass="label-danger" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
            <asp:Button ID="btn_EstudianteNuevo" runat="server" class="btn btn-info btn-lg" Width="141px" BorderColor="#660033" Text="Nuevo" OnClick="btn_AdministradorNuevo_Click" Visible="False" />

        </div>
    </div>
</asp:Content>

