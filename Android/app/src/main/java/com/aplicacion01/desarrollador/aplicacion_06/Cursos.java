package com.aplicacion01.desarrollador.aplicacion_06;

public class Cursos {
    String idcurso, nombrecurso;

    public Cursos(String idcurso, String nombrecurso) {
        super();
        this.idcurso = idcurso;
        this.nombrecurso = nombrecurso;
    }

    public String getIdcurso() {
        return idcurso;
    }

    public void setIdcurso(String idcurso) {
        this.idcurso = idcurso;
    }

    public String getNombrecurso() {
        return nombrecurso;
    }

    public void setNombrecurso(String nombrecurso) {
        this.nombrecurso = nombrecurso;
    }
}
