/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package paqueteNegocio;

import PaqueteEntidades.entEditores;
import java.util.ArrayList;
import paqueteDatos.datEditores;

/**
 *
 * @author Administrador
 */
public class negEditores {
   public static ArrayList<entEditores> ListarEditores() throws Exception{
         try {
             return datEditores.ListarEditores();
             
             
         } catch (Exception e) {
         throw e;
         }
     }
    
   //============================================================================================================== 
}