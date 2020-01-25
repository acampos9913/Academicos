/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteNegocio;

import PaqueteEntidades.entLibros;
import java.util.ArrayList;
import paqueteDatos.datLibros;

/**
 *
 * @author Administrador
 */
public class negLibros {
    public static ArrayList<entLibros> ListarlibrosXEstado(String Estado_Li,String Categoria) 
            throws Exception{
        try {
            return datLibros.ListarLibrosXEstado(Estado_Li,Categoria);
        } catch (Exception e) {
                   throw e;
        }          
    }
    public static ArrayList<entLibros> ListarLibrosXCategoria(String Categoria_Li) 
            throws Exception{
        try {
            return datLibros.ListarLibrosXCategoria(Categoria_Li);
        } catch (Exception e) {
                   throw e;
        }          
    }
}
