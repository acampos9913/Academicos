<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="Presentacion.RegistrarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Inicar Sesion</title>
    <link href="Estilos/bootstrap.min.css" rel="stylesheet" />
    <link href="Estilos/cssIniciarSesion.css" rel="stylesheet" />
    <link href="Estilos/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <style type="text/css">
        .Spacioador {
            position: relative;
            width: auto;
            height: 20px;
            z-index: 1;
            top: 0px;
            left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-signin" role="form">

        <div class="form-signin-heading" style="font-family:'Times New Roman'">Registrate</div>
        <p align="center">
            <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Red"></asp:Label></p>

        <asp:TextBox class="form-control" ID="txtNombres" runat="server" placeholder="Nombres"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtApellidos" runat="server" placeholder="Apellidos"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtDni" runat="server" placeholder="DNI"></asp:TextBox>
        <div class="Spacioador"></div>

        <asp:TextBox class="form-control" ID="txtTelefono" runat="server" placeholder="Telefono"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtDireccion" runat="server" placeholder="Dirección"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtCorreo" runat="server" placeholder="Correo"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtPassword" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnIngresar" runat="server" Text="Registrar" OnClick="btnIngresar_Click" />
    </form>
    <p align="center">Para poder acceder haga clic en <a href="frmAcceso.aspx">Login</a></p>
</body>
</html>
