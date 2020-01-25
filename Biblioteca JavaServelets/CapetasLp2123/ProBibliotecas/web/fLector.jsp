<%-- 
    Document   : fLector
    Created on : 16-jul-2014, 9:01:16
    Author     : Administrador
--%>
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
            <table width="100%">
                    
                    <%
                        String Estado ="Habilitado";
                        //int Ca=datCategorias.ListarCategorias();
                        String Categoria="";
                        if(request.getParameter("IdCategoria")!=null){
                        Categoria=request.getParameter("IdCategoria");
                        }
                        //String tipoUsu =atrU.getTipo_usu();
                        ArrayList<entLibros> Lista = negLibros.ListarlibrosXEstado(Estado,Categoria);
                        int numceldas=0;
                        for(int i=0;i<Lista.size();i++){
                            if(numceldas==0){
                                out.print("<tr>");
                            }
                            numceldas++;
                            %> 
                            <td width="25%" style="text-align: center">
                                <div style="text-align: center"><img src="./Imagenes/<%=Lista.get(i).getImagen_lib()%>" width="100px" height="120px"/></div>
                            <div style="color: dimgray; font-family: Arial, cursive;font-size: 12px">Codigo:<%=Lista.get(i).getCodigo_lib()%></div>
                            <div style="color: dimgray; font-family: Arial, cursive;font-size: 12px"><%=Lista.get(i).getTitulo_lib()%></div>
                            <div style="color: dimgray; font-family: Arial, cursive;font-size: 12px">Disponible:<%=Lista.get(i).getStock()%> de <%=Lista.get(i).getEjemplares_lib()%></div>
                            <%
                                ArrayList<Object> Carrito = null;
                                if(ses.getAttribute("carrito")!=null){
                                    
                //Si ya existe el atributo carrito, vaciamos el contenido
                //en la variable carrito
                                    Carrito = (ArrayList<Object>)ses.getAttribute("carrito");
                                }else{
                                    //si no existe el atributo, terminamos de instanciar
                                    //la variable carrito (vacia)
                                    Carrito = new ArrayList<Object>();
                                }
                                
                            %>         

                                    <form action="sAgregarCarrito">
                                    
                                        <div style="margin-bottom: 10px"><input type="submit" name="btnAgregar" value="Agregar"
                                                                                class="btn-warning btn-danger btn-group-xs"/></div>
                                    <input type="hidden" name="lvidProducto" 
                                           value="<%=Lista.get(i).getCodigo_lib()%>"/>
                                    <input type="hidden" name="lvTitulo" 
                                           value="<%=Lista.get(i).getTitulo_lib()%>"/>
                                    <input type="hidden" name="lvAutores" 
                                           value="<%=Lista.get(i).getE_Autores().getNombres_aut()%>"/>
                                    <input type="hidden" name="lvDescripcion" 
                                           value="<%=Lista.get(i).getDecripcion_lib()%>"/>
                                </form>
                                  
                            </td>
                            <%
                            

                            if(numceldas==4){
                                out.print("</tr>");
                                numceldas=0;
                            }
                        }
                %>
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

  </body>
</html>