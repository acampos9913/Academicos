package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class fLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("    <title>Inicar Sesion</title>\n");
      out.write("    <link href=\"Estilos/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"Estilos/cssIniciarSesion.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"Estilos/jquery-ui.css\" rel=\"stylesheet\">\n");
      out.write("    <script type=\"text/javascript\" src=\"Scripts/jquery-ui.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"Scripts/jquery-1.9.1.js\"></script>\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("    .Spacioador {\n");
      out.write("\tposition: relative;\n");
      out.write("\twidth: auto;\n");
      out.write("\theight:20px;\n");
      out.write("\tz-index: 1;\n");
      out.write("}\n");
      out.write("    </style>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("      ");

        String Usuario="";
        Cookie[] miCpkie=request.getCookies();
      if(miCpkie!=null){
        for(int i=0;i<miCpkie.length;i++){
            Cookie miCo=miCpkie[i];
            if(miCo.getName().equals("Sesion")){
                Usuario=miCo.getValue();
            }
        }
      }
      
      if(request.getParameter("Incorrecto")!=null){
      out.print("<script>alert('Datos incorrectos')</script>");
      }
      
      
      out.write("\n");
      out.write("      <form action=\"sVerificarAcceso\">\n");
      out.write("        <div class=\"form-signin-heading\">Acceso</div>\n");
      out.write("        <input type=\"text\" class=\"form-control\" name=\"txtUsuario\"placeholder=\"Usuario\" required autofocus value=\"");
      out.print(Usuario);
      out.write("\">\n");
      out.write("        <div class=\"Spacioador\"></div>\n");
      out.write("        <input type=\"password\" class=\"form-control\" name=\"txtPassword\" placeholder=\"Contraseña\" required>\n");
      out.write("        <label class=\"checkbox\">\n");
      out.write("            <input type=\"checkbox\" value=\"Recordando\" name=\"Recordar\">Recordar acceso</label>\n");
      out.write("        <button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\" name=\"btnIngresar\">Ingresar</button>\n");
      out.write("        <div class=\"Spacioador\"></div>\n");
      out.write("        <a href=\"recuperarpass.jsp\"><div class=\"Spacioador\">Olvidaste tu contraseña</div></a>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("      </form>  \n");
      out.write("      <p align=\"center\">Para Poder Reservar Libros Necesitas Registrarte  <a href=\"Registrarse.jsp\">Registrate</a></p>\n");
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
