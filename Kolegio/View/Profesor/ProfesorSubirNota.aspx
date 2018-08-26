<%@ Page Title="" Language="C#" MasterPageFile="~/View/Profesor/MasterProfesor.master" AutoEventWireup="true" CodeFile="~/Controller/Profesor/ProfesorSubirNota.aspx.cs" Inherits="View_Profesor_ProfesorSubirNota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            padding: 15px;
            left: 0px;
            top: 0px;
            width: 527px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-info">Subir Nota</span></h3>
        </div>
    </div>
    <div class="panel-img" style="margin: -100px 0px 0px 215px;">
        <img src="../../Imagenes/Panel.png" />
    </div>

    <div style="position: absolute; z-index: 1">
        <div class="auto-style1" style="margin: -535px 0px 0px 300px;">
            <div class="form-group">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                <br />
                <br />
                <div class="form-group">
                    <label typeof="text" class="control-label" style="color: #FFFFFF">Curso :</label>
                    <asp:DropDownList ID="ddt_curso" Class="form-control" runat="server" AutoPostBack="True" DataSourceID="ODB_curso" DataTextField="nombre_curso" DataValueField="id_ancu" OnSelectedIndexChanged="ddt_curso_SelectedIndexChanged"></asp:DropDownList>

                    <asp:ObjectDataSource ID="ODB_curso" runat="server" SelectMethod="cursoProfesor" TypeName="DaoUser">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="userId" Name="id_p" SessionField="userId" Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="anio" SessionField="anio" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </div>
                <div class="form-group" >
                    <label typeof="text" class="control-label" style="color: #FFFFFF">Materia :</label>
                    <asp:DropDownList ID="ddl_materia" Class="form-control" runat="server" DataSourceID="ODS_Materia" DataTextField="nombre_materia" DataValueField="id_materia"></asp:DropDownList>

                    <asp:ObjectDataSource ID="ODS_Materia" runat="server" SelectMethod="obtenermateriacurso" TypeName="DaoUser">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddt_curso" Name="Curso" PropertyName="SelectedValue" Type="String" />
                            <asp:SessionParameter Name="Prof" SessionField="userId" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </div>
                    <div class="form-group">
                    <label typeof="text" class="control-label" style="color: #FFFFFF">Alumno :</label>
                    <asp:DropDownList ID="ddl_alumno" Class="form-control" runat="server" DataSourceID="ODS_estudiantes" DataTextField="nombre_usua" DataValueField="id_usua"></asp:DropDownList>

                    <asp:ObjectDataSource ID="ODS_estudiantes" runat="server" SelectMethod="obtenerEstApel" TypeName="DaoUser">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddt_curso" Name="curs" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="form-inline" role="form">
                    <br />
                    <label class="control-label" style="color: #FFFFFF" typeof="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                    &nbsp;<asp:Button ID="ButtonVerNota" runat="server" Text="Ver Notas" class="btn btn-success btn-lg" Width="184px" BorderColor="#660033" OnClick="ButtonVerNota_Click" ValidationGroup="jejeje" />
                    <br />

                    <table class="nav-justified">
                        <tr>
                            <td class="text-center">
                                <label typeof="text" class="control-label" style="color: #FFFFFF">Nota 1: </label>
                                <asp:TextBox ID="tb_nt" runat="server" class="form-control" title="Nota" placeholder="Nota 1" Width="140px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFV_nt" runat="server" ControlToValidate="tb_nt" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="REV_nt" runat="server" ControlToValidate="tb_nt" ErrorMessage="Digitar dos numeros" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator><br />
                                <asp:RangeValidator ID="RV_N1" runat="server" ControlToValidate="tb_nt" CssClass="label-warning" ErrorMessage="Sobrepasó el limite" Font-Bold="True" ForeColor="White" MaximumValue="50" MinimumValue="0"></asp:RangeValidator>
                            </td>
                            <td>
                                <label typeof="text" class="control-label" style="color: #FFFFFF">Nota 2: </label>
                                <asp:TextBox ID="tb_nt2" runat="server" class="form-control" placeholder="Nota 2" title="Nota" Width="140px" MaxLength="2"></asp:TextBox>
                                <div class="text-center">
                                <asp:RequiredFieldValidator ID="RFV_nt2" runat="server" ControlToValidate="tb_nt2" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="REV_nt2" runat="server" ControlToValidate="tb_nt2" ErrorMessage="Digitar dos numeros" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator><br />
                                <asp:RangeValidator ID="RV_n2" runat="server" ControlToValidate="tb_nt2" CssClass="label-warning" ErrorMessage="Sobrepasó el limite" Font-Bold="True" ForeColor="White" MaximumValue="50" MinimumValue="0"></asp:RangeValidator>
                                </div>
                            </td>
                            <td class="text-center">
                                <label typeof="text" class="control-label" style="color: #FFFFFF">Nota 3: </label>
                                <asp:TextBox ID="tb_nt3" runat="server" class="form-control" placeholder="Nota 3" title="Nota" Width="140px" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_nt3" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_nt3" ErrorMessage="Digitar dos numeros" ValidationExpression="^[0-9]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator><br />
                                <asp:RangeValidator ID="RV_n3" runat="server" ControlToValidate="tb_nt3" CssClass="label-warning" ErrorMessage="Sobrepasó el limite" Font-Bold="True" ForeColor="White" MaximumValue="50" MinimumValue="0"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="3">

                                <label typeof="text" class="control-label" style="color: #FFFFFF">Nota Definitiva: </label>
                                <div class="text-center">
                                    <asp:TextBox ID="tb_denifitiva" runat="server" class="form-control" placeholder="Nota Definitiva" title="Nota Definitiva" Width="140px" Enabled="false"></asp:TextBox>
                                </div>
                                <br />


                            </td>
                        </tr>
                    </table>

                    <div class="form-inline" role="form">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </div>
                    <div class="form-inline" role="form">
                    </div>

                    <div class="form-inline">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_Subirnota" runat="server" Text="Subir Calificacion" class="btn btn-success btn-lg" Width="184px" BorderColor="#660033" OnClick="btn_Subirnota_Click" />
                        &nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

