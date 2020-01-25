package paqueteDatos;

import PaqueteEntidades.entUsuario;
import java.sql.*;
import java.util.ArrayList;

public class datUsuario {
    public static entUsuario VerificarAcceso(String prmUser, 
                        String prmPass) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst= cn.prepareCall("{call paVerificarSession(?,?)}");
            cst.setString(1, prmUser);
            cst.setString(2, prmPass);
            ResultSet tabla= cst.executeQuery();
            entUsuario c= null;
            if(tabla.next()){
                c= new entUsuario();
                c.setCodigo_usu(tabla.getString("Codigo_usu"));
                //c.setNombres_sesison_usu(tabla.getString("Nombres_sesison_usu"));
                c.setDocumentoDeIdentidad(tabla.getString("DocumentoDeIdentidad"));
                c.setPsw_sesesion_us(tabla.getString("Psw_sesesion_us"));
                c.setNombres_usu(tabla.getString("Nombres_usu"));
                c.setApellidosPaterno_usu(tabla.getString("ApellidosPaterno_usu"));
                c.setApellidosMaterno_usu(tabla.getString("ApellidosMaterno_usu"));
                c.setTelelefono_usu(tabla.getString("Telelefono_usu"));
                c.setDireccion_usu(tabla.getString("Direccion_usu"));
                c.setCorreoElectronico_usu(tabla.getString("CorreoElectronico_usu"));
                c.setFecha_registro_usu(tabla.getString("Fecha_registro_usu"));
                c.setFacha_nac_usu(tabla.getString("Facha_nac_usu"));
                c.setEstado_Usuario(tabla.getString("Estado_Usuario"));
                c.setTipo_usu(tabla.getString("Tipo_usu"));
            }                 
            return c;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
    
    public static ArrayList<entUsuario> ListarUsuarios(String nombreUsuario,String tipoUsuario) throws Exception{
        Connection cn = conexion.getConexion();
        ArrayList<entUsuario> Lista= null;
        try {
            CallableStatement cst= cn.prepareCall("{call paListarUsuarios(?,?)}");
            cst.setString(1, nombreUsuario);
            cst.setString(2, tipoUsuario);
            
            ResultSet tabla= cst.executeQuery();
            
            Lista = new ArrayList<entUsuario>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
            while(tabla.next()){
                entUsuario U = new entUsuario();
                U.setCodigo_usu(tabla.getString("Codigo_usu"));
                U.setNombres_sesison_usu(tabla.getString("Nombres_sesison_usu"));
                U.setDocumentoDeIdentidad(tabla.getString("DocumentoDeIdentidad"));
                U.setPsw_sesesion_us(tabla.getString("Psw_sesesion_us"));
                U.setNombres_usu(tabla.getString("Nombres_usu"));
                U.setApellidosPaterno_usu(tabla.getString("ApellidosPaterno_usu"));
                U.setApellidosMaterno_usu(tabla.getString("ApellidosMaterno_usu"));
                U.setTelelefono_usu(tabla.getString("Telelefono_usu"));
                U.setDireccion_usu(tabla.getString("Direccion_usu"));
                U.setCorreoElectronico_usu(tabla.getString("CorreoElectronico_usu"));
                U.setFecha_registro_usu(tabla.getString("Fecha_registro_usu"));
                U.setFacha_nac_usu(tabla.getString("Facha_nac_usu"));
                U.setEstado_Usuario(tabla.getString("Estado_Usuario"));
                U.setTipo_usu(tabla.getString("Tipo_usu"));
                U.setImagen(tabla.getString("Imagen"));
                Lista.add(U);
            } 
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
        return Lista;
    }
    
    public static entUsuario DevolverUsuario(String id) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst= cn.prepareCall("{call paListarUsuariosXId(?)}");
            cst.setString(1, id);//quiere decir que es el unico parametro  que estamos mandando                 
            ResultSet tabla= cst.executeQuery();
            entUsuario U = new entUsuario();
            if(tabla.next()){
                U.setCodigo_usu(tabla.getString("Codigo_usu"));
                U.setNombres_sesison_usu(tabla.getString("Nombres_sesison_usu"));
                U.setDocumentoDeIdentidad(tabla.getString("DocumentoDeIdentidad"));
                U.setPsw_sesesion_us(tabla.getString("Psw_sesesion_us"));
                U.setNombres_usu(tabla.getString("Nombres_usu"));
                U.setApellidosPaterno_usu(tabla.getString("ApellidosPaterno_usu"));
                U.setApellidosMaterno_usu(tabla.getString("ApellidosMaterno_usu"));
                U.setTelelefono_usu(tabla.getString("Telelefono_usu"));
                U.setDireccion_usu(tabla.getString("Direccion_usu"));
                U.setCorreoElectronico_usu(tabla.getString("CorreoElectronico_usu"));
                U.setFecha_registro_usu(tabla.getString("Fecha_registro_usu"));
                U.setFacha_nac_usu(tabla.getString("Facha_nac_usu"));
                U.setEstado_Usuario(tabla.getString("Estado_Usuario"));
                U.setTipo_usu(tabla.getString("Tipo_usu"));
                U.setImagen(tabla.getString("Imagen"));
            } 
            return U;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
    
    public static int InsertarUsuarios(entUsuario _U) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarUsuario(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, _U.getCodigo_usu());
            cst.setString(2, _U.getDocumentoDeIdentidad());
            cst.setString(3, _U.getPsw_sesesion_us());
            cst.setString(4, _U.getNombres_usu());
            cst.setString(5, _U.getApellidosPaterno_usu());
            cst.setString(6, _U.getApellidosMaterno_usu());
            cst.setString(7, _U.getTelelefono_usu());
            cst.setString(8, _U.getDireccion_usu());
            cst.setString(9, _U.getCorreoElectronico_usu());
            cst.setString(10, _U.getFacha_nac_usu());
            cst.setString(11, _U.getTipo_usu());
            cst.setString(12, _U.getImagen());
            cst.setString(13, _U.getNombres_sesison_usu());
            int i = cst.executeUpdate();
            return i;
        } catch (SQLException e) { throw  e;
        }finally{cn.close();}
    }
    
    public static int ActualizarUsuarios(entUsuario _U) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paEditarUsuario(?,?,?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, _U.getCodigo_usu());
            cst.setString(2, _U.getDocumentoDeIdentidad());
            cst.setString(3, _U.getNombres_usu());
            cst.setString(4, _U.getApellidosPaterno_usu());
            cst.setString(5, _U.getApellidosMaterno_usu());
            cst.setString(6, _U.getTelelefono_usu());
            cst.setString(7, _U.getDireccion_usu());
            cst.setString(8, _U.getCorreoElectronico_usu());
            cst.setString(9, _U.getFacha_nac_usu());
            cst.setString(10, _U.getImagen());
            cst.setString(11, _U.getPsw_sesesion_us());
            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
    
    public static entUsuario EmailUsuario(String email) throws Exception {
        entUsuario user = null;
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT * FROM Usuario where CorreoElectronico_usu='" + email +"'");
            if (tabla.next()) {
                user = new entUsuario();
                user.setCorreoElectronico_usu(tabla.getString("CorreoElectronico_usu"));
                user.setPsw_sesesion_us(tabla.getString("Psw_sesesion_us"));
            }
           return user; 
        }catch(Exception e){
        throw e;
        }finally{cn.close();}
    }
    
    public static entUsuario Usuario(String Usuario) throws Exception {
        entUsuario user = null;
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT * FROM Usuario where Nombres_sesison_usu='" + Usuario +"'");
            if (tabla.next()) {
                user = new entUsuario();
                user.setCorreoElectronico_usu(tabla.getString("Nombres_sesison_usu"));
            }
           return user; 
        }catch(Exception e){
        throw e;
        }finally{cn.close();}
    }
    
    public static entUsuario Prestamos(String Usuario) throws Exception {
        entUsuario user = null;
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT * FROM Prestamo where Codigo_usu_lector='" + Usuario +"'"+" and (Estado_Prestamo='Entregado' or Estado_Prestamo='En canasta')");
            if (tabla.next()) {
                user = new entUsuario();
                user.setCorreoElectronico_usu(tabla.getString("Codigo_usu_lector"));
            }
           return user; 
        }catch(Exception e){
        throw e;
        }finally{cn.close();}
    }
    public static entUsuario Entrega(String Usuario) throws Exception {
        entUsuario user = null;
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT * FROM Prestamo where Codigo_pre='" + Usuario+"'" +" and Estado_Prestamo='Entregado'");
            if (tabla.next()) {
                user = new entUsuario();
                user.setCorreoElectronico_usu(tabla.getString("Codigo_pre"));
            }
           return user; 
        }catch(Exception e){
        throw e;
        }finally{cn.close();}
    }
    
    public static entUsuario Devolucion(String Usuario) throws Exception {
        entUsuario user = null;
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT * FROM Prestamo where Codigo_pre='" + Usuario +" and Estado_Prestamo='Devuelto''");
            if (tabla.next()) {
                user = new entUsuario();
                user.setCorreoElectronico_usu(tabla.getString("Codigo_pre"));
            }
           return user; 
        }catch(Exception e){
        throw e;
        }finally{cn.close();}
    }
    
}
