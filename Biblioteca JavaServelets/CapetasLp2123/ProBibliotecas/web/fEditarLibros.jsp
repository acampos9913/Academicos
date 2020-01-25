<%-- 
    Document   : fEditarLibros
    Created on : 16-jul-2014, 15:09:12
    Author     : Administrador
--%>

<%@page import="java.io.File"%>
<%@page import="paqueteDatos.datEditores"%>
<%@page import="paqueteDatos.datAutores"%>
<%@page import="paqueteDatos.datCategorias"%>
<%@page import="PaqueteEntidades.entUsuario"%>
<%@page import="paqueteDatos.datLibros"%>
<%@page import="PaqueteEntidades.entEditores"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="paqueteNegocio.negAutores"%>
<%@page import="PaqueteEntidades.entAutores"%>
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
                String direccion = request.getSession().getServletContext().getRealPath("Imagenes/");
                
            HttpSession ses = request.getSession();
            entUsuario atrU = (entUsuario)ses.getAttribute("atrUsuario");            
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
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
    <jsp:setProperty name="upBean" property="folderstore" value="<%=direccion%>" />
    <jsp:setProperty name="upBean" property="whitelist" value="*.jpg,*.gif,*.png" />
    <jsp:setProperty name="upBean" property="overwritepolicy" value="nametimestamp"/>
</jsp:useBean>
        <%
