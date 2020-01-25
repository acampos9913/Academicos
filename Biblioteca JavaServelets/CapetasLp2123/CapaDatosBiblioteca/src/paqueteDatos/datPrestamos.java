/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteDatos;

import PaqueteEntidades.entDetallePrestamo;
import PaqueteEntidades.entDevolucion;
import PaqueteEntidades.entEntrega;
import PaqueteEntidades.entLibros;
import PaqueteEntidades.entPrestamo;
import PaqueteEntidades.entUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class datPrestamos {
    
    public static ArrayList<entPrestamo> ListarPrestamoXEstado(String Estado_Pre,String Usuario_Pre) throws Exception{
        Connection cn = conexion.getConexion();
        ArrayList<entPrestamo> Lista= null;
        try {
            CallableStatement cst= cn.prepareCall("{call paListarPrestamos(?,?)}");
            cst.setString(1, Estado_Pre);
            cst.setString(2, Usuario_Pre);
            
            ResultSet tabla= cst.executeQuery();
            
            Lista = new ArrayList<entPrestamo>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
            while(tabla.next()){
                entPrestamo p = new entPrestamo();
                p.setCodigo_pre(tabla.getString("Codigo_pre"));
                p.setEstado_Prestamo(tabla.getString("Estado_Prestamo"));
                p.setFechaLimite_devolucion(tabla.getString("FechaLimite_devolucion"));
                p.setFecha_prestamo(tabla.getString("Fecha_prestamo"));
                 p.setCodigo_lib(tabla.getString("Contar"));
                 p.setCodigo_usu_lector(tabla.getString("Codigo_usu_lector"));
                 Lista.add(p);
            } 
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
        return Lista;
    }
    
    public static ArrayList<entDetallePrestamo> BuscarDetallePrestamo(String IdPrestamo)throws Exception{
        Connection cn = conexion.getConexion();
        try{
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT * FROM DPrestamo where Codigo_pre='"+IdPrestamo+"'");
            ArrayList<entDetallePrestamo> Lista = new ArrayList<entDetallePrestamo>();
            while(tabla.next()){
                entDetallePrestamo xyz = new entDetallePrestamo();
                xyz.setCodigo_lib(tabla.getString("Codigo_lib"));
                xyz.setCodigo_pre(tabla.getString("Codigo_pre"));
                Lista.add(xyz);
            }
            return Lista;
        }catch(Exception e){
            throw e;
        }finally{
            cn.close();            
        }
    }
    
   public static boolean InsertarPrestamo(entPrestamo _P) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarPrestamo(?,?,?)}");
            cst.setString(1, _P.getCodigo_pre());
            cst.setString(3, _P.getFechaLimite_devolucion());
            cst.setString(2, _P.getCodigo_usu_lector());
            
            ArrayList<entDetallePrestamo> Det = _P.getDetalle();
             for(int i=0;i<Det.size();i++){
                entDetallePrestamo d = Det.get(i);
                InsertarDetPrestamo(_P.getCodigo_pre(),d);
            }
            cst.executeUpdate();
            return true;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
   
   public static int InsertarDetPrestamo(String idPrestamo,entDetallePrestamo d) throws Exception{
        Connection cn = conexion.getConexion();
        try{
            CallableStatement stm = cn.prepareCall("{call spInserDetalle(?,?)}");
            stm.setString(1, idPrestamo);
            stm.setString(2, d.getCodigo_lib());
            
            int i = stm.executeUpdate();
            
            return i;
        }catch(Exception e){
            throw e;            
        }finally{cn.close();}  
    }
   
   public static int ActualizarPrestamo(entPrestamo _P,String tipo) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paActualizarPrestamo(?,?)}");
            cst.setString(1, _P.getCodigo_pre());
            cst.setString(2, tipo);
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
   
   public static int InsertarEntrega(entEntrega _P) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarEntrega(?,?,?)}");
            cst.setString(1, _P.getCodigo_ent());
            cst.setString(2, _P.getCodigo_pre());
            cst.setString(3, _P.getCodigo_usu_emp());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
   
   public static int InsertarDevolucion(entDevolucion _P) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarDevolucion(?,?,?)}");
            cst.setString(1, _P.getCodigo_dev());
            cst.setString(2, _P.getCodigo_pre());
            cst.setString(3, _P.getCodigo_usu_emp());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
}