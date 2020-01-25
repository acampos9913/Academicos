/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteNegocio;

import PaqueteEntidades.entPrestamo;
import java.util.ArrayList;
import paqueteDatos.datPrestamos;

/**
 *
 * @author Administrador
 */
public class negPrestamo {
    public static ArrayList<entPrestamo> ListarPrestamosXEstado(String Estado_Pre,String Usuario_Pre) 
            throws Exception{
        try {
            return datPrestamos.ListarPrestamoXEstado(Estado_Pre,Usuario_Pre);
        } catch (Exception e) {
                   throw e;
        }          
    }
    
    public static boolean InsertarPrestamo(entPrestamo p) 
                                                throws Exception{
        try{
            return datPrestamos.InsertarPrestamo(p);
        }catch(Exception e){
            throw e;
        }
    }
}
