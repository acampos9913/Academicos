package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import paqueteDatos.datUsuario;
import PaqueteEntidades.entUsuario;
import java.util.Hashtable;
import javazoom.upload.UploadFile;
import javazoom.upload.MultipartFormDataRequest;
import paqueteDatos.datGenerador;
import PaqueteEntidades.entGenerador;

public final class Registrarse_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"Estilos/jquery-ui.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"Estilos/cssUsuarios.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"Estilos/bootstrap.min.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"Estilos/jquery.ui.datepicker.css\"/>\n");
      out.write("        <script src=\"Scripts/jquery-1.9.1.js\"></script>\n");
      out.write("        <script src=\"Scripts/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"Scripts/jquery.ui.datepicker-es.min.js\"></script>\n");
      out.write("        <script src=\"Scripts/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"Scripts/jsUsuarios.js\"></script>\n");
      out.write("        <script>\n");
      out.write("$(function () {\n");
      out.write("$.datepicker.setDefaults($.datepicker.regional[\"es\"]);\n");
      out.write("$(\"#datepicker\").datepicker({\n");
      out.write("dateFormat: 'dd-mm-yy'\n");
      out.write("});\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("<style>\n");
      out.write("            body{\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Biblioteca</title>\n");
      out.write("    </head><h1 style=\"text-align: center\">Registrate en la biblioteca</h1>\n");
      out.write("    <hr width=\"2px\">\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        </br>\n");
      out.write("        <div style=\"margin: 0 auto;border: solid #008000 1px;width: 400px;height: 600px; background-color: white;border: 1px\">\n");
      out.write("            \n");
      out.write("            ");

                String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
                String Mensaje="";

        entGenerador Gen=new entGenerador();
        Gen=datGenerador.GenUsuario();
        int Ultimo = Gen.getUltimo() + 1;
        String cadcodido = "USU000";
        String cadXCOD = "" + Ultimo;
        String Codigo = cadcodido.substring(0, cadcodido.length() - cadXCOD.length()) + Ultimo;
            
        String btnGuardar="";
        String cboUsuario="Lector";
        btnGuardar = request.getParameter("btnGuardar");
        String txtCodigoLibro=Codigo.toString();
                String txtUsuario=request.getParameter("txtUsuario");
         if(request.getParameter("btnCancelar")!=null){
         response.sendRedirect("index.html");
         }
        if(request.getParameter("btnGuardar")!=null){
            String Usuario = request.getParameter("txtUsuario");
            String Email = request.getParameter("txtCorreoUsuario");
            entUsuario atrE = datUsuario.EmailUsuario(Email);
            entUsuario atrU = datUsuario.Usuario(Usuario);
            if(atrU!=null){
            Mensaje="El usuario ya existe";
            }else{
                if(atrE!=null){
                Mensaje="El Email ya existe";
                }else{
                entUsuario Usu =new entUsuario();
                Usu.setCodigo_usu(Codigo.toString());
                Usu.setNombres_sesison_usu(txtUsuario);
                Usu.setPsw_sesesion_us(request.getParameter("txtContrasena"));
                Usu.setDocumentoDeIdentidad(request.getParameter("txtDocumentodeIdentidad"));
                Usu.setNombres_usu(request.getParameter("txtNombresUsuario"));
                Usu.setApellidosPaterno_usu(request.getParameter("txtApellidoPaternp"));
                Usu.setApellidosMaterno_usu(request.getParameter("txtApellidomaterno"));
                Usu.setTelelefono_usu(request.getParameter("txtTelefonoUsuario"));
                Usu.setDireccion_usu(request.getParameter("txtDireccionUsuario"));
                Usu.setCorreoElectronico_usu(request.getParameter("txtCorreoUsuario"));
                Usu.setFacha_nac_usu(request.getParameter("txtFechaNaciUsusario"));
                Usu.setImagen("default.png");
                Usu.setTipo_usu(cboUsuario);

                try{
                    int i = datUsuario.InsertarUsuarios(Usu);
                    if(i>0){
                        response.sendRedirect("fLogin.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>Error</script>");
                }
                }
            }
      
            }
    
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("        <div style=\"float: left\">\n");
      out.write("        <div class=\"InputsDiv\">Usuario: </div><div class=\"InputsDiv\"><input type=\"text\" required=\"true\" name=\"txtUsuario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Contraseña: </div><div class=\"InputsDiv\"><input type=\"password\" required=\"true\" name=\"txtContrasena\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">DNI: </div><div class=\"InputsDiv\"><input type=\"text\" required=\"true\" name=\"txtDocumentodeIdentidad\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Nombres: </div><div class=\"InputsDiv\"><input type=\"text\" required=\"true\" name=\"txtNombresUsuario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Apellido Paterno: </div><div class=\"InputsDiv\"><input type=\"text\" name=\"txtApellidoPaternp\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Apellido Materno: </div><div class=\"InputsDiv\"><input type=\"text\" name=\"txtApellidomaterno\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Telefono: </div><div class=\"InputsDiv\"><input type=\"text\" name=\"txtTelefonoUsuario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Direccion: </div><div class=\"InputsDiv\"><input type=\"text\" name=\"txtDireccionUsuario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Correo Electronico: </div><div class=\"InputsDiv\"><input type=\"email\" required=\"true\" name=\"txtCorreoUsuario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Fecha de Nacimiento: </div><div class=\"InputsDiv\"><input id=\"datepicker\" type=\"date\" name=\"txtFechaNaciUsusario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\"><input type=\"submit\" value=\"Guardar\"name=\"btnGuardar\"/></div>\n");
      out.write("        </form>\n");
      out.write("        <form>\n");
      out.write("        <div class=\"InputsDiv\"><input type=\"submit\" value=\"Cancelar\"name=\"btnCancelar\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <p style=\"color: red\">* ");
      out.print(Mensaje);
      out.write("</p>\n");
      out.write("        </form>\n");
      out.write("        </div>\n");
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
