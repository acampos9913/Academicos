/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servelets;

import PaqueteEntidades.entUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import paqueteNegocio.negUsuario;
        
public class sVerificarAcceso extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String Usuario = request.getParameter("txtUsuario");
            String Passw = request.getParameter("txtPassword");
            entUsuario atrU = negUsuario.VerificarAcceso(Usuario, Passw);
            if(atrU!=null){
            Cookie Sesion;
            Sesion=new Cookie("Sesion", Usuario);
            Sesion.setMaxAge(0);
                    Sesion.setMaxAge(-1);
                if(request.getParameter("Recordar")!=null){
                    
                Sesion.setMaxAge(60*60*24);
                Sesion.setPath("/");
            response.addCookie(Sesion);
                }
                /*else{
                    Sesion.setMaxAge(0);
                    Sesion.setMaxAge(-1);
                    Sesion.setPath("/");
            response.addCookie(Sesion);
                
                }*/
                //Nos instanciamos a la session en la variable ses
                HttpSession ses = request.getSession();
                ses.setAttribute("atrUsuario", atrU);
                   if(atrU.getTipo_usu().equalsIgnoreCase("Administrador")){
                   response.sendRedirect("fEmpleado.jsp");
                   }
                   else if(atrU.getTipo_usu().equalsIgnoreCase("Bibliotecario")){
                    response.sendRedirect("fEmpleado.jsp");
                    }
                   else{
                   response.sendRedirect("fLector.jsp");
                   }
            }else{
                response.sendRedirect("fLogin.jsp?Incorrecto=true");
            }
        } catch (Exception ex) {
            out.print("<script>alert('ERROR en Verificar Acceso')</script>");
        } finally {            
            out.close();
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
