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
public class entDevolucion {
private String Codigo_dev;
private String Codigo_pre;
private String Codigo_usu_emp;
private String Fecha_dev;

    public String getCodigo_dev() {
        return Codigo_dev;
    }

    public void setCodigo_dev(String Codigo_dev) {
        this.Codigo_dev = Codigo_dev;
    }

    public String getCodigo_pre() {
        return Codigo_pre;
    }

    public void setCodigo_pre(String Codigo_pre) {
        this.Codigo_pre = Codigo_pre;
    }

    public String getCodigo_usu_emp() {
        return Codigo_usu_emp;
    }

    public void setCodigo_usu_emp(String Codigo_usu_emp) {
        this.Codigo_usu_emp = Codigo_usu_emp;
    }

    public String getFecha_dev() {
        return Fecha_dev;
    }

    public void setFecha_dev(String Fecha_dev) {
        this.Fecha_dev = Fecha_dev;
    }

}
