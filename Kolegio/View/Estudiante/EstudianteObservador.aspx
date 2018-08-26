<%@ Page Title="" Language="C#" MasterPageFile="~/View/Estudiante/MasterEstudiante.master" AutoEventWireup="true" CodeFile="~/Controller/Estudiante/EstudianteObservador.aspx.cs" Inherits="View_Estudiante_EstudianteObservador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-info">Observador - Certificado</span></h3>
        </div>
        <asp:Button ID="btn_descargar" runat="server" Text="Descargar Certificado" class="btn btn-success btn-lg" Width="222px" BorderColor="#660033" OnClick="btn_descargar_Click" />

        <asp:GridView ID="GridView1" CssClass="table table-bordered bs-table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ODS_Observador">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="fecha_observacion" HeaderText="Dia-Hora " />
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
                <asp:SessionParameter Name="dat" SessionField="userId" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>
</asp:Content>

