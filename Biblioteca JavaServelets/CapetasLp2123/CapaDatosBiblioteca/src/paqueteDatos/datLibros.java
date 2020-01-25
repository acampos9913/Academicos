/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteDatos;

import PaqueteEntidades.entAutores;
import PaqueteEntidades.entCategoria;
import PaqueteEntidades.entDetallePrestamo;
import PaqueteEntidades.entEditores;
import PaqueteEntidades.entLibros;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class datLibros {
    public static ArrayList<entLibros> ListarLibrosXCategoria(String idCategoria) throws Exception{
        Connection cn = conexion.getConexion();
        ArrayList<entLibros> Lista= null;
        try {
            CallableStatement cst= cn.prepareCall("{call paListarLibros(?,?)}");
            cst.setString(1, idCategoria);
            
            ResultSet tabla= cst.executeQuery();
            
            Lista = new ArrayList<entLibros>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
            while(tabla.next()){
                entLibros L = new entLibros();
                L.setCodigo_lib(tabla.getString("Codigo_lib"));
                L.setDecripcion_lib(tabla.getString("Decripcion_lib"));
                L.setEjemplares_lib(tabla.getInt("Ejemplares_lib"));
                L.setEstado_Libros(tabla.getString("Estado_Libros"));
                L.setImagen_lib(tabla.getString("Imagen_lib"));
                L.setTitulo_lib(tabla.getString("Titulo_lib"));
                L.setObservaciones(tabla.getString("Observaciones"));
                L.setStock(tabla.getInt("Stock"));
                    entEditores E = new entEditores();
                    E.setCodigo_edi(tabla.getString("Codigo_edi"));
                    E.setNom_edi(tabla.getString("Nom_edi"));
                    entCategoria C = new entCategoria();
                    C.setCodigo_gen(tabla.getString("Codigo_gen"));
                    C.setNombres_gen(tabla.getString("Nombres_gen"));
                    entAutores A = new entAutores();
                    A.setCodigo_aut(tabla.getString("Codigo_aut"));
                    A.setNombres_aut(tabla.getString("Nombres_aut"));
                 L.setE_Autores(A);
                 L.setE_Catewgoria(C);
                 L.setE_Editores(E);
                 Lista.add(L);
            } 
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
        return Lista;
    }
    
    public static ArrayList<entLibros> ListarLibrosXEstado(String Estado_Li,String idCategoria) throws Exception{
        Connection cn = conexion.getConexion();
        ArrayList<entLibros> Lista= null;
        try {
            CallableStatement cst= cn.prepareCall("{call paListarLibros(?,?)}");
            cst.setString(1, Estado_Li);
            cst.setString(2, idCategoria);
            
            ResultSet tabla= cst.executeQuery();
            
            Lista = new ArrayList<entLibros>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
            while(tabla.next()){
                entLibros L = new entLibros();
                L.setCodigo_lib(tabla.getString("Codigo_lib"));
                L.setDecripcion_lib(tabla.getString("Decripcion_lib"));
                L.setEjemplares_lib(tabla.getInt("Ejemplares_lib"));
                L.setEstado_Libros(tabla.getString("Estado_Libros"));
                L.setImagen_lib(tabla.getString("Imagen_lib"));
                L.setTitulo_lib(tabla.getString("Titulo_lib"));
                L.setObservaciones(tabla.getString("Observaciones"));
                L.setStock(tabla.getInt("Stock"));
                    entEditores E = new entEditores();
                    E.setCodigo_edi(tabla.getString("Codigo_edi"));
                    E.setNom_edi(tabla.getString("Nom_edi"));
                    entCategoria C = new entCategoria();
                    C.setCodigo_gen(tabla.getString("Codigo_gen"));
                    C.setNombres_gen(tabla.getString("Nombres_gen"));
                    entAutores A = new entAutores();
                    A.setCodigo_aut(tabla.getString("Codigo_aut"));
                    A.setNombres_aut(tabla.getString("Nombres_aut"));
                 L.setE_Autores(A);
                 L.setE_Catewgoria(C);
                 L.setE_Editores(E);
                 Lista.add(L);
            } 
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
        return Lista;
    }
    
    public static entLibros DevolverLibro(String id) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst= cn.prepareCall("{call paListarLibrosXId(?)}");
            cst.setString(1, id);//quiere decir que es el unico parametro  que estamos mandando                 
            ResultSet tabla= cst.executeQuery();
            entLibros L = new entLibros();
            if(tabla.next()){
            L.setCodigo_lib(tabla.getString("Codigo_lib"));
                L.setDecripcion_lib(tabla.getString("Decripcion_lib"));
                L.setEjemplares_lib(tabla.getInt("Ejemplares_lib"));
                L.setEstado_Libros(tabla.getString("Estado_Libros"));
                L.setImagen_lib(tabla.getString("Imagen_lib"));
                L.setTitulo_lib(tabla.getString("Titulo_lib"));
                L.setObservaciones(tabla.getString("Observaciones"));
                L.setStock(tabla.getInt("Stock"));
                    entEditores E = new entEditores();
                    E.setCodigo_edi(tabla.getString("Codigo_edi"));
                    E.setNom_edi(tabla.getString("Nom_edi"));
                    entCategoria C = new entCategoria();
                    C.setCodigo_gen(tabla.getString("Codigo_gen"));
                    C.setNombres_gen(tabla.getString("Nombres_gen"));
                    entAutores A = new entAutores();
                    A.setCodigo_aut(tabla.getString("Codigo_aut"));
                    A.setNombres_aut(tabla.getString("Nombres_aut"));
                 L.setE_Autores(A);
                 L.setE_Catewgoria(C);
                 L.setE_Editores(E);
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
    
    public static ArrayList<entLibros> BuscarLibros(String Tipo,String Dato) throws Exception{
        Connection cn = conexion.getConexion();
        ArrayList<entLibros> Lista= null;
        try {
            CallableStatement cst= cn.prepareCall("{call buscarLibros(?,?)}");
            cst.setString(1, Tipo);
            cst.setString(2, Dato);
            
            ResultSet tabla= cst.executeQuery();
            
            Lista = new ArrayList<entLibros>();  // importante esta linea sino no aparecera nada!!!!!!!!!!!!!!!!!
        
            while(tabla.next()){
                entLibros L = new entLibros();
                L.setCodigo_lib(tabla.getString("Codigo_lib"));
                L.setDecripcion_lib(tabla.getString("Decripcion_lib"));
                L.setEjemplares_lib(tabla.getInt("Ejemplares_lib"));
                L.setEstado_Libros(tabla.getString("Estado_Libros"));
                L.setImagen_lib(tabla.getString("Imagen_lib"));
                L.setTitulo_lib(tabla.getString("Titulo_lib"));
                L.setObservaciones(tabla.getString("Observaciones"));
                L.setStock(tabla.getInt("Stock"));
                    entEditores E = new entEditores();
                    E.setCodigo_edi(tabla.getString("Codigo_edi"));
                    E.setNom_edi(tabla.getString("Nom_edi"));
                    entCategoria C = new entCategoria();
                    C.setCodigo_gen(tabla.getString("Codigo_gen"));
                    C.setNombres_gen(tabla.getString("Nombres_gen"));
                    entAutores A = new entAutores();
                    A.setCodigo_aut(tabla.getString("Codigo_aut"));
                    A.setNombres_aut(tabla.getString("Nombres_aut"));
                 L.setE_Autores(A);
                 L.setE_Catewgoria(C);
                 L.setE_Editores(E);
                 Lista.add(L);
            } 
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
        return Lista;
    }
    
    public static int InsertarLibros(entLibros _L) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paInsertarLibros(?,?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, _L.getCodigo_lib());
            cst.setString(7, _L.getDecripcion_lib());
            cst.setInt(5, _L.getEjemplares_lib());
            cst.setString(8, _L.getImagen_lib());
            cst.setString(6, _L.getTitulo_lib());
            cst.setString(2, _L.getE_Autores().getCodigo_aut());
            cst.setString(4, _L.getE_Catewgoria().getCodigo_gen());
            cst.setString(3, _L.getE_Editores().getCodigo_edi());
            cst.setString(9, _L.getObservaciones());
            cst.setInt(10, _L.getStock());

            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
    
    public static int ActualizarLibros(entLibros _L) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call paEditarLibros(?,?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, _L.getCodigo_lib());
            cst.setString(7, _L.getDecripcion_lib());
            cst.setInt(5, _L.getEjemplares_lib());
            cst.setString(8, _L.getImagen_lib());
            cst.setString(6, _L.getTitulo_lib());
            cst.setString(2, _L.getE_Autores().getCodigo_aut());
            cst.setString(4, _L.getE_Catewgoria().getCodigo_gen());
            cst.setString(3, _L.getE_Editores().getCodigo_edi());
            cst.setString(9, _L.getObservaciones());
            cst.setInt(10, _L.getStock());

            int i = cst.executeUpdate();
            return i;
        } catch (SQLException e) { throw  e;
        }finally{cn.close();}
    }
    
    public static int ActualizarStock(String CodLib,String idPrestamo) throws Exception{
        Connection cn = conexion.getConexion();
        try{
            CallableStatement stm = cn.prepareCall("{call actulizarStockLibros(?,?)}");
            stm.setString(2, idPrestamo);
            stm.setString(1, CodLib);
            
            int i = stm.executeUpdate();
            
            return i;
        }catch(Exception e){
            throw e;            
        }finally{cn.close();}  
    }
}
