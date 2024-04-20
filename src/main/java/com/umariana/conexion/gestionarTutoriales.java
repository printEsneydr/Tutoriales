package com.umariana.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author esney
 */
public class gestionarTutoriales 
{             
    public Connection establecerConexion ()
    {               
        String url = "jdbc:mysql://localhost:3306/tutoriales?serverTimeZone=utc";
        String user = "root";
        String password = "123456";      
        Connection conn = null;
        
        try {            
            // Carga del driver JDBC de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establecimiento de la conexión
            conn = DriverManager.getConnection(url, user, password);
            if (conn != null){
                System.out.println("Conexion exitosa");              
            }
        } catch (Exception e){
            System.out.println("error de conexion"+e.getMessage());
        }
        return conn;
    }            
    public void agregarTutorial ()
    {
    
    }

    public Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
