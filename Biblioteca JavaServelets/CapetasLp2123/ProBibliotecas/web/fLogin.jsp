<%-- 
    Document   : Login
    Created on : 16-jul-2014, 5:27:12
    Author     : Administrador
--%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Inicar Sesion</title>
    <link href="Estilos/bootstrap.min.css" rel="stylesheet">
    <link href="Estilos/cssIniciarSesion.css" rel="stylesheet">
    <link href="Estilos/jquery-ui.css" rel="stylesheet">
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <style type="text/css">
    .Spacioador {
	position: relative;
	width: auto;
	height:20px;
	z-index: 1;
}
    </style>
  </head>
  <body>
      <%
        String Usuario="";
        Cookie[] miCpkie=request.getCookies();
      if(miCpkie!=null){
        for(int i=0;i<miCpkie.length;i++){
            Cookie miCo=miCpkie[i];
            if(miCo.getName().equals("Sesion")){
                Usuario=miCo.getValue();
            }
        }
      }
      
      if(request.getParameter("Incorrecto")!=null){
      out.print("<script>alert('Datos incorrectos')</script>");
      }
      
      %>
      <form action="sVerificarAcceso" class="form-signin" role="form">
        <div class="form-signin-heading">Acceso</div>
        <input type="text" class="form-control" name="txtUsuario"placeholder="Usuario" required autofocus value="<%=Usuario%>">
        <div class="Spacioador"></div>
        <input type="password" class="form-control" name="txtPassword" placeholder="Contraseña" required>
        <label class="checkbox">
            <input type="checkbox" value="Recordando" name="Recordar">Recordar acceso</label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="btnIngresar">Ingresar</button>
        <div class="Spacioador"></div>
        <a href="recuperarpass.jsp"><div class="Spacioador">Olvidaste tu contraseña</div></a>
        
        
      </form>  
      <p align="center">Para Poder Reservar Libros Necesitas Registrarte  <a href="Registrarse.jsp">Registrate</a></p>
  </body>
</html>