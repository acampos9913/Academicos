<%-- 
    Document   : fPrestamo
    Created on : 16-jul-2014, 10:15:28
    Author     : Administrador
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
              <li><a href="fLector.jsp">Inicio</a></li>
              <li class="active"><a href="fPrestamo.jsp">Reservar</a></li>
              <li><a href="fBucarLibro.jsp">Buscar Libros</a></li>
              <li><a href="fHistorial.jsp">Historial</a></li>
          </ul>
            <%
            String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
            int ReglaNeDia=3;
            Date a=new Date();
            a.setDate(a.getDate()+ReglaNeDia);
            DateFormat dt=DateFormat.getDateInstance(3);
            String FechaVista=dt.format(a);

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
            if(request.getParameter("yaagrego")!=null){
            if(request.getParameter("yaagrego").equals("1")){
                out.print("<Script>alert('El libro que intenta agregar ya existe...!')</Script>");
                    }
              if(request.getParameter("yaagrego").equals("2")){
                out.print("<Script>alert('El Libro tiene un stock de 0...!')</Script>");
                    }
              if(request.getParameter("yaagrego").equals("3")){
                out.print("<Script>alert('Usted tiene le maximo numero de libros...!')</Script>");
                    }
              if(request.getParameter("yaagrego").equals("4")){
                out.print("<Script>alert('Usted tiene un prestamo prendiente...!')</Script>");
                    }
            }
                    if(ses.getAttribute("carrito")!=null){
            %>
                        <form action="sQuitarItemCarrito"> 
                        <div style="float: right">Fecha maxima de entrega :<%=FechaVista%></div>
                        
            <table class="table table-bordered table-hover"style="width: 100%">
            <thead >
                <tr>
                    <td>N°</td>
                    <td>Codigo</td>
                    <td>Titulo</td>
                    <td>Autor</td>
                    <td>Descripcion</td>
                    <td>Opcion</td>
                </tr>
            </thead>
            <tbody>
                
            <%
                ArrayList<Object> ListaCarrito = (ArrayList<Object>)ses.getAttribute("carrito");
                for(int i=0; i<ListaCarrito.size();i++){
                    Object[] o = (Object[])ListaCarrito.get(i);
            
            %>
                <tr>
                    
                    <td><%=i+1%></td>
                    <td><%=o[0].toString()%></td>
                    <td><%=o[1].toString()%></td>
                    <td><%=o[2].toString()%></td>
                    <td><%=o[3].toString()%></td>
            <input type="hidden" value="<%=o[0].toString()%>" name="lvidProducto"/>
            <td><input type="submit" name="btnQuitar" value="Quitar"/></td>
                </tr>
                <%
                }
            %>
                        </form>
            </tbody>
        </table>
        <form action="sGuardarPedido">
            <input type="submit" name="btnGuardar" value="Guardar"/>
        </form>
        <%}else{%>
        <p style="color: #007095">No se ha agregado ningun libro al prestamo</p>
                   <% }
            %>
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