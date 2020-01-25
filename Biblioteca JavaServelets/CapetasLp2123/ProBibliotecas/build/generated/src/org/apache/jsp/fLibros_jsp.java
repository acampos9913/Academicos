package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import paqueteDatos.datGenerador;
import paqueteNegocio.negEditores;
import PaqueteEntidades.entEditores;
import PaqueteEntidades.entEditores;
import paqueteNegocio.negAutores;
import PaqueteEntidades.entAutores;
import PaqueteEntidades.entUsuario;
import paqueteNegocio.negLibros;
import PaqueteEntidades.entLibros;
import paqueteNegocio.negCategorias;
import PaqueteEntidades.entCategoria;
import PaqueteEntidades.entCategoria;
import java.util.ArrayList;

public final class fLibros_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link href=\"Estilos/cssUsuarios.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"../../assets/ico/favicon.ico\">\n");
      out.write("    <title>Biblioteca</title>\n");
      out.write("    <link href=\"Estilos/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"Estilos/offcanvas.css\" rel=\"stylesheet\">\n");
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
      out.write("            ");

            HttpSession ses = request.getSession();
            entUsuario atrU = (entUsuario)ses.getAttribute("atrUsuario");
            
            if(request.getParameter("idHLib")!=null){
                try{
                    String Estado="Inabilitado";
                    String Codigo=request.getParameter("idHLib");
                    String tabla="Libros";
                    int i = datGenerador.ActualizarEstados(Estado,Codigo,tabla);
                    if(i>0){
                        out.print("<script>Se edito correctamente el producto</script>");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR AL EDITAR</script>");
                }
                }
            
            if(request.getParameter("idILib")!=null){
                try{
                    String Estado="Habilitado";
                    String Codigo=request.getParameter("idILib");
                    String tabla="Libros";
                    int i = datGenerador.ActualizarEstados(Estado,Codigo,tabla);
                    if(i>0){
                        out.print("<script>Se edito correctamente el producto</script>");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR AL EDITAR</script>");
                }
                }
            
            if(atrU!=null){
        
      out.write("\n");
      out.write("          <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <li class=\"dropdown\">\n");
      out.write("              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">");
      out.print(atrU.getNombres_usu()+" "+atrU.getApellidosPaterno_usu());
      out.write("<b class=\"caret\"></b></a>\n");
      out.write("              <ul class=\"dropdown-menu\">\n");
      out.write("                  <li><a href=\"#\" id=\"camContra\">Cambiar Contraseña</a></li>\n");
      out.write("                  <li><a href=\"#\" id=\"ediPer\">Editar Perifl</a></li>\n");
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
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"row row-offcanvas row-offcanvas-right\">\n");
      out.write("        <div class=\"col-xs-12 col-sm-9\">\n");
      out.write("            <a href=\"fNuevosLibros.jsp\"><div>Nuevo</div></a>\n");
      out.write("            <table class=\"table table-bordered table-hover\"style=\"width: 100%\">\n");
      out.write("                <thead>\n");
      out.write("                 <tr>         \n");
      out.write("                <td>Codigo</td>\n");
      out.write("                <td>Titulo</td>\n");
      out.write("                <td>Decripcion</td>\n");
      out.write("                <td>Observaciones</td>\n");
      out.write("                <td>Autores</td>\n");
      out.write("                <td>Categoria</td>\n");
      out.write("                <td>Editores</td>\n");
      out.write("                <td>Ejemplares</td>\n");
      out.write("                <td>Editar</td>\n");
      out.write("                <td>Inabilitar</td>\n");
      out.write("                <tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("               ");

                        String Estado ="";
                        String Categoria="";
                        String tipoUsu =atrU.getTipo_usu();
                        ArrayList<entLibros> Lista = negLibros.ListarlibrosXEstado(Estado,Categoria);
                        
                
                        for(int i=0;i<Lista.size();i++){
                            entAutores A= Lista.get(i).getE_Autores();
                            entCategoria C= Lista.get(i).getE_Catewgoria();
                            entEditores E= Lista.get(i).getE_Editores();
                            
      out.write("\n");
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                            \n");
      out.write("                                    <td>");
      out.print(Lista.get(i).getCodigo_lib());
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(Lista.get(i).getTitulo_lib());
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(Lista.get(i).getDecripcion_lib());
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(Lista.get(i).getObservaciones());
      out.write("</td>\n");
      out.write("                                    \n");
      out.write("                                    <td>");
      out.print(A.getNombres_aut());
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(C.getNombres_gen());
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(E.getNom_edi());
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(Lista.get(i).getEjemplares_lib());
      out.write("</td>\n");
      out.write("                                    ");
if(Lista.get(i).getEstado_Libros().equals("Habilitado")){
      out.write("\n");
      out.write("                                    <td><a href=\"fEditarLibros.jsp?IdLibro=");
      out.print(Lista.get(i).getCodigo_lib());
      out.write("\"><div class=\"EditarDiv\"></div></a></td>\n");
      out.write("                                    <td><a href=\"fLibros.jsp?idHLib=");
      out.print(Lista.get(i).getCodigo_lib());
      out.write("\"><div class=\"InabilitarDiv\"></div></a></td>\n");
      out.write("                                    ");
}else{
      out.write("\n");
      out.write("                                    <td><a href=\"#\"><div class=\"EditarDiv\"></div></a></td>\n");
      out.write("                                    <td><a href=\"fLibros.jsp?idILib=");
      out.print(Lista.get(i).getCodigo_lib());
      out.write("\"><div class=\"HabilitarDiv\"></div></a></td>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                    \n");
      out.write("                                </tr>\n");
      out.write("                                \n");
      out.write("                        ");

                            
                            }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("        <div class=\"col-xs-6 col-sm-3 sidebar-offcanvas\" id=\"sidebar\" role=\"navigation\">\n");
      out.write("          <div class=\"list-group\">\n");
      out.write("              <a href=\"fEmpleado.jsp\" class=\"list-group-item\">Inicio</a>\n");
      out.write("              <a href=\"fPrestamosUsu.jsp\" class=\"list-group-item\">Prestamos</a>\n");
      out.write("             ");
 HttpSession SMenu = request.getSession();
            entUsuario Emp = (entUsuario)SMenu.getAttribute("atrUsuario");            
            if(Emp.getTipo_usu().equals("Bibliotecario") &&Emp!=null){
      out.write("\n");
      out.write("              <a href=\"fLibros.jsp\" class=\"list-group-item active\">Libros</a>\n");
      out.write("              <a href=\"fAutores.jsp\" class=\"list-group-item\">Autores</a>\n");
      out.write("              <a href=\"fEditores.jsp\" class=\"list-group-item\">Editores</a>\n");
      out.write("              <a href=\"fCategorias.jsp\" class=\"list-group-item\">Categorias</a>\n");
      out.write("              <a href=\"fUsuarios.jsp\" class=\"list-group-item\">Usuarios</a>\n");
      out.write("              ");

            }else{
              
      out.write("\n");
      out.write("              <a href=\"fUsuarios.jsp\" class=\"list-group-item\">Usuarios</a>\n");
      out.write("              <a href=\"fReportes.jsp\" class=\"list-group-item\">Reportes</a>\n");
      out.write("              ");
}
      out.write("\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <hr>\n");
      out.write("      <footer>\n");
      out.write("        <p>&copy; Company 2014</p>\n");
      out.write("      </footer>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"Scripts/jquery.min.js\"></script>\n");
      out.write("    <script src=\"Scripts/jquery.min.js\"></script>\n");
      out.write("    <script src=\"Scripts/offcanvas.js\"></script>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
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