entLibros L = new entLibros();
            if(request.getParameter("IdLibro")!=null){
                String id = request.getParameter("IdLibro");
                L = datLibros.DevolverLibro(id);
            }

            if (MultipartFormDataRequest.isMultipartFormData(request))
    {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        String btnGuardar="";
        btnGuardar = mrequest.getParameter("btnGuardar");
        String txtCodigoLibro=mrequest.getParameter("txtCodigoLib");
                String txtAutorLibro=mrequest.getParameter("cboAutor");
                String txtCategoriaLibro=mrequest.getParameter("cboCategoria");
                String txtEditroLibro=mrequest.getParameter("cboEditor");
                int txtEjemplares=Integer.parseInt( mrequest.getParameter("txtEjemplares"));
        if(btnGuardar!=null){
            boolean subido=false;
            UploadFile file=null;
            String nombreImagen=L.getImagen_lib();
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
                              File a=new File(direccion, nombreImagen);
                                if(a.exists()){
                                a.delete();
                                upBean.store(mrequest, "uploadfile");
                                }
                                else{
                                upBean.store(mrequest, "uploadfile");
                                }
                            }
                            catch(Exception e)
                            {
                                subido = false;
                            }
             }
                entLibros Lib =new entLibros();
                Lib.setCodigo_lib(txtCodigoLibro);
                Lib.setTitulo_lib(mrequest.getParameter("txtTituloLibro"));
                Lib.setDecripcion_lib(mrequest.getParameter("txtDescripcionLibro"));
                entAutores A = new entAutores();
                    A.setCodigo_aut(txtAutorLibro);
                entCategoria C = new entCategoria();
                    C.setCodigo_gen(txtCategoriaLibro);
                entEditores E = new entEditores();
                    E.setCodigo_edi(txtEditroLibro);
                Lib.setEjemplares_lib(txtEjemplares);
                Lib.setImagen_lib(nombreImagen);
                Lib.setObservaciones(mrequest.getParameter("txtObservacionesLibros"));
                Lib.setStock(txtEjemplares);
                Lib.setE_Autores(A);
                Lib.setE_Catewgoria(C);
                Lib.setE_Editores(E);
                try{
                    int i = datLibros.ActualizarLibros(Lib);
                    if(i>0){
                        //out.print("<script>Se edito correctamente el producto</script>");
                        response.sendRedirect("fLibros.jsp");
                    }
                }catch(Exception e){
                    out.print("<script>ERROR</script>");
                }
                            
            }
        else{
        out.print("Nada");
        }
    }
        %>
        <form enctype="multipart/form-data"  method="post">
        <div style="float: left">
            <input type="hidden" name="txtCodigoLib" value="<%=L.getCodigo_lib()%>"/>
        <div class="InputsDiv">Codigo: </div><div class="InputsDiv"><%=L.getCodigo_lib()%></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Titulo: </div><div class="InputsDiv"><input type="text" name="txtTituloLibro" value="<%=L.getTitulo_lib()%>"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Descripcion: </div><div class="InputsDiv"><input type="text" name="txtDescripcionLibro" value="<%=L.getDecripcion_lib()%>"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Autor: </div><div class="InputsDiv"><select name="cboAutor" >
                    <%
                        if(request.getParameter("IdLibro")!=null){
                            ArrayList<entAutores> Lista= datAutores.ListarAutores();
                            for(int i=0;i< Lista.size();i++){
                                if(Lista.get(i).getCodigo_aut()==L.getE_Autores().getCodigo_aut()){
                                    out.print("<option value="+Lista.get(i).getCodigo_aut()+
                                        " selected>"+ 
                                        Lista.get(i).getNombres_aut()+"</option>");                            
                                }else{
                                    out.print("<option value="+Lista.get(i).getCodigo_aut()+">"+ 
                                        Lista.get(i).getNombres_aut()+"</option>");
                                }
                            }
                         }
                    %>        
                        </select></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Editor: </div><div class="InputsDiv"><select name="cboEditor" >
                    <%
                        if(request.getParameter("IdLibro")!=null){
                            ArrayList<entEditores> Lista2= datEditores.ListarEditores();
                            for(int i=0;i< Lista2.size();i++){
                                if(Lista2.get(i).getCodigo_edi()==L.getE_Editores().getCodigo_edi()){
                                    out.print("<option value="+Lista2.get(i).getCodigo_edi()+
                                        " selected>"+ 
                                        Lista2.get(i).getNom_edi()+"</option>");                            
                                }else{
                                    out.print("<option value="+Lista2.get(i).getCodigo_edi()+">"+ 
                                        Lista2.get(i).getNom_edi()+"</option>");
                                }
                            }
                         }
                    %>        
                        </select></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Categoria: </div><div class="InputsDiv"><select name="cboCategoria" >
                    <%
                        if(request.getParameter("IdLibro")!=null){
                            ArrayList<entCategoria> Lista3= datCategorias.ListarCategorias();
                            for(int i=0;i< Lista3.size();i++){
                                if(Lista3.get(i).getCodigo_gen()==L.getE_Catewgoria().getCodigo_gen()){
                                    out.print("<option value="+Lista3.get(i).getCodigo_gen()+
                                        " selected>"+ 
                                        Lista3.get(i).getNombres_gen()+"</option>");                            
                                }else{
                                    out.print("<option value="+Lista3.get(i).getCodigo_gen()+">"+ 
                                        Lista3.get(i).getNombres_gen()+"</option>");
                                }
                            }
                         }
                    %>        
                        </select></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Ejemplares: </div><div class="InputsDiv"><input type="text" name="txtEjemplares" value="<%=L.getEjemplares_lib()%>"/></div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv">Observaciones: </div><div class="InputsDiv"><input type="text" name="txtObservacionesLibros" value="<%=L.getObservaciones()%>"/></div>
        </div>
        <div style="float: left; margin-left: 40px">
            
            <div class="contenedor">
                <div id="marcoVistaPrevia">
                <img id="vistaPrevia" src="./Imagenes/<%=L.getImagen_lib()%>" alt="" width="100px" height="120px"/>
                <input type="hidden" value="./Imagenes/<%=L.getImagen_lib()%>" name="Nada" id="Nada"/>
            </div>
            </div>
            <div class="EspaciadorDiv"></div>
            <div id='botonera'>
                <input id="archivo" name="uploadfile" type="file" accept="image/*"/>
            </div>
        </div>
        <div class="EspaciadorDiv"></div>
        <div class="InputsDiv"><input type="submit" value="Guardar"name="btnGuardar"/></div>
        </form>

        </div>
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="list-group">
              <a href="fEmpleado.jsp" class="list-group-item">Inicio</a>
              <a href="fPrestamosUsu.jsp" class="list-group-item">Prestamos</a>
             <% HttpSession SMenu = request.getSession();
            entUsuario Emp = (entUsuario)SMenu.getAttribute("atrUsuario");            
            if(Emp.getTipo_usu().equals("Bibliotecario") &&Emp!=null){%>
              <a href="fLibros.jsp" class="list-group-item active">Libros</a>
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
    <script src="Scripts/bootstrap.min.jss"></script>
    <script src="Scripts/offcanvas.js"></script>
    <script src="Scripts/jsUsuarios.js"></script>
  </body>
</html>
