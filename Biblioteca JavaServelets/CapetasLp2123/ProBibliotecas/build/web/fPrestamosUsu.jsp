<%-- 
    Document   : fPrestamos
    Created on : 16-jul-2014, 11:53:19
    Author     : Administrador
--%>

<%@page import="paqueteDatos.datLibros"%>
<%@page import="PaqueteEntidades.entDetallePrestamo"%>
<%@page import="PaqueteEntidades.entDevolucion"%>
<%@page import="paqueteDatos.datPrestamos"%>
<%@page import="PaqueteEntidades.entEntrega"%>
<%@page import="paqueteDatos.datGenerador"%>
<%@page import="PaqueteEntidades.entGenerador"%>
<%@page import="paqueteNegocio.negPrestamo"%>
<%@page import="PaqueteEntidades.entPrestamo"%>
<%@page import="PaqueteEntidades.entPrestamo"%>
<%@page import="paqueteNegocio.negEditores"%>
<%@page import="PaqueteEntidades.entEditores"%>
<%@page import="PaqueteEntidades.entEditores"%>
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
            entGenerador Gen=new entGenerador();
            if(request.getParameter("btnAgregar")!=null){
        
            if(request.getParameter("rbEntrega")!=null&&request.getParameter("rbEntrega").equals("Entrega")){
            Gen=datGenerador.GenEntrega();
            int Ultimo = Gen.getUltimo() + 1;
            String cadcodido = "ENT000";
            String cadXCOD = "" + Ultimo;
            String Codigo = cadcodido.substring(0, cadcodido.length() - cadXCOD.length()) + Ultimo;
                entPrestamo Pre =new entPrestamo();
                entEntrega Ent =new entEntrega();
                Ent.setCodigo_ent(Codigo.toString());
                Ent.setCodigo_pre(request.getParameter("txtPrestamo"));
                Ent.setCodigo_usu_emp(atrU.getCodigo_usu());
                Pre.setCodigo_pre(request.getParameter("txtPrestamo"));
                try{
                    int i = datPrestamos.InsertarEntrega(Ent);
                    int j = datPrestamos.ActualizarPrestamo(Pre,"Entrega");
                    if(i>0){
                        out.print("<script>Se edito correctamente el producto</script>");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR AL EDITAR</script>");
                }
            }
            if(request.getParameter("rbEntrega")!=null&&request.getParameter("rbEntrega").equals("Devolucion")){
            Gen=datGenerador.GenDevolucion();
            int Ultimo = Gen.getUltimo() + 1;
            String cadcodido = "DEV000";
            String cadXCOD = "" + Ultimo;
            String Codigo = cadcodido.substring(0, cadcodido.length() - cadXCOD.length()) + Ultimo;
                entPrestamo Pre =new entPrestamo();
                entDevolucion Dev =new entDevolucion();
                Dev.setCodigo_dev(Codigo.toString());
                Dev.setCodigo_pre(request.getParameter("txtPrestamo"));
                Dev.setCodigo_usu_emp(atrU.getCodigo_usu());
                
                Pre.setCodigo_pre(request.getParameter("txtPrestamo"));
                ArrayList<entDetallePrestamo> ListaDetalle = datPrestamos.BuscarDetallePrestamo(request.getParameter("txtPrestamo"));
                try{
                                    for(int i=0;i<ListaDetalle.size();i++){

                String d = ListaDetalle.get(i).getCodigo_lib();
                datLibros.ActualizarStock(d, "Sumar");
                }
                    int i = datPrestamos.InsertarDevolucion(Dev);
                    int j = datPrestamos.ActualizarPrestamo(Pre,"Devolucion");
                    if(i>0&&j>0){
                      //response.sendRedirect("mio.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR</script>");
                }
            }
            }

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
            <%if(atrU.getTipo_usu().equals("Bibliotecario")){%>
        <form>
        <div style="float: left">
            <label>
            <div style="float: left;width: 150px">Accion  </div>
            <label style="float: left" class="radio-inline">
            <input name="rbEntrega" type="radio" value="Entrega" checked="true"/>Entrega</label>
            <label style="float: left" class="radio-inline">
            <input name="rbEntrega" type="radio" value="Devolucion"/>Devolucion</label>
            </label>
            <div>
            <div style="float: left;width: 150px">Codigo de prestamo</div>
            <div style="float: left"><input name="txtPrestamo" style="float: left"/></div>
            </div>
            <div style="clear: both"></div>
            <input type="submit" value="Guardar" name="btnAgregar"/>
        </div>
        </form>
        <%}%>
        <%-- <div class="lead">--%>
        <div style="clear: both;height: 10px"></div>
        <table class="table table-bordered table-hover"style="width: 100%">
            <thead>
                <tr>          
                <td>Codigo</td>
                <td>Fecha maxima de devolucion</td>
                <td>Fecha de Prestamo</td>
                <td>Libros</td>
                <td>Usuario</td>
                <td>Estado</td>
        </tr>
            </thead>
            <tbody>
               <%
                        String nombreUsu =atrU.getDocumentoDeIdentidad();
                        String tipoUsu =atrU.getTipo_usu();
                        ArrayList<entPrestamo> Lista = negPrestamo.ListarPrestamosXEstado("", "");
               
                        for(int i=0;i<Lista.size();i++){
                            %>
                            
                                <tr>
                                    <td><%=Lista.get(i).getCodigo_pre()%></td>
                                    <td><%=Lista.get(i).getFechaLimite_devolucion()%></td>
                                    <td><%=Lista.get(i).getFecha_prestamo()%></td>
                                    <td><%=Lista.get(i).getCodigo_lib()%></td>
                                    <td><%=Lista.get(i).getCodigo_usu_lector()%></td>
                                    <td><%=Lista.get(i).getEstado_Prestamo()%></td>
                                </tr>
                                <%
                            }
                %>
        </tbody>
            </table>
        </div>
            
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="list-group">
              <a href="fEmpleado.jsp" class="list-group-item">Inicio</a>
              <a href="fPrestamosUsu.jsp" class="list-group-item active">Prestamos</a>
             <% HttpSession SMenu = request.getSession();
            entUsuario Emp = (entUsuario)SMenu.getAttribute("atrUsuario");            
            if(Emp.getTipo_usu().equals("Bibliotecario") &&Emp!=null){%>
              <a href="fLibros.jsp" class="list-group-item">Libros</a>
              <a href="fAutores.jsp" class="list-group-item">Autores</a>
              <a href="fEditores.jsp" class="list-group-item">Editores</a>
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
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/offcanvas.js"></script>
  </body>
</html>
