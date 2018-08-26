<%@ Page Title="" Language="C#" MasterPageFile="~/View/Acudiente/MasterAcudiente.master" AutoEventWireup="true" CodeFile="~/Controller/Acudiente/AcudienteObservador.aspx.cs" Inherits="View_Acudiente_AcudienteObservador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <label for="curso" class="control-label" style="color: #FFFFFF">Estudiante :</label>
        <asp:DropDownList ID="DDT_estudiante" runat="server" Class="form-control" DataSourceID="ODS_Estudiante" DataTextField="nombre_usua" DataValueField="id_usua" AutoPostBack="True">
            <asp:ListItem Value="0"></asp:ListItem>
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ODS_Estudiante" runat="server" SelectMethod="listarEstAcudiente" TypeName="DaoUser">
            <SelectParameters>
                <asp:SessionParameter Name="usu" SessionField="userId" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="False" BackColor="White" BorderColor="#660033" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" PageSize="3" DataSourceID="ODS_Boletin" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="fecha_observacion" HeaderText="Fecha - Hora" />
                <asp:BoundField DataField="observacion" HeaderText="Observacion" />
            </Columns>
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
        <asp:ObjectDataSource ID="ODS_Boletin" runat="server" SelectMethod="listarObservador" TypeName="DaoUser">
            <SelectParameters>
                <asp:SessionParameter Name="dat" SessionField="est" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

