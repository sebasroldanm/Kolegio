<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/SubMasterProfesor.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/ListarProfesor.aspx.cs" Inherits="View_Admin_ListarProfesor" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container">
    <div class="text-center">
             <h3><span class="label label-danger">Lista de Profesores</span></h3>
         <br />
         </div>
    </div>
    <div class="container">
                  <asp:Button ID="btn_descargar" runat="server" Text="Descargar Lista" class="btn btn-success btn-lg" Width="222px" BorderColor="#660033" OnClick="btn_descargar_Click"/>


    <asp:GridView ID="GridView1" runat="server"  CssClass="table table-bordered bs-table" AutoGenerateColumns="False" DataSourceID="DAOdocen" BackColor="White" BorderColor="#660033" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AllowPaging="True" PageSize="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#F7F7F7" BorderColor="#0677D2" />
        <Columns>
            <asp:ImageField DataImageUrlField="foto_usua" HeaderText="Foto">
             <ControlStyle Height="100px" Width="90px" />
            </asp:ImageField>
            <asp:BoundField DataField="apellido_usua" HeaderText="Apellido" />
            <asp:BoundField DataField="nombre_usua" HeaderText="Nombre" >
            <ControlStyle Font-Size="Large" />
            </asp:BoundField>
            <asp:BoundField DataField="num_documento" HeaderText="Documento" />
            <asp:BoundField DataField="estado" HeaderText="Estado" />
            <asp:BoundField DataField="correo" HeaderText="Correo" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" />
            <asp:BoundField DataField="user_name" HeaderText="Usuario" />
            <asp:BoundField DataField="clave" HeaderText="Contraseña" />
            <asp:CommandField HeaderImageUrl="~/Imagenes/edituser2.png" HeaderText="Editar" SelectImageUrl="~/Imagenes/edituser2.png" SelectText="Editar" ShowSelectButton="True" UpdateImageUrl="~/Imagenes/edituser2.png" />
        </Columns>
        <EmptyDataTemplate>
            <br />
&nbsp;
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>


    <asp:ObjectDataSource ID="DAOdocen" runat="server" SelectMethod="listardocente" TypeName="DaoUser"></asp:ObjectDataSource>
</div>

    </asp:Content>