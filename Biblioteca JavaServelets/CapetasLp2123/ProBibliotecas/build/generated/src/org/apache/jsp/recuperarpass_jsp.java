package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import PaqueteMensaje.Mensaje;
import paqueteDatos.datUsuario;
import paqueteNegocio.negUsuario;
import PaqueteEntidades.entUsuario;

public final class recuperarpass_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"Estilos/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                background-color: #737373;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
if(request.getParameter("btnEnviar")!=null){
            String Email = request.getParameter("txtEmailRecuperar");
            entUsuario atrU = datUsuario.EmailUsuario(Email);
            if(atrU!=null){
            Mensaje e = new Mensaje("proyectobibliotecario@gmail.com","2b1@AA/#","D:\\aaa.jpg","aaa.jpg",Email,"Recuperando","Su contraseña es:"+atrU.getPsw_sesesion_us());
        if (e.sendMail()){
            response.sendRedirect("fLogin.jsp");
        }else{
            out.print("Error en el envio");
        }
            }else{
                out.print("<script>alert('el emaail ingresado no es Valido')</script>");
            }
        }
      out.write("\n");
      out.write("        <form>\n");
      out.write("        <div style=\"margin: 0 auto;width: 900px;height: 300px; background-color: white;text-align: center\">\n");
      out.write("            <h1>Recuperar contraseña</h1>\n");
      out.write("            <div style=\"clear: both;height: 15px\"></div>\n");
      out.write("            <div>Correo Electronico</div>\n");
      out.write("            <input type=\"email\" required=\"true\" name=\"txtEmailRecuperar\" class=\"form-inline\"/>\n");
      out.write("            <input type=\"submit\" name=\"btnEnviar\" class=\"btn-primary btn-success\"/>\n");
      out.write("        </div>\n");
      out.write("            </form>\n");
      out.write("    </body>\n");
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
