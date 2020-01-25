/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteDatos;

import PaqueteEntidades.entAutores;
import PaqueteEntidades.entPrestamo;
import PaqueteEntidades.entUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class datAutores {
   public static ArrayList<entAutores> ListarAutores() throws Exception{

Connection cn = conexion.getConexion();

ArrayList<entAutores> Lista= null;

    try {
        CallableStatement cst= cn.prepareCall("{call paListarAutores()}");
        ResultSet tabla= cst.executeQuery();
           
        Lista = new ArrayList<entAutores>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
        while(tabla.next()){
        
            entAutores A= new entAutores();

            A.setCodigo_aut(tabla.getString("Codigo_aut"));
            A.setNombres_aut(tabla.getString("Nombres_aut"));
            A.setApe_aut(tabla.getString("Ape_aut"));
            A.setEstado_aut(tabla.getString("Estado_aut"));
            
        Lista.add(A);
        
        } 
                
    } catch (Exception e) {
   throw e;
   
    }finally{cn.close();}
        return Lista;
}
   
   public static entAutores DevolverAutor(String id) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst= cn.prepareCall("{call paListarAutoresXid(?)}");
            cst.setString(1, id);//quiere decir que es el unico parametro  que estamos mandando                 
            ResultSet tabla= cst.executeQuery();
            entAutores A = new entAutores();
            if(tabla.next()){
                A.setCodigo_aut(tabla.getString("Codigo_aut"));
            A.setNombres_aut(tabla.getString("Nombres_aut"));
            A.setApe_aut(tabla.getString("Ape_aut"));
            } 
            return A;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    } 
   
   public static int InsertarAutores(entAutores _A) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInserAutores(?,?,?)}");
            cst.setString(1, _A.getCodigo_aut());
            cst.setString(2, _A.getNombres_aut());
            cst.setString(3, _A.getApe_aut());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
   
   public static int actualizarAutores(entAutores _A) throws Exception {
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paEditarAutores(?,?,?)}");
            cst.setString(1, _A.getCodigo_aut());
            cst.setString(2, _A.getNombres_aut());
            cst.setString(3, _A.getApe_aut());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) {
            throw e;
        } finally {
            cn.close();
        }
    }
}
    