package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import java.text.DateFormat;
import PaqueteEntidades.entUsuario;
import paqueteNegocio.negLibros;
import PaqueteEntidades.entLibros;
import paqueteNegocio.negCategorias;
import PaqueteEntidades.entCategoria;
import PaqueteEntidades.entCategoria;
import java.util.ArrayList;

public final class fPrestamo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"../../assets/ico/favicon.ico\">\n");
      out.write("    <title>Biblioteca</title>\n");
      out.write("    <link href=\"Estilos/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"Estilos/offcanvas.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"Estilos/jquery-ui-1.10.4.css\"/>\n");
      out.write("        <script src=\"Scripts/jquery-1.9.1.js\"></script>\n");
      out.write("        <script src=\"Scripts/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"Scripts/offcanvas.js\"></script>\n");
      out.write("        <script src=\"Scripts/bootstrap.min.js\"></script>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    <div class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("          <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n");
      out.write("            <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("            <span class=\"icon-bar\"></span>\n");
      out.write("          </button>\n");
      out.write("          <a class=\"navbar-brand\">Bilbioteca</a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"collapse navbar-collapse\">\n");
      out.write("          <ul class=\"nav navbar-nav\">\n");
      out.write("              <li><a href=\"fLector.jsp\">Inicio</a></li>\n");
      out.write("              <li class=\"active\"><a href=\"fPrestamo.jsp\">Reservar</a></li>\n");
      out.write("              <li><a href=\"fBucarLibro.jsp\">Buscar Libros</a></li>\n");
      out.write("              <li><a href=\"fHistorial.jsp\">Historial</a></li>\n");
      out.write("          </ul>\n");
      out.write("            ");

            String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
            int ReglaNeDia=3;
            Date a=new Date();
            a.setDate(a.getDate()+ReglaNeDia);
            DateFormat dt=DateFormat.getDateInstance(3);
            String FechaVista=dt.format(a);

            HttpSession ses = request.getSession();
            entUsuario atrU = (entUsuario)ses.getAttribute("atrUsuario");            
            if(atrU!=null){
        
      out.write("\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">");
      out.print(atrU.getNombres_usu()+" "+atrU.getApellidosPaterno_usu());
      out.write("<b class=\"caret\"></b></a>\n");
      out.write("              <ul class=\"dropdown-menu\">\n");
      out.write("                  <li><a href=\"PerfilLector.jsp\" id=\"ediPer\">Editar Perifl</a></li>\n");
      out.write("                <li class=\"divider\"></li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"sCerrarSesion\">Cerrar sesión</a>\n");
      out.write("                </li>\n");
      out.write("              </ul>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("      <div class=\"row row-offcanvas row-offcanvas-right\">\n");
      out.write("          <div class=\"col-xs-12 col-sm-9\">\n");
      out.write("              ");

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
            
      out.write("\n");
      out.write("                        <form action=\"sQuitarItemCarrito\"> \n");
      out.write("                        <div style=\"float: right\">Fecha maxima de entrega :");
      out.print(FechaVista);
      out.write("</div>\n");
      out.write("                        \n");
      out.write("            <table class=\"table table-bordered table-hover\"style=\"width: 100%\">\n");
      out.write("            <thead >\n");
      out.write("                <tr>\n");
      out.write("                    <td>N°</td>\n");
      out.write("                    <td>Codigo</td>\n");
      out.write("                    <td>Titulo</td>\n");
      out.write("                    <td>Autor</td>\n");
      out.write("                    <td>Descripcion</td>\n");
      out.write("                    <td>Opcion</td>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                \n");
      out.write("            ");

                ArrayList<Object> ListaCarrito = (ArrayList<Object>)ses.getAttribute("carrito");
                for(int i=0; i<ListaCarrito.size();i++){
                    Object[] o = (Object[])ListaCarrito.get(i);
            
            
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    \n");
      out.write("                    <td>");
      out.print(i+1);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(o[0].toString());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(o[1].toString());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(o[2].toString());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(o[3].toString());
      out.write("</td>\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.print(o[0].toString());
      out.write("\" name=\"lvidProducto\"/>\n");
      out.write("            <td><input type=\"submit\" name=\"btnQuitar\" value=\"Quitar\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                }
            
      out.write("\n");
      out.write("                        </form>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("        <form action=\"sGuardarPedido\">\n");
      out.write("            <input type=\"submit\" name=\"btnGuardar\" value=\"Guardar\"/>\n");
      out.write("        </form>\n");
      out.write("        ");
}else{
      out.write("\n");
      out.write("        <p style=\"color: #007095\">No se ha agregado ningun libro al prestamo</p>\n");
      out.write("                   ");
 }
            
      out.write("\n");
      out.write("        </div><!--/span-->\n");
      out.write("\n");
      out.write("        <div class=\"col-xs-6 col-sm-3 sidebar-offcanvas\" id=\"sidebar\" role=\"navigation\">\n");
      out.write("          <div class=\"list-group\">\n");
      out.write("              ");

                        ArrayList<entCategoria> lista= negCategorias.ListarCategorias();
                        for(int i = 0 ; i<lista.size();i++){
      out.write("\n");
      out.write("                        <a href=\"fLector.jsp?IdCategoria=");
      out.print(lista.get(i).getCodigo_gen()+"&dmarca="+
                                    lista.get(i).getNombres_gen());
      out.write("\" class=\"list-group-item\">");
      out.print(lista.get(i).getNombres_gen());
      out.write("</a>\n");
      out.write("                      ");
  }
                    
      out.write("\n");
      out.write("          </div>\n");
      out.write("        </div><!--/span-->\n");
      out.write("      </div><!--/row-->\n");
      out.write("\n");
      out.write("      <hr>\n");
      out.write("\n");
      out.write("      <footer>\n");
      out.write("        <p>&copy; Company 2014</p>\n");
      out.write("      </footer>\n");
      out.write("\n");
      out.write("    </div><!--/.container-->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core JavaScript\n");
      out.write("    ================================================== -->\n");
      out.write("    <!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("    <script src=\"Scripts/jquery.min.js\"></script>\n");
      out.write("    <script src=\"Scripts/jquery.min.js\"></script>\n");
      out.write("    <script src=\"Scripts/offcanvas.js\"></script>\n");
      out.write("  </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
