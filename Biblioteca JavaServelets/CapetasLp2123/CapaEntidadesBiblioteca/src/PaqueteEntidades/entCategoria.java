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
public class entCategoria {
    private String Codigo_gen;
private String Nombres_gen;
private String Descripcion_gen;
private String Estado_Cat;

    public String getEstado_Cat() {
        return Estado_Cat;
    }

    public void setEstado_Cat(String Estado_Cat) {
        this.Estado_Cat = Estado_Cat;
    }


    public String getCodigo_gen() {
        return Codigo_gen;
    }

    public void setCodigo_gen(String Codigo_gen) {
        this.Codigo_gen = Codigo_gen;
    }

    public String getNombres_gen() {
        return Nombres_gen;
    }

    public void setNombres_gen(String Nombres_gen) {
        this.Nombres_gen = Nombres_gen;
    }

    public String getDescripcion_gen() {
        return Descripcion_gen;
    }

    public void setDescripcion_gen(String Descripcion_gen) {
        this.Descripcion_gen = Descripcion_gen;
    }



}
