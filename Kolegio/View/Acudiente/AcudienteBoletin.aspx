<%@ Page Title="" Language="C#" MasterPageFile="~/View/Acudiente/MasterAcudiente.master" AutoEventWireup="true" CodeFile="~/Controller/Acudiente/AcudienteBoletin.aspx.cs" Inherits="View_Acudiente_AcudienteBoletin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
          .auto-style1 {
              position: relative;
              padding: 15px;
              left: -240px;
              top: -13px;
              width: 344px;
          }
          .auto-style2 {
              display: block;
              width: 62%;
              height: 34px;
              padding: 6px 12px;
              font-size: 14px;
              line-height: 1.42857143;
              color: #555;
              background-color: #fff;
              background-image: none;
              border: 1px solid #ccc;
              border-radius: 4px;
              -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
              box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
              -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
              -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
              transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          }
          .auto-style3 {
              position: relative;
              min-height: 1px;
              float: left;
              width: 100%;
              left: 2px;
              top: 10px;
              padding-left: 15px;
              padding-right: 15px;
          }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container">
             <div class="text-center">
             <h3><span class="label label-info">Ver Notas - Boletin</span></h3>
             </div>
    </div>
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
    <asp:GridView ID="GridView1" runat="server"  CssClass="table table-bordered bs-table" AutoGenerateColumns="False" BackColor="White" BorderColor="#660033" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"  PageSize="3" DataSourceID="ODS_Boletin">
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
                 <asp:SessionParameter Name="usu" SessionField="est" Type="String" />
                 <asp:SessionParameter DefaultValue="ani" Name="ancu" SessionField="anio" Type="String" />
             </SelectParameters>
         </asp:ObjectDataSource>
    </div>
</asp:Content>

