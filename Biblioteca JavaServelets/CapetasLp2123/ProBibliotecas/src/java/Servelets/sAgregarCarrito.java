/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servelets;

import PaqueteEntidades.entLibros;
import PaqueteEntidades.entUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import paqueteDatos.datLibros;
import paqueteDatos.datUsuario;
        
public class sAgregarCarrito extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int ReglaNeDia=3;
            Date a=new Date();
            a.setDate(a.getDate()+ReglaNeDia);
            //DateFormat dt=DateFormat.getDateInstance(3);
            //String FechaIncial=dt.format(a);
            a.setDate(a.getDate()+ReglaNeDia);
            ArrayList<Object> Carrito = null;
            HttpSession ses =  request.getSession();
            if(ses.getAttribute("carrito")!=null){
                //Si ya existe el atributo carrito, vaciamos el contenido
                //en la variable carrito
                Carrito = (ArrayList<Object>)ses.getAttribute("carrito");
            }else{
                //si no existe el atributo, terminamos de instanciar
                //la variable carrito (vacia)
                Carrito = new ArrayList<Object>();
            }
           String aa="aa";
           
           entUsuario Usu = (entUsuario)ses.getAttribute("atrUsuario");
           
            if(request.getParameter("")!=null){}
            String idProducto =request.getParameter("lvidProducto");
            entLibros Li=new entLibros();
            try {
                Li=datLibros.DevolverLibro(idProducto);
            } catch (Exception ex) {
                Logger.getLogger(sAgregarCarrito.class.getName()).log(Level.SEVERE, null, ex);
            }
            entUsuario Users=new entUsuario();
            try {
                Users=datUsuario.Prestamos(Usu.getCodigo_usu());
            } catch (Exception ex) {
                Logger.getLogger(sAgregarCarrito.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(Users==null){
                if(Carrito.size()<=2){
                if (VerificarSiExiste(Carrito, idProducto)){
                response.sendRedirect("fPrestamo.jsp?yaagrego=1");
                return;
            }
                if(Li.getStock()>0){
            String lvTitulo =Li.getTitulo_lib();
            String lvAutores =Li.getE_Autores().getNombres_aut();
            String lvDescripcion =Li.getDecripcion_lib();

            //String idLibro1 =idLibroP;
            Object[] o = new Object[]{idProducto,lvTitulo,lvAutores,lvDescripcion};
            Carrito.add(o);
            ses.setAttribute("carrito", Carrito);
            response.sendRedirect("fPrestamo.jsp");
            }
                else{
                response.sendRedirect("fPrestamo.jsp?yaagrego=2");
                }
            }
            else{
            response.sendRedirect("fPrestamo.jsp?yaagrego=3");
            }
            
            }
            else{
            response.sendRedirect("fPrestamo.jsp?yaagrego=4");
            }
        } finally {            
            out.close();
        }
    }
    
    private boolean VerificarSiExiste(ArrayList<Object> Carrito, String idProd){
        try {
            for(int i=0; i<Carrito.size();i++){
                Object[] o= (Object[])Carrito.get(i);
                if(o[0].equals(idProd)){
                    return true;
                } 
             } 
            return false;
          } catch (Exception e) {
            return true;
       }      
    }   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
