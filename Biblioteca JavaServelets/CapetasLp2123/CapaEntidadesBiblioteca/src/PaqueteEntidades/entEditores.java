/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package PaqueteEntidades;

/**
 *
 * @author Administrador
 */
public class entEditores {
    private String Codigo_edi;
private String Nom_edi;
private String Direccion;
private String Estado_Edi;

    public String getEstado_Edi() {
        return Estado_Edi;
    }

    public void setEstado_Edi(String Estado_Edi) {
        this.Estado_Edi = Estado_Edi;
    }


    public String getCodigo_edi() {
        return Codigo_edi;
    }

    public void setCodigo_edi(String Codigo_edi) {
        this.Codigo_edi = Codigo_edi;
    }

    public String getNom_edi() {
        return Nom_edi;
    }

    public void setNom_edi(String Nom_edi) {
        this.Nom_edi = Nom_edi;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

}
