
package paqueteDatos;

import PaqueteEntidades.entCategoria;
import java.sql.*;
import java.util.ArrayList;


public class datCategorias {
    
      
  public static ArrayList<entCategoria> ListarCategorias() throws Exception{

Connection cn = conexion.getConexion();

ArrayList<entCategoria> Lista= null;

    try {
        CallableStatement cst= cn.prepareCall("{call paListarCategoria()}");
        ResultSet tabla= cst.executeQuery();
           
        Lista = new ArrayList<entCategoria>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
        while(tabla.next()){
        
            entCategoria C= new entCategoria();

            C.setCodigo_gen(tabla.getString("Codigo_gen"));
            C.setNombres_gen(tabla.getString("Nombres_gen"));
            C.setDescripcion_gen(tabla.getString("Descripcion_gen"));
            C.setEstado_Cat(tabla.getString("Estado_Cat"));
            
        Lista.add(C);
        
        } 

    } catch (Exception e) {
   throw e;
   
    }finally{cn.close();}
        return Lista;

}
  
  public static entCategoria DevolverCategoria(String id) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst= cn.prepareCall("{call paListarCategoriaXId(?)}");
            cst.setString(1, id);//quiere decir que es el unico parametro  que estamos mandando                 
            ResultSet tabla= cst.executeQuery();
            entCategoria C = new entCategoria();
            if(tabla.next()){
            C.setCodigo_gen(tabla.getString("Codigo_gen"));
            C.setNombres_gen(tabla.getString("Nombres_gen"));
            C.setDescripcion_gen(tabla.getString("Descripcion_gen"));
            } 
            return C;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
  
public static int InsertarCategoria(entCategoria _C) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarCategorias(?,?,?)}");
            cst.setString(1, _C.getCodigo_gen());
            cst.setString(2, _C.getNombres_gen());
            cst.setString(3, _C.getDescripcion_gen());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
  
public static int actualizarCategorias(entCategoria _C) throws Exception {
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paEditarCategorias(?,?,?)}");
            cst.setString(1, _C.getCodigo_gen());
            cst.setString(2, _C.getNombres_gen());
            cst.setString(3, _C.getDescripcion_gen());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) {
            throw e;
        } finally {
            cn.close();
        }
    }
}
