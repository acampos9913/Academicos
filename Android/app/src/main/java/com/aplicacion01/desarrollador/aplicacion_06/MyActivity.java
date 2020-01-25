package com.aplicacion01.desarrollador.aplicacion_06;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

import java.util.ArrayList;


public class MyActivity extends Activity {
    ListView lista;
    LeerCursos leer=new LeerCursos(this); Context contexto=this;

    MiAdaptador arrayadaptador;   //Para almacenar los valores de la lectura xml
    ArrayList<Cursos> datos=new ArrayList<Cursos>();  //Asignar los valores al listview
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);

        lista=(ListView) findViewById(R.id.listView);

        datos=leer.ejecutar();  //Asigna valores al arraylist "datos"

        arrayadaptador=new MiAdaptador(contexto, datos);
            //La clase "MiAdaptador" almacenará temporalmente los valores del arraylist "datos"
        lista.setAdapter(arrayadaptador);
            //El listview se le asigna los valores del Adaptador.
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.my, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
