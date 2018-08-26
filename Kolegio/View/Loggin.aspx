<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Loggin.aspx.cs" Inherits="Loggin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ingresar</title>

    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Bootstrap/css/Style.css" rel="stylesheet" />
     <link href="../../Bootstrap/Mio/fondoprofesor.css" rel="stylesheet" />
      <link href="../../Bootstrap/css2/bootstrap.css" rel="stylesheet" />
  <link href="../../Bootstrap/css2/bootstrap-theme.css" rel="stylesheet" />
  <script src="../../Bootstrap/js2/bootstrap.js" type="text/javascript"></script>
  <link href="../../Bootstrap/Mio/fondoprofesor.css" rel="stylesheet" />


    <style type="text/css">
        .auto-style1 {
            left: 0;
            top: 0;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            position: relative;
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            -webkit-flex: 1 1 auto;
            left: 55px;
            top: -1px;
            padding: 15px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="text-center">
            <h3><span class="label label-info">Ingreso a la plataforma</span></h3>
        </div>
    </div>
    <img id="fondo" src="../Imagenes/nf1.jpg" alt="background image" class="auto-style1" />
    <form id="Login" runat="server">
        <div class="panel-img">
            <img src="../Imagenes/Panel.png" />
        </div>
        <div style="position: absolute; z-index: 1;" id="layer1">
            <div class="auto-style3" style="margin: -30px 0px 0px 503px;">
                <div class="row">
                    <div class="auto-style2">


                        <div class="form-group">

                            <label for="username" class="control-label label label-info">Usuario</label>
                            <asp:TextBox ID="TB_UserName" runat="server" CssClass="form-control" MaxLength="20" placeholder="Digitar Usuario"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="RVFUserName" runat="server" ControlToValidate="TB_UserName" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="REV_UserName" runat="server" ControlToValidate="TB_UserName" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                            </span>

                        </div>

                        <div class="form-group">

                            <label for="password" class="control-label label label-info">Contraseña</label>
                            <asp:TextBox ID="TB_Clave" runat="server" Type="password" CssClass="form-control" MaxLength="20" placeholder="Digitar Contraseña"></asp:TextBox>
                            <span class="help-block">
                                <asp:RequiredFieldValidator ID="RFV_Clave" runat="server" ControlToValidate="TB_Clave" ErrorMessage="Campo Vacio" CssClass="label-danger" ForeColor="White" Font-Bold="True" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="REV_Clave" runat="server" ControlToValidate="TB_Clave" ErrorMessage="No se aceptan caracteres especiales" ValidationExpression="^[a-zA-Z0-9ñÑ]*$" CssClass="label-warning" Font-Bold="True" ForeColor="White"></asp:RegularExpressionValidator>
                            </span>

                        </div>
                        <asp:Label ID="L_Error" runat="server" Font-Bold="True" CssClass="label-danger" ForeColor="White"></asp:Label>
                        <asp:Button ID="BT_Ingresar" runat="server" Text="Ingresar" CssClass="btn btn-success btn-block" OnClick="BT_Ingresar_Click" />

                        <asp:Button ID="BT_Recuperar" runat="server" Text="Olvido de Contraseña/Usuario" CssClass="btn btn-info btn-block" OnClick="BT_Recuperar_Click" CausesValidation="False" />
                        <asp:Button ID="BT_Salir" runat="server" Text="Salir" CssClass="btn btn-danger btn-block" OnClick="BT_Salir_Click" CausesValidation="False" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
