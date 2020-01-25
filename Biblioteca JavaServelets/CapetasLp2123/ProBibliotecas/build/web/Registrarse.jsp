<%-- 
    Document   : Registrarse
    Created on : 18-jul-2014, 21:08:21
    Author     : Administrador
--%>

<%@page import="paqueteDatos.datUsuario"%>
<%@page import="PaqueteEntidades.entUsuario"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="paqueteDatos.datGenerador"%>
<%@page import="PaqueteEntidades.entGenerador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="Estilos/jquery-ui.css"/>
        <link rel="stylesheet" href="Estilos/cssUsuarios.css"/>
        <link rel="stylesheet" href="Estilos/bootstrap.min.css"/>
        <link rel="stylesheet" href="Estilos/jquery.ui.datepicker.css"/>
        <script src="Scripts/jquery-1.9.1.js"></script>
        <script src="Scripts/jquery-ui.js"></script>
        <script src="Scripts/jquery.ui.datepicker-es.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="Scripts/jsUsuarios.js"></script>
        <script>
$(function () {
$.datepicker.setDefaults($.datepicker.regional["es"]);
$("#datepicker").datepicker({
dateFormat: 'dd-mm-yy'
});
});
</script>
<style>
            body{
                margin: 0;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
    </head><h1 style="text-align: center">Registrate en la biblioteca</h1>
    <hr>
    
    <body>
        </br>
        <div style="margin: 0 auto;border: solid #008000 1px;width: 400px;height: 600px; background-color: white;border: 1px">
            
            <%
                String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
                String Mensaje="";

        entGenerador Gen=new entGenerador();
        Gen=datGenerador.GenUsuario();
        int Ultimo = Gen.getUltimo() + 1;
        String cadcodido = "USU000";
        String cadXCOD = "" + Ultimo;
        String Codigo = cadcodido.substring(0, cadcodido.length() - cadXCOD.length()) + Ultimo;
            
        String btnGuardar="";
        String cboUsuario="Lector";
        btnGuardar = request.getParameter("btnGuardar");
        String txtCodigoLibro=Codigo.toString();
                String txtUsuario=request.getParameter("txtUsuario");
         if(request.getParameter("btnCancelar")!=null){
         response.sendRedirect("index.html");
         }
        if(request.getParameter("btnGuardar")!=null){
            String Usuario = request.getParameter("txtUsuario");
            String Email = request.getParameter("txtCorreoUsuario");
            entUsuario atrE = datUsuario.EmailUsuario(Email);
            entUsuario atrU = datUsuario.Usuario(Usuario);
            if(atrU!=null){
            Mensaje="El usuario ya existe";
            }else{
                if(atrE!=null){
                Mensaje="El Email ya existe";
                }else{
                entUsuario Usu =new entUsuario();
                Usu.setCodigo_usu(Codigo.toString());
                Usu.setNombres_sesison_usu(txtUsuario);
                Usu.setPsw_sesesion_us(request.getParameter("txtContrasena"));
                Usu.setDocumentoDeIdentidad(request.getParameter("txtDocumentodeIdentidad"));
                Usu.setNombres_usu(request.getParameter("txtNombresUsuario"));
                Usu.setApellidosPaterno_usu(request.getParameter("txtApellidoPaternp"));
                Usu.setApellidosMaterno_usu(request.getParameter("txtApellidomaterno"));
                Usu.setTelelefono_usu(request.getParameter("txtTelefonoUsuario"));
                Usu.setDireccion_usu(request.getParameter("txtDireccionUsuario"));
                Usu.setCorreoElectronico_usu(request.getParameter("txtCorreoUsuario"));
                Usu.setFacha_nac_usu(request.getParameter("txtFechaNaciUsusario"));
                Usu.setImagen("default.png");
                Usu.setTipo_usu(cboUsuario);

                try{
                    int i = datUsuario.InsertarUsuarios(Usu);
                    if(i>0){
                        response.sendRedirect("fLogin.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>Error</script>");
                }
                }
            }
      
            }
    
        %>


        <form method="post">
        <div style="float: left">
        <div class="InputsDiv">Usuario: </div><div class="InputsDiv"><input type="text" required="true" name="txtUsuario"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Contraseña: </div><div class="InputsDiv"><input type="password" required="true" name="txtContrasena"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">DNI: </div><div class="InputsDiv"><input type="text" required="true" name="txtDocumentodeIdentidad"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Nombres: </div><div class="InputsDiv"><input type="text" required="true" name="txtNombresUsuario"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Apellido Paterno: </div><div class="InputsDiv"><input type="text" name="txtApellidoPaternp"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Apellido Materno: </div><div class="InputsDiv"><input type="text" name="txtApellidomaterno"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Telefono: </div><div class="InputsDiv"><input type="text" name="txtTelefonoUsuario"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Direccion: </div><div class="InputsDiv"><input type="text" name="txtDireccionUsuario"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Correo Electronico: </div><div class="InputsDiv"><input type="email" required="true" name="txtCorreoUsuario"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Fecha de Nacimiento: </div><div class="InputsDiv"><input id="datepicker" type="date" name="txtFechaNaciUsusario"/></div>
        <div class="EspaciadorDiv"></div>
        </div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv"><input type="submit" value="Guardar"name="btnGuardar"/></div>
        </form>
        <form>
        <div class="InputsDiv"><input type="submit" value="Cancelar"name="btnCancelar"/></div>
        <div class="EspaciadorDiv"></div>
        <p style="color: red">* <%=Mensaje%></p>
        </form>
        </div>
    </body>
</html>
