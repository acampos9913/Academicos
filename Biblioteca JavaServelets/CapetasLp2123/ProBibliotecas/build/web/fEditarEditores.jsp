<%-- 
    Document   : fEditarEditores
    Created on : 16-jul-2014, 15:08:57
    Author     : Administrador
--%>

<%@page import="PaqueteEntidades.entEditores"%>
<%@page import="PaqueteEntidades.entEditores"%>
<%@page import="paqueteDatos.datEditores"%>
<%@page import="paqueteNegocio.negAutores"%>
<%@page import="PaqueteEntidades.entAutores"%>
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
    <link href="Estilos/cssUsuarios.css" rel="stylesheet">
    <link rel="stylesheet" href="Estilos/jquery-ui-1.10.4.css"/>
        <script src="Scripts/jquery-1.9.1.js"></script>
        <script src="Scripts/jquery-ui.js"></script>
        <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/offcanvas.js"></script>
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
            
            <%
            HttpSession ses = request.getSession();
            entUsuario atrU = (entUsuario)ses.getAttribute("atrUsuario");            
            if(atrU!=null){
        %>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=atrU.getNombres_usu()+" "+atrU.getApellidosPaterno_usu()%><b class="caret"></b></a>
              <ul class="dropdown-menu">
                  <li><a href="PerfilEmepleado.jsp" id="ediPer">Editar Perifl</a></li>
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
            entEditores E = new entEditores();
            if(request.getParameter("IdEditorial")!=null){
                String id = request.getParameter("IdEditorial");
                E = datEditores.DevolverEditor(id);
            }
            if(request.getParameter("btnGuardar")!=null){
                entEditores Edi =new entEditores();
                Edi.setCodigo_edi(request.getParameter("txtCodigo"));
                Edi.setNom_edi(request.getParameter("txtNombreEditor"));
                Edi.setDireccion(request.getParameter("txtDireccionEditor"));
                
                try{
                    int i = datEditores.actualizarEditores(Edi);
                    if(i>0){
                        //out.print("<script>Se edito correctamente el producto</script>");
                        response.sendRedirect("fEditores.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR</script>");
                }
            }
        
        %>
        <form>
            <input type="hidden" name="txtCodigo" value="<%=E.getCodigo_edi()%>"/>
        <div class="InputsDiv">Codigo: </div><div class="InputsDiv"><%=E.getCodigo_edi()%></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Nombres: </div><div class="InputsDiv"><input type="text" required="true" name="txtNombreEditor" required="true" value="<%=E.getNom_edi()%>"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Dirección: </div><div class="InputsDiv"><input type="text" required="true" name="txtDireccionEditor" value="<%=E.getDireccion()%>"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv"><input type="submit" value="Guardar"name="btnGuardar"/></div>
        </form>
        </div>
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="list-group">
              <a href="fEmpleado.jsp" class="list-group-item">Inicio</a>
              <a href="fPrestamosUsu.jsp" class="list-group-item">Prestamos</a>
             <% HttpSession SMenu = request.getSession();
            entUsuario Emp = (entUsuario)SMenu.getAttribute("atrUsuario");            
            if(Emp.getTipo_usu().equals("Bibliotecario") &&Emp!=null){%>
              <a href="fLibros.jsp" class="list-group-item">Libros</a>
              <a href="fAutores.jsp" class="list-group-item">Autores</a>
              <a href="fEditores.jsp" class="list-group-item active">Editores</a>
              <a href="fCategorias.jsp" class="list-group-item">Categorias</a>
              <a href="fUsuarios.jsp" class="list-group-item">Usuarios</a>
              <%
            }else{
              %>
              <a href="fUsuarios.jsp" class="list-group-item">Usuarios</a>
              <a href="fReportes.jsp" class="list-group-item">Reportes</a>
              <%}%>
          </div>
        </div>
      </div>
      <hr>
      <footer>
        <p>&copy; Company 2014</p>
      </footer>
    </div>
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.jss"></script>
    <script src="Scripts/offcanvas.js"></script>
  </body>
</html>