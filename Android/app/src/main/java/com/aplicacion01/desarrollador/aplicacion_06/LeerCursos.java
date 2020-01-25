package com.aplicacion01.desarrollador.aplicacion_06;


import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.URL;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

public class LeerCursos {
    MyActivity actividad;
    ArrayList<String> ids, nom;
    ArrayList<Cursos> lista=new ArrayList<Cursos>();

    public LeerCursos(MyActivity myActivity) {
        actividad=myActivity;
    }
    public ArrayList<Cursos> ejecutar(){
        try{
            ids=new ArrayList<String>();  nom=new ArrayList<String>();
            String url="http://10.143.202.32:1780/academico/lista.php";
            URL dir=new URL(url);

            DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
                //Lector de documentos
            DocumentBuilder db=dbf.newDocumentBuilder();
                //lector de xml
            Document doc=db.parse(dir.openStream());
                //parseo de la direccion electronica
            NodeList nodeList=doc.getElementsByTagName("idd");
                //Ubica la lectura en la primera etiqueta llamada idd
            for (int i=0;i<nodeList.getLength();i++){
                //Recorre los nodos que empiezan con la etiqueta idd
                //desde 0 hasta n-1

                Element elemento=(Element) nodeList.item(i);
                    //Element  => Viene de la libreria org.w3c  (TEMPORAL)
                ids.add(elemento.getFirstChild().getTextContent());
                    //Adiciona el valor de la etiqueta al arraylist "ids"
                ///////////////////////////////////////////////////////////////////
                NodeList nodeList2=doc.getElementsByTagName("des");
                Element elemento2=(Element) nodeList2.item(i);
                nom.add(elemento2.getFirstChild().getTextContent());
                /////////////////////////////////////////////////////////////////
                //AGREGO LOS ARRAYLIST "ids" y "nom" AL ARRAYLIST "CURSOS"
                lista.add(new Cursos(ids.get(i),nom.get(i)));
            }
        }
        catch(Exception ex){
        }
        return lista;
    }
}
