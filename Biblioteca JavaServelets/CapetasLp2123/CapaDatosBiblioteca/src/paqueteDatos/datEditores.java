/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteDatos;

import PaqueteEntidades.entEditores;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class datEditores {
    public static ArrayList<entEditores> ListarEditores() throws Exception{

Connection cn = conexion.getConexion();

ArrayList<entEditores> Lista= null;

    try {
        CallableStatement cst= cn.prepareCall("{call paListarEditores()}");
        ResultSet tabla= cst.executeQuery();
           
        Lista = new ArrayList<entEditores>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
        while(tabla.next()){
        
            entEditores E= new entEditores();
            E.setCodigo_edi(tabla.getString("Codigo_edi"));
            E.setNom_edi(tabla.getString("Nom_edi"));
            E.setDireccion(tabla.getString("Direccion"));
            E.setEstado_Edi(tabla.getString("Estado_Edi"));
            
        Lista.add(E);
        
        } 
    
    } catch (Exception e) {
   throw e;
   
    }finally{cn.close();}
        return Lista;

}
    
    public static entEditores DevolverEditor(String id) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst= cn.prepareCall("{call paListarEditoresXId(?)}");
            cst.setString(1, id);//quiere decir que es el unico parametro  que estamos mandando                 
            ResultSet tabla= cst.executeQuery();
            entEditores E = new entEditores();
            if(tabla.next()){
            E.setCodigo_edi(tabla.getString("Codigo_edi"));
            E.setNom_edi(tabla.getString("Nom_edi"));
            E.setDireccion(tabla.getString("Direccion"));
            } 
            return E;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
    
    public static int InsertarEditores(entEditores _E) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarEditores(?,?,?)}");
            cst.setString(1, _E.getCodigo_edi());
            cst.setString(2, _E.getNom_edi());
            cst.setString(3, _E.getDireccion());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
  
public static int actualizarEditores(entEditores _E) throws Exception {
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paEditarEditores(?,?,?)}");
            cst.setString(1, _E.getCodigo_edi());
            cst.setString(2, _E.getNom_edi());
            cst.setString(3, _E.getDireccion());
            int i = cst.executeUpdate();
            return i;
        } catch (SQLException e) {
            throw e;
        } finally {
            cn.close();
        }
    }
}
    
