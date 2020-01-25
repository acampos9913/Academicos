package paqueteNegocio;

import PaqueteEntidades.entUsuario;
import java.util.ArrayList;
import paqueteDatos.datUsuario;

public class negUsuario {
    public static entUsuario VerificarAcceso(String prmUser, 
                    String prmPass) throws Exception{
        try{
            return datUsuario.VerificarAcceso(prmUser, prmPass);
        }catch(Exception e){
            throw e;
        }
    }
    public static ArrayList<entUsuario> ListarUsuarios(String nombreUsuario,String tipoUsuario) 
            throws Exception{
        try {
            return datUsuario.ListarUsuarios(nombreUsuario,tipoUsuario);
        } catch (Exception e) {
                   throw e;
        }          
    }
}