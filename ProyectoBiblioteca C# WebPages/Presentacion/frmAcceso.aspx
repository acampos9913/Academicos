<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAcceso.aspx.cs" Inherits="Presentacion.frmAcceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
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

        <div class="form-signin-heading" style="font-family:'Times New Roman'">Ingreso a la Intranet</div>
        <p align="center">
            <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor="Red"></asp:Label></p>

        <asp:TextBox class="form-control" ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
        <div class="Spacioador"></div>
        <asp:TextBox class="form-control" ID="txtPassword" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
        <label class="checkbox">
            <input type="checkbox" value="Recordando" name="Recordar" />Recordar acceso</label>
        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />

        <div class="Spacioador"></div>
        <a href="#">
            <div class="Spacioador">Olvidaste tu contraseña</div>
        </a>
    </form>
    <p align="center">Para Poder Reservar Libros Necesitas <a href="RegistrarUsuario.aspx">Registrarte</a></p>
</body>
</html>
