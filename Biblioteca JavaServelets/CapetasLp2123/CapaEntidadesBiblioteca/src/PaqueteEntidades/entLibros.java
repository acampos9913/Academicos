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
public class entLibros {
private String Codigo_lib;
private entAutores E_Autores;
private entEditores E_Editores;
private entCategoria E_Catewgoria;
private String Estado_Libros;
private int Ejemplares_lib;
private String Titulo_lib;
private String Decripcion_lib;
private String Imagen_lib;
private String Observaciones;
private int Stock;

    public String getCodigo_lib() {
        return Codigo_lib;
    }

    public void setCodigo_lib(String Codigo_lib) {
        this.Codigo_lib = Codigo_lib;
    }

    public entAutores getE_Autores() {
        return E_Autores;
    }

    public void setE_Autores(entAutores E_Autores) {
        this.E_Autores = E_Autores;
    }

    public entEditores getE_Editores() {
        return E_Editores;
    }

    public void setE_Editores(entEditores E_Editores) {
        this.E_Editores = E_Editores;
    }

    public entCategoria getE_Catewgoria() {
        return E_Catewgoria;
    }

    public void setE_Catewgoria(entCategoria E_Catewgoria) {
        this.E_Catewgoria = E_Catewgoria;
    }

    public String getEstado_Libros() {
        return Estado_Libros;
    }

    public void setEstado_Libros(String Estado_Libros) {
        this.Estado_Libros = Estado_Libros;
    }

    public int getEjemplares_lib() {
        return Ejemplares_lib;
    }

    public void setEjemplares_lib(int Ejemplares_lib) {
        this.Ejemplares_lib = Ejemplares_lib;
    }

    public String getTitulo_lib() {
        return Titulo_lib;
    }

    public void setTitulo_lib(String Titulo_lib) {
        this.Titulo_lib = Titulo_lib;
    }

    public String getDecripcion_lib() {
        return Decripcion_lib;
    }

    public void setDecripcion_lib(String Decripcion_lib) {
        this.Decripcion_lib = Decripcion_lib;
    }

    public String getImagen_lib() {
        return Imagen_lib;
    }

    public void setImagen_lib(String Imagen_lib) {
        this.Imagen_lib = Imagen_lib;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

}
