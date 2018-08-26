<%@ Page Title="" Language="C#" MasterPageFile="~/View/Estudiante/MasterEstudiante.master" AutoEventWireup="true" CodeFile="~/Controller/Estudiante/EstudianteVernotas.aspx.cs" Inherits="View_Estudiante_EstudianteVernotas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="text-center">
            <h3><span class="label label-info">Ver Notas </span></h3>
        </div>

        <br />
        <br />

        <asp:GridView ID="GV_boletin" runat="server" CssClass="table table-bordered bs-table" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="False" DataSourceID="ODS_Boletin" OnSelectedIndexChanged="GV_boletin_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="nombre_materia" HeaderText="Materia" />
                <asp:BoundField DataField="nota1" HeaderText="Primer Periodo" />
                <asp:BoundField DataField="nota2" HeaderText="Segundo Periodo" />
                <asp:BoundField DataField="nota3" HeaderText="Tercer Periodo" />
                <asp:BoundField DataField="notadef" HeaderText="Nota Definitiva" />
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

        <asp:ObjectDataSource ID="ODS_Boletin" runat="server" SelectMethod="obtenerBoletin" TypeName="DaoUser">
            <SelectParameters>
                <asp:SessionParameter Name="usu" SessionField="userId" Type="String" />
                <asp:SessionParameter Name="ancu" SessionField="anio" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>

</asp:Content>

