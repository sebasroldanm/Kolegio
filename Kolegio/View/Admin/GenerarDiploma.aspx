<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Admin/GenerarDiploma.aspx.cs" Inherits="View_Admin_GenerarDiploma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Descargar Certificado</title>

    <link href="../../Bootstrap/css2/bootstrap.css" rel="stylesheet" />
  <link href="../../Bootstrap/css2/bootstrap-theme.css" rel="stylesheet" />
  <script src="../../Bootstrap/js2/bootstrap.js" type="text/javascript"></script>
      <link href="../../Bootstrap/Mio/fondoprofesor.css" rel="stylesheet" />

     <link href="../../Bootstrap/Mio/submenumaster.css" rel="stylesheet" />


    <style type="text/css">
        .auto-style3 {
            width: 668px;
        }
        .auto-style5 {
            width: 668px;
            height: 16px;
        }
        .auto-style8 {
            width: 668px;
            height: 30px;
        }
        .auto-style9 {
            width: 763px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        
          <div class="text-center">
             <h3><span class="label label-danger">Diploma Estudiante</span></h3>
         <br />
              </div>

        <table class="nav-justified">

            <tr>
                <td class="auto-style8" colspan="2">
                    AÑO:</td>
                <td class="auto-style8">
                    &nbsp;</td>
                <td colspan="13" rowspan="10">&nbsp;</td>
            </tr>

            <tr>
                <td class="auto-style8" colspan="2">
                    <asp:DropDownList ID="DropDownList1" Class="form-control" runat="server" DataSourceID="ODS_anio" DataTextField="nombre_anio" DataValueField="id_anio" Width="130px" AutoPostBack="True">

                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ODS_anio" runat="server" SelectMethod="obtenertodosAnio" TypeName="DaoUser"></asp:ObjectDataSource>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">CURSO:</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">
             <asp:DropDownList ID="ddt_anio" Class="form-control" runat="server" DataSourceID="ODS_curso" DataTextField="nombre_curso" DataValueField="id_ancu" AutoPostBack="True" Width="132px"></asp:DropDownList>

                    <asp:ObjectDataSource ID="ODS_curso" runat="server" SelectMethod="obtenerCursoanio" TypeName="DaoUser" OnSelecting="ODS_curso_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="anio" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="False" DataSourceID="ODS_estudiante" BackColor="White" BorderColor="#660033" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="3">
                <AlternatingRowStyle BackColor="#F7F7F7" BorderColor="#0677D2" />
                <Columns>
                    <asp:ImageField DataImageUrlField="foto_usua" HeaderText="Foto ">
                        <ControlStyle Height="100px" Width="90px" />
                        <HeaderStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                    </asp:ImageField>
                    <asp:BoundField DataField="apellido_usua" HeaderText="Apellido" />
                    <asp:BoundField DataField="nombre_usua" HeaderText="Nombre">
                        <ControlStyle Font-Size="Large" />
                    </asp:BoundField>
                    <asp:BoundField DataField="num_documento" HeaderText="Documento" />
                    <asp:BoundField DataField="correo" HeaderText="Correo" />
                    <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                    <asp:BoundField DataField="user_name" HeaderText="Usuario" />
                    <asp:BoundField DataField="clave" HeaderText="Contraseña" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <%# Convert.ToBoolean(Eval("estado")) ? "Activo" : "Inactivo" %>
                        </ItemTemplate>
                    </asp:TemplateField>
               <asp:CommandField SelectText="Descargar " ShowSelectButton="True" HeaderText="Diploma" />

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


                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">
                    <asp:ObjectDataSource ID="ODS_estudiante" runat="server" SelectMethod="gEstudiante" TypeName="DaoUser">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddt_anio" Name="curs" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>


                </td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        

    
    
    


    </form>







</body>



   
</html>
