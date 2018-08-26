<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/SubMasterCurso.master" AutoEventWireup="true" CodeFile="~/Controller/Admin/AgregarEstudiantesCurso.aspx.cs" Inherits="View_Admin_AgregarEstudiantesCurso" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="text-center">
            <h3><span class="label label-danger">Agregar Estudiantes a un Curso</span></h3>
            <br />
        </div>
    </div>
    <div class="modal-body" style="margin: 0% 0% 0% 10%">

        <label for="ddt_anio" class="control-label" style="color: #FFFFFF">Año :</label>
        <br />
        <asp:DropDownList ID="ddt_anio" Class="form-control" runat="server" DataSourceID="ODS_anio" DataTextField="nombre_anio" DataValueField="id_anio" AutoPostBack="True" Width="132px"></asp:DropDownList>

        <asp:ObjectDataSource ID="ODS_anio" runat="server" SelectMethod="obtenerAnio" TypeName="DaoUser"></asp:ObjectDataSource>

        <label for="ddt_curso" class="control-label" style="color: #FFFFFF">Curso :</label>
        <br />
        <asp:DropDownList ID="ddt_curso" Class="form-control" runat="server" DataSourceID="ODS_Cur" DataTextField="nombre_curso" DataValueField="id_ancu" AutoPostBack="True" Width="130px"></asp:DropDownList>

        <asp:ObjectDataSource ID="ODS_Cur" runat="server" SelectMethod="obtenerCursoanio" TypeName="DaoUser">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddt_anio" Name="anio" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:Label ID="L_ErrorUsuario" class="control-label" Style="color: #F81809" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Large"></asp:Label>
        <asp:Label ID="L_OkUsuario" class="control-label" Style="color: #09F831" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Large"></asp:Label>

        <asp:GridView ID="GridView1" CssClass="table table-bordered bs-table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ODS_notcurso" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Documento">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("num_documento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("num_documento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="nombre_usua" HeaderText="Nombre" />
                <asp:BoundField DataField="apellido_usua" HeaderText="Apellido" />
                <asp:TemplateField HeaderText="Agregar Curso">
                    <ItemTemplate>
                        <asp:CheckBox ID="CBest" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

        <asp:ObjectDataSource ID="ODS_notcurso" runat="server" SelectMethod="listaestsincurso" TypeName="DaoUser"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ODS_estudiante" runat="server"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ODS_estsincur" runat="server"></asp:ObjectDataSource>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btn_Aceptar" runat="server" Text="Agregar al Curso" class="btn btn-success btn-lg" Width="203px" BorderColor="#660033" OnClick="btn_Aceptar_Click" />

    </div>

</asp:Content>