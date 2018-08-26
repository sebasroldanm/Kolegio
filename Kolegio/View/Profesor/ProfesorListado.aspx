<%@ Page Title="" Language="C#" MasterPageFile="~/View/Profesor/MasterProfesor.master" AutoEventWireup="true" CodeFile="~/Controller/Profesor/ProfesorListado.aspx.cs" Inherits="View_Profesor_ProfesorListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="text-center">
            <h3><span class="label label-info">Lista de Estudiantes</span></h3>
        </div>
    </div>
    <div class="container">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
        <asp:TextBox ID="tb_documentoestudiante" runat="server" class="form-control" title="Numero de Documento" placeholder="Numero de Documento" Width="202px" OnTextChanged="tb_documentoestudiante_TextChanged" MaxLength="12"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFV_documentoestudiante" runat="server" ControlToValidate="tb_documentoestudiante" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="REV_documentoestudiante" runat="server" ControlToValidate="tb_documentoestudiante" ErrorMessage="Digitar Solo Números" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:TextBox ID="TB_Observ" runat="server" class="form-control" title="Observacion" placeholder="Observacion" Width="734px" Height="110px" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFV_Observ" runat="server" ControlToValidate="TB_Observ" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="REV_Observ" runat="server" ControlToValidate="TB_Observ" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-z0-9ñÑ,.\s]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    &nbsp;<asp:Button ID="btn_Aceptar" runat="server" Text="Agregar Observacion" class="btn btn-success btn-lg" Width="205px" BorderColor="#660033" OnClick="btn_AdministradorAceptar_Click2" />

        <br />
        <br />

        <asp:GridView ID="GridView1" CssClass="table table-bordered bs-table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataSourceID="ODS_Observador" AllowPaging="True" PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="fecha_observacion" HeaderText="Fecha y Hora" />
                <asp:BoundField DataField="observacion" HeaderText="Observacion" />
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


        <asp:ObjectDataSource ID="ODS_Observador" runat="server" SelectMethod="listarObservador" TypeName="DaoUser">
            <SelectParameters>
                <asp:SessionParameter Name="dat" SessionField="id" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

</asp:Content>

