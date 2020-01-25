<%-- 
    Document   : fBucarLibro
    Created on : 16-jul-2014, 10:13:08
    Author     : Administrador
--%>

<%@page import="PaqueteEntidades.entEditores"%>
<%@page import="PaqueteEntidades.entAutores"%>
<%@page import="paqueteDatos.datLibros"%>
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
              <li><a href="fLector.jsp">Inicio</a></li>
              <li><a href="fPrestamo.jsp">Reservar</a></li>
              <li class="active"><a href="fBucarLibro.jsp">Buscar Libros</a></li>
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
            <form>
                <input name="txtBuscar" type="text"/>
                <select name="cboBuscador">
                    <option>Todos</option>
                    <option>Autor</option>
                    <option>Titulo</option>
                    <option>Editor</option>
                </select>
                <input type="submit" name="btnBuscar" value="Buscar"/>
            </form>
            <div class="EspaciadorDiv"></div>
            <table class="table table-bordered table-hover"style="width: 100%">
                <thead>
                    <tr>        
                <td>Codigo</td>
                <td>Titulo</td>
                <td>Decripcion</td>
                <td>Observaciones</td>
                <td>Autores</td>
                <td>Categoria</td>
                <td>Editores</td>
                <td>Ejemplares</td>
                <td>Opcion</td>
            </tr>
            </thead>
            <tbody>
               <%
                        String Estado =request.getParameter("cboBuscador");
                        String Categoria=request.getParameter("txtBuscar");
                        ArrayList<entLibros> Lista = datLibros.BuscarLibros(Estado,Categoria);
                        
                        for(int i=0;i<Lista.size();i++){
                            entAutores A= Lista.get(i).getE_Autores();
                            entCategoria C= Lista.get(i).getE_Catewgoria();
                            entEditores E= Lista.get(i).getE_Editores();
                            %>
                                <tr>
                                    <td><%=Lista.get(i).getCodigo_lib()%></td>
                                    <td><%=Lista.get(i).getTitulo_lib()%></td>
                                    <td><%=Lista.get(i).getDecripcion_lib()%></td>
                                    <td><%=Lista.get(i).getObservaciones()%></td>
                                    <td><%=A.getNombres_aut()%></td>
                                    <td><%=C.getNombres_gen()%></td>
                                    <td><%=E.getNom_edi()%></td>
                                    <td><%=Lista.get(i).getEjemplares_lib()%></td>
                                    <td><a href="sAgregarCarrito?lvidProducto=<%=Lista.get(i).getCodigo_lib()%>">Reservar</a></td>
                                </tr>
                        <%
                            
                            }
                %>
                 </tbody>
            </table>
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



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/offcanvas.js"></script>
  </body>
</html>