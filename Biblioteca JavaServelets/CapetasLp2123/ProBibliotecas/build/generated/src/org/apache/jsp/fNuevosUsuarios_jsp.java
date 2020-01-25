package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import paqueteDatos.datUsuario;
import java.util.Hashtable;
import javazoom.upload.UploadFile;
import javazoom.upload.MultipartFormDataRequest;
import paqueteDatos.datGenerador;
import PaqueteEntidades.entGenerador;
import paqueteNegocio.negAutores;
import PaqueteEntidades.entAutores;
import PaqueteEntidades.entUsuario;
import paqueteNegocio.negLibros;
import PaqueteEntidades.entLibros;
import paqueteNegocio.negCategorias;
import PaqueteEntidades.entCategoria;
import PaqueteEntidades.entCategoria;
import java.util.ArrayList;

public final class fNuevosUsuarios_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <link href=\"Estilos/cssUsuarios.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"Estilos/jquery-ui-1.10.4.css\"/>\n");
      out.write("        <script src=\"Scripts/jquery-1.9.1.js\"></script>\n");
      out.write("        <script src=\"Scripts/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"Scripts/jquery.min.js\"></script>\n");
      out.write("    <script src=\"Scripts/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"Scripts/offcanvas.js\"></script>\n");
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
      out.write("            \n");
      out.write("            ");

                String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
                
            HttpSession ses = request.getSession();
            entUsuario atrU = (entUsuario)ses.getAttribute("atrUsuario");            
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
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("      <div class=\"row row-offcanvas row-offcanvas-right\">\n");
      out.write("        <div class=\"col-xs-12 col-sm-9\">\n");
      out.write("            <a href=\"Nuevo/NuevoAutores.jsp\"><div>Nuevo</div></a>\n");
      javazoom.upload.UploadBean upBean = null;
      synchronized (_jspx_page_context) {
        upBean = (javazoom.upload.UploadBean) _jspx_page_context.getAttribute("upBean", PageContext.PAGE_SCOPE);
        if (upBean == null){
          upBean = new javazoom.upload.UploadBean();
          _jspx_page_context.setAttribute("upBean", upBean, PageContext.PAGE_SCOPE);
          out.write("\n");
          out.write("            ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("upBean"), "folderstore",
direccion);
          out.write("\n");
          out.write("    ");
          org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("upBean"), "whitelist", "*.jpg,*.gif,*.png", null, null, false);
          out.write("\n");
          out.write("    ");
          org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("upBean"), "overwritepolicy", "nametimestamp", null, null, false);
          out.write('\n');
        }
      }
      out.write("\n");
      out.write("        ");

        entGenerador Gen=new entGenerador();
        Gen=datGenerador.GenUsuario();
        int Ultimo = Gen.getUltimo() + 1;
        String cadcodido = "USU000";
        String cadXCOD = "" + Ultimo;
        String Codigo = cadcodido.substring(0, cadcodido.length() - cadXCOD.length()) + Ultimo;
            if (MultipartFormDataRequest.isMultipartFormData(request))
    {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        String btnGuardar="";
        String cboUsuario=mrequest.getParameter("cboUsuario");
        btnGuardar = mrequest.getParameter("btnGuardar");
        String txtCodigoLibro=Codigo.toString();
                String txtUsuario=mrequest.getParameter("txtUsuario");
        if(btnGuardar!=null){
            boolean subido=false;
            UploadFile file=null;
            String nombreImagen="default.jpg";
            Hashtable files = mrequest.getFiles();
            //java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyMMddHHmmss");
             String archivo = ((UploadFile) mrequest.getFiles().get("uploadfile")).getFileName();
             if(archivo!=null){   
             int posicionPunto = archivo.indexOf(".");
                            nombreImagen = txtCodigoLibro;
                            String extension = archivo.substring(posicionPunto);
                            //nombreImagen = nombreImagen + formato.format(new java.util.Date());
                            nombreImagen = nombreImagen + extension;
                            ((UploadFile) mrequest.getFiles().get("uploadfile")).setFileName(nombreImagen);
                            file = (UploadFile) files.get("uploadfile");

                            subido = true;
                            try
                            {
                               
                                upBean.store(mrequest, "uploadfile");
                                
                                
                            }
                            catch(Exception e)
                            {
                                subido = false;
                            }
             }
             entUsuario Usu =new entUsuario();
                Usu.setCodigo_usu(Codigo.toString());
                Usu.setNombres_sesison_usu(txtUsuario);
                Usu.setPsw_sesesion_us(mrequest.getParameter("txtContraseña"));
                Usu.setDocumentoDeIdentidad(mrequest.getParameter("txtDocumentodeIdentidad"));
                Usu.setNombres_usu(mrequest.getParameter("txtNombresUsuario"));
                Usu.setApellidosPaterno_usu(mrequest.getParameter("txtApellidoPaternp"));
                Usu.setApellidosMaterno_usu(mrequest.getParameter("txtApellidomaterno"));
                Usu.setTelelefono_usu(mrequest.getParameter("txtTelefonoUsuario"));
                Usu.setDireccion_usu(mrequest.getParameter("txtDireccionUsuario"));
                Usu.setCorreoElectronico_usu(mrequest.getParameter("txtCorreoUsuario"));
                Usu.setFacha_nac_usu(mrequest.getParameter("txtFechaNaciUsusario"));
                Usu.setImagen(nombreImagen);
                Usu.setTipo_usu(cboUsuario);
             
                
 
                try{
                    int i = datUsuario.InsertarUsuarios(Usu);
                    if(i>0){
                        out.print("<script>Se edito correctamente el producto</script>");
                        response.sendRedirect("fUsuarios.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR AL EDITAR</script>");
                }
                            
            }
        else{
        out.print("Nada");
        }
    }
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form enctype=\"multipart/form-data\"  method=\"post\">\n");
      out.write("        <div style=\"float: left\">\n");
      out.write("<div class=\"InputsDiv\">Usuario: </div><div class=\"InputsDiv\">");
      out.print(Codigo);
      out.write("</div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Usuario: </div><div class=\"InputsDiv\"><input type=\"text\" required=\"true\" name=\"txtUsuario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Contraseña: </div><div class=\"InputsDiv\"><input type=\"password\" required=\"true\" name=\"txtContraseña\"/></div>\n");
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
      out.write("        <div class=\"InputsDiv\">Fecha de Nacimiento: </div><div class=\"InputsDiv\"><input id=\"datepicker\" type=\"text\" name=\"txtFechaNaciUsusario\"/></div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\">Tipo de usuario: </div><div class=\"InputsDiv\"><select name=\"cboUsuario\">\n");
      out.write("                <option value=\"Administrador\">Administrador</option>\n");
      out.write("                <option value=\"Bibliotecario\">Bibliotecario</option>\n");
      out.write("            </select></div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div style=\"float: left; margin-left: 40px\">\n");
      out.write("            \n");
      out.write("            <div class=\"contenedor\">\n");
      out.write("                <div id=\"marcoVistaPrevia\">\n");
      out.write("                    <img id=\"vistaPrevia\" src=\"./Imagenes/default.png\" alt=\"\" width=\"100px\" height=\"120px\" />\n");
      out.write("                    <input type=\"hidden\" value=\"./Imagenes/default.png\" name=\"Nada\" id=\"Nada\"/>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"EspaciadorDiv\"></div>\n");
      out.write("            <div id='botonera'>\n");
      out.write("                <input id=\"archivo\" name=\"uploadfile\" type=\"file\" accept=\"image/*\"/>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"EspaciadorDiv\"></div>\n");
      out.write("        <div class=\"InputsDiv\"><input type=\"submit\" value=\"Guardar\"name=\"btnGuardar\"/></div>\n");
      out.write("        <div class=\"InputsDiv\"><input type=\"submit\" value=\"Cancelar\"name=\"\"/></div>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-xs-6 col-sm-3 sidebar-offcanvas\" id=\"sidebar\" role=\"navigation\">\n");
      out.write("          <div class=\"list-group\">\n");
      out.write("              <a href=\"fEmpleado.jsp\" class=\"list-group-item\">Inicio</a>\n");
      out.write("              <a href=\"fPrestamosUsu.jsp\" class=\"list-group-item\">Prestamos</a>\n");
      out.write("             ");
 HttpSession SMenu = request.getSession();
            entUsuario Emp = (entUsuario)SMenu.getAttribute("atrUsuario");            
            if(Emp.getTipo_usu().equals("Bibliotecario") &&Emp!=null){
      out.write("\n");
      out.write("              <a href=\"fLibros.jsp\" class=\"list-group-item\">Libros</a>\n");
      out.write("              <a href=\"fAutores.jsp\" class=\"list-group-item\">Autores</a>\n");
      out.write("              <a href=\"fEditores.jsp\" class=\"list-group-item\">Editores</a>\n");
      out.write("              <a href=\"fCategorias.jsp\" class=\"list-group-item\">Categorias</a>\n");
      out.write("              <a href=\"fUsuarios.jsp\" class=\"list-group-item active\">Usuarios</a>\n");
      out.write("              ");

            }else{
              
      out.write("\n");
      out.write("              <a href=\"fUsuarios.jsp\" class=\"list-group-item active\">Usuarios</a>\n");
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
      out.write("    <script src=\"Scripts/jquery.ui.datepicker.js\"></script>\n");
      out.write("    <script src=\"Scripts/bootstrap.min.jss\"></script>\n");
      out.write("    <script src=\"Scripts/offcanvas.js\"></script>\n");
      out.write("    <script src=\"Scripts/jsUsuarios.js\"></script>\n");
      out.write("    <script src=\"Scripts/jquery-1.9.1.js\"></script>\n");
      out.write("    <script src=\"Scripts/jquery-ui.js\"></script>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
