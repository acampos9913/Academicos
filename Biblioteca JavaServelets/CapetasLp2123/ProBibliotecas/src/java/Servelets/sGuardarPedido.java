/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servelets;

import PaqueteEntidades.entDetallePrestamo;
import PaqueteEntidades.entGenerador;
import PaqueteEntidades.entPrestamo;
import PaqueteEntidades.entUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.text.DateFormat;
import paqueteDatos.datGenerador;
import paqueteDatos.datLibros;
import paqueteDatos.datPrestamos;
import paqueteNegocio.negPrestamo;

public class sGuardarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int ReglaNeDia=3;
            Date a=new Date();
            a.setDate(a.getDate()+ReglaNeDia);
            DateFormat dt=DateFormat.getDateInstance(3);
            String FechaVista=dt.format(a);
            entGenerador Gen=new entGenerador();
            entPrestamo P = new entPrestamo();
        Gen=datGenerador.GenPrestamo();
        int Ultimo = Gen.getUltimo() + 1;
        String cadcodido = "PRE000";
        String cadXCOD = "" + Ultimo;
        String Codigo = cadcodido.substring(0, cadcodido.length() - cadXCOD.length()) + Ultimo;
            //double Total = Double.parseDouble(request.getParameter("txtTotal"));
            HttpSession ses = request.getSession();
            //entUsuario c = (entUsuario)ses.getAttribute("cliente");
            //Comenzamos a armar el objeto pedido
            P.setFechaLimite_devolucion(FechaVista);
            P.setCodigo_pre(Codigo);
            entUsuario Usu = (entUsuario)ses.getAttribute("atrUsuario");
            //guardamos codigo del usuario
            P.setCodigo_usu_lector(Usu.getCodigo_usu());
            //Detalle del Pedido
            ArrayList<entDetallePrestamo> detallito = new ArrayList<entDetallePrestamo>();
                ArrayList<Object> det = (ArrayList<Object>)ses.getAttribute("carrito");
                for(int i=0;i<det.size();i++){
                    Object[] x = (Object[])det.get(i);
                    entDetallePrestamo d = new entDetallePrestamo();
                    d.setCodigo_lib(x[0].toString());
                    detallito.add(d);
                }
            P.setDetalle(detallito);
            boolean Inserto = negPrestamo.InsertarPrestamo(P);

            if(Inserto){
                //actualizar stock
                ArrayList<entDetallePrestamo> ListaDetalle = datPrestamos.BuscarDetallePrestamo(Codigo);
                for(int i=0;i<ListaDetalle.size();i++){

                    String d = ListaDetalle.get(i).getCodigo_lib();
                    datLibros.ActualizarStock(d, "");
                    }
                out.print("<script>alert('Su pedido se inserto Satisfactoriamente')</script>");
                ses.removeAttribute("carrito");
                response.sendRedirect("fHistorial.jsp");
            }
        }catch(Exception e){        
            out.print(e);
            e.getLocalizedMessage();
            e.getStackTrace();
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
