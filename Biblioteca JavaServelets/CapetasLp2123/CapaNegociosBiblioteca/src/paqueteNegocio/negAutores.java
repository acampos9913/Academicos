/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteNegocio;

import PaqueteEntidades.entAutores;
import java.util.ArrayList;
import paqueteDatos.datAutores;

/**
 *
 * @author Administrador
 */
public class negAutores {
    public static ArrayList<entAutores> ListarAutores() throws Exception{
         try {
             return datAutores.ListarAutores();
             
             
         } catch (Exception e) {
         throw e;
         }
     }
    
   //============================================================================================================== 
}
