/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteDatos;

import PaqueteEntidades.entGenerador;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Administrador
 */
public class datGenerador {
     public static entGenerador GenAutor() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Autores'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenCategoria() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Categoria'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenDevolucion() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Devolucion'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenEditores() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Editores'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenEntrega() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Entrega'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenLibros() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Libros'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenPrestamo() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Prestamo'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenSancion() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Sancion'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     public static entGenerador GenUsuario() throws Exception{
        Connection cn = conexion.getConexion();
        try {
            Statement stm = cn.createStatement();
            ResultSet tabla = stm.executeQuery("SELECT Ultimo FROM Generador where Parametro='Usuario'");
            entGenerador L = new entGenerador();
            if(tabla.next()){
                L.setUltimo(tabla.getInt("Ultimo"));
            } 
            return L;
        } catch (Exception e) {
            throw e;
        }finally{cn.close();}
    }
     
     public static int ActualizarEstados(String Estado,String Codigo,String Tabla) throws Exception{
        Connection cn = conexion.getConexion();
        try {
            CallableStatement cst = cn.prepareCall("{call CAMBIARESTADOS(?,?,?)}");
            cst.setString(1, Estado);
            cst.setString(2, Codigo);
            cst.setString(3, Tabla);

            int i = cst.executeUpdate();
            return i;
        } catch (Exception e) { throw  e;
        }finally{cn.close();}
    }
}
