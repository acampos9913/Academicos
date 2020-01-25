package paqueteDatos;

import java.sql.*;

public class conexion {
    public static Connection getConexion(){
        try{
            //ojo: trabaja con glashFish. No funca con apache.
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//Connection cn = DriverManager.getConnection("jdbc:sqlserver://JULIO-PC\\MSSQLSERVER2012;databaseName=ProBiblioteca","sa", "123");
Connection cn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProBiblioteca","sa", "123");
return cn;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
