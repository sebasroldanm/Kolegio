<%@ Page Title="" Language="C#" MasterPageFile="~/View/Profesor/MasterProfesor.master" AutoEventWireup="true" CodeFile="~/Controller/Profesor/ProfesorObservacion.aspx.cs" Inherits="View_Profesor_ProfesorObservacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-info">Lista Estudiantes</span></h3>
        </div>
    </div>
    <div class="modal-body" style="margin: 0% 0% 0% 10%">
        <div class="form-group">
            <label for="ddt_curso" class="control-label" style="color: #FFFFFF"></label>
            <br />
            <br />
            <br />
            <br />
        </div>
        <div class="form-inline" role="form">
            <label for="ddt_curso" class="control-label" style="color: #FFFFFF">Curso :</label>
            <asp:DropDownList ID="ddt_curso" Class="form-control" runat="server" AutoPostBack="True" DataSourceID="ODS_curs" DataTextField="nombre_curso" DataValueField="id_ancu" OnSelectedIndexChanged="ddt_curso_SelectedIndexChanged"></asp:DropDownList>

            <asp:ObjectDataSource ID="ODS_curs" runat="server" SelectMethod="cursoProfesor" TypeName="DaoUser">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="userId" Name="id_p" SessionField="userId" Type="String" />
                    <asp:SessionParameter DefaultValue="" Name="anio" SessionField="anio" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>
        <div class="form-inline" role="form">
            <asp:GridView ID="GridView2" CssClass="table table-bordered bs-table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="ODS_Estudiante" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="num_documento" HeaderText="Documento" />
                    <asp:BoundField DataField="apellido_usua" HeaderText="Apellido" />
                    <asp:BoundField DataField="nombre_usua" HeaderText="Nombre" />
                    <asp:CommandField HeaderText="Observador" ShowSelectButton="True" />
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

            <asp:ObjectDataSource ID="ODS_Estudiante" runat="server" SelectMethod="gEstudiante" TypeName="DaoUser">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddt_curso" Name="curs" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>

        </div>

        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>

</asp:Content>

