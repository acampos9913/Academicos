package com.aplicacion01.desarrollador.aplicacion_06;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;


public class MiAdaptador extends ArrayAdapter<Cursos>{  //Hereda los valores de la clase Cursos
    final Context contexto;
    final ArrayList<Cursos> array;
    //CREAR CONSTRUCTOR "clic derecho generate-> Constructor"

    public MiAdaptador(Context contexto, ArrayList<Cursos> array) {
        super(contexto, R.layout.list_item, array);
        this.contexto = contexto;
        this.array = array;
    }
    //clic derecho -> generate -> OverrideMethods -> getView
    //Invocar a los elementos o funciones de la clase

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        //Invocar a las posiciones de la interfaz "list_item"
        LayoutInflater inflater=(LayoutInflater) contexto
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View fila=inflater.inflate(R.layout.list_item,parent, false);
            //Invoca a la fila del listitem

        TextView labelView=(TextView) convertView.findViewById(R.id.datos_id);
        TextView valueView=(TextView) convertView.findViewById(R.id.datos_nombre);
            //Ubicamos los objetos de la interfaz

        labelView.setText(array.get(position).getIdcurso());
        valueView.setText(array.get(position).getNombrecurso());
            //Agregamos los valores de acuerdo al arraylist

        return convertView;
    }
}
