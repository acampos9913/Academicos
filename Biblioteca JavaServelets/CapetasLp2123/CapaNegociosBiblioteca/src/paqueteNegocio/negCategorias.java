

package paqueteNegocio;

import PaqueteEntidades.entCategoria;
import java.util.ArrayList;
import paqueteDatos.datCategorias;


public class negCategorias {
   //==============================================================================================================
     public static ArrayList<entCategoria> ListarCategorias() throws Exception{
         try {
             return datCategorias.ListarCategorias();
             
             
         } catch (Exception e) {
         throw e;
         }
     }
    
   //============================================================================================================== 
}
