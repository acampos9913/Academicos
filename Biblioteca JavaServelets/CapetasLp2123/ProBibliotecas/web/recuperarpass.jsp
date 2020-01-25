<%-- 
    Document   : recuperarpass
    Created on : 18-jul-2014, 4:41:00
    Author     : Administrador
--%>

<%@page import="PaqueteMensaje.Mensaje"%>
<%@page import="paqueteDatos.datUsuario"%>
<%@page import="paqueteNegocio.negUsuario"%>
<%@page import="PaqueteEntidades.entUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Estilos/bootstrap.min.css" rel="stylesheet">
        <style>
            body{
                background-color: #737373;
                margin: 0;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <%if(request.getParameter("btnEnviar")!=null){
            String Email = request.getParameter("txtEmailRecuperar");
            entUsuario atrU = datUsuario.EmailUsuario(Email);
            if(atrU!=null){
            Mensaje e = new Mensaje("proyectobibliotecario@gmail.com","2b1@AA/#","E:\\aaa.jpg","aaa.jpg",Email,"Recuperando","Su contraseña es:"+atrU.getPsw_sesesion_us());
        if (e.sendMail()){
            response.sendRedirect("fLogin.jsp");
        }else{
            out.print("Error en el envio");
        }
            }else{
                out.print("<script>alert('el emaail ingresado no es Valido')</script>");
            }
        }%>
        <form>
        <div style="margin: 0 auto;width: 900px;height: 300px; background-color: white;text-align: center">
            <h1>Recuperar contraseña</h1>
            <div style="clear: both;height: 15px"></div>
            <div>Correo Electronico</div>
            <input type="email" required="true" name="txtEmailRecuperar" class="form-inline"/>
            <input type="submit" name="btnEnviar" class="btn-primary btn-success"/>
        </div>
            </form>
    </body>
</html>
