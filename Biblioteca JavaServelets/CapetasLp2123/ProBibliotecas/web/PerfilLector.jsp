<%-- 
    Document   : PerfilLector
    Created on : 19-jul-2014, 5:49:49
    Author     : Administrador
--%>

<%@page import="paqueteDatos.datUsuario"%>
<%@page import="paqueteDatos.datCategorias"%>
<%@page import="PaqueteEntidades.entUsuario"%>
<%@page import="paqueteNegocio.negLibros"%>
<%@page import="PaqueteEntidades.entLibros"%>
<%@page import="paqueteNegocio.negCategorias"%>
<%@page import="PaqueteEntidades.entCategoria"%>
<%@page import="PaqueteEntidades.entCategoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">
    <title>Biblioteca</title>
    <link href="Estilos/bootstrap.min.css" rel="stylesheet">
    <link href="Estilos/offcanvas.css" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/jquery-ui-1.10.4.css"/>
        <script src="Scripts/jquery-1.9.1.js"></script>
        <script src="Scripts/jquery-ui.js"></script>
        <script src="Scripts/offcanvas.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
  </head>
  <body>
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">Bilbioteca</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
              <li class="active"><a href="fLector.jsp">Inicio</a></li>
              <li><a href="fPrestamo.jsp">Reservar</a></li>
              <li><a href="fBucarLibro.jsp">Buscar Libros</a></li>
              <li><a href="fHistorial.jsp">Historial</a></li>
          </ul>
            <%
            String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
            
            HttpSession ses = request.getSession();
            entUsuario atrU = (entUsuario)ses.getAttribute("atrUsuario");            
            if(atrU!=null){
        %>
        
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=atrU.getNombres_usu()+" "+atrU.getApellidosPaterno_usu()%><b class="caret"></b></a>
              <ul class="dropdown-menu">
                  <li><a href="PerfilLector.jsp" id="ediPer">Editar Perifl</a></li>
                <li class="divider"></li>
                <li>
                    <a href="sCerrarSesion">Cerrar sesión</a>
                </li>
              </ul>
            </li>
          </ul>
        <%}%>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
            <%

        String btnGuardar="";
        //String cboUsuario=mrequest.getParameter("cboUsuario");
                
        if(request.getParameter("btnGuardar")!=null){
String txtCodigo=request.getParameter("txtCodigo");
             entUsuario Usu =new entUsuario();
                Usu.setCodigo_usu(txtCodigo);
                Usu.setDocumentoDeIdentidad(request.getParameter("txtDocumentodeIdentidad"));
                Usu.setNombres_usu(request.getParameter("txtNombresUsuario"));
                Usu.setApellidosPaterno_usu(request.getParameter("txtApellidoPaternp"));
                Usu.setApellidosMaterno_usu(request.getParameter("txtApellidomaterno"));
                Usu.setTelelefono_usu(request.getParameter("txtTelefonoUsuario"));
                Usu.setDireccion_usu(request.getParameter("txtDireccionUsuario"));
                Usu.setCorreoElectronico_usu(request.getParameter("txtCorreoUsuario"));
                Usu.setFacha_nac_usu(request.getParameter("txtFechaNaciUsusario"));
                Usu.setImagen("default.png");
                Usu.setPsw_sesesion_us(request.getParameter("txtContrasena"));
                try{
                    int i = datUsuario.ActualizarUsuarios(Usu);
                    if(i>0){
                        out.print("<script>Se edito correctamente el producto</script>");
                        response.sendRedirect("fLector.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR AL EDITAR</script>");
                }
    }
        %>
    <form method="post">
        <div style="float: left" class="">
            <input type="hidden" name="txtCodigo" value="<%=atrU.getCodigo_usu()%>"/>
            <div class="InputsDiv">Usuario: </div><div class="InputsDiv"><%=atrU.getNombres_usu()%></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Contraseña: </div><div class="InputsDiv"><input type="password" name="txtContrasena" value="<%=atrU.getPsw_sesesion_us()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">DNI:</div><div class="InputsDiv"><input type="text" name="txtDocumentodeIdentidad" value="<%=atrU.getDocumentoDeIdentidad()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Nombres: </div><div class="InputsDiv"><input type="text" name="txtNombresUsuario" value="<%=atrU.getNombres_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Apellido Paterno: </div><div class="InputsDiv"><input type="text" name="txtApellidoPaternp" value="<%=atrU.getApellidosPaterno_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Apellido Materno: </div><div class="InputsDiv"><input type="text" name="txtApellidomaterno" value="<%=atrU.getApellidosMaterno_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Telefono: </div><div class="InputsDiv"><input type="text"  name="txtTelefonoUsuario" value="<%=atrU.getTelelefono_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Direccion: </div><div class="InputsDiv"><input type="text" name="txtDireccionUsuario" value="<%=atrU.getDireccion_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Correo Electronico: </div><div class="InputsDiv"><input type="text" required="true" name="txtCorreoUsuario" value="<%=atrU.getCorreoElectronico_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
            <div class="InputsDiv">Fecha de Nacimiento: </div><div class="InputsDiv"><input type="date" id="datepicker" name="txtFechaNaciUsusario" value="<%=atrU.getFacha_nac_usu()%>"/></div>
            <div class="EspaciadorDiv"></div>
        </div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv"><input type="submit" value="Guardar"name="btnGuardar"/></div>
    </form>
        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="list-group">
              <%
                        ArrayList<entCategoria> lista= negCategorias.ListarCategorias();
                        for(int i = 0 ; i<lista.size();i++){%>
                        <a href="fLector.jsp?IdCategoria=<%=lista.get(i).getCodigo_gen()+"&dmarca="+
                                    lista.get(i).getNombres_gen()%>" class="list-group-item"><%=lista.get(i).getNombres_gen()%></a>
                      <%  }
                    %>
          </div>
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div><!--/.container-->

  </body>
</html>
