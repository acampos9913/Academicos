/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package PaqueteEntidades;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class entPrestamo {
private String Codigo_pre;
private String Codigo_lib;
private String Codigo_usu_lector;
private String Estado_Prestamo;
private String Fecha_prestamo;
private String FechaLimite_devolucion;
private ArrayList<entDetallePrestamo> Detalle;

    public ArrayList<entDetallePrestamo> getDetalle() {
        return Detalle;
    }

    public void setDetalle(ArrayList<entDetallePrestamo> Detalle) {
        this.Detalle = Detalle;
    }



    public String getCodigo_pre() {
        return Codigo_pre;
    }

    public void setCodigo_pre(String Codigo_pre) {
        this.Codigo_pre = Codigo_pre;
    }

    public String getCodigo_lib() {
        return Codigo_lib;
    }

    public void setCodigo_lib(String Codigo_lib) {
        this.Codigo_lib = Codigo_lib;
    }

    public String getCodigo_usu_lector() {
        return Codigo_usu_lector;
    }

    public void setCodigo_usu_lector(String Codigo_usu_lector) {
        this.Codigo_usu_lector = Codigo_usu_lector;
    }
    
    

    public String getEstado_Prestamo() {
        return Estado_Prestamo;
    }

    public void setEstado_Prestamo(String Estado_Prestamo) {
        this.Estado_Prestamo = Estado_Prestamo;
    }

    public String getFecha_prestamo() {
        return Fecha_prestamo;
    }

    public void setFecha_prestamo(String Fecha_prestamo) {
        this.Fecha_prestamo = Fecha_prestamo;
    }

    public String getFechaLimite_devolucion() {
        return FechaLimite_devolucion;
    }

    public void setFechaLimite_devolucion(String FechaLimite_devolucion) {
        this.FechaLimite_devolucion = FechaLimite_devolucion;
    }



}
