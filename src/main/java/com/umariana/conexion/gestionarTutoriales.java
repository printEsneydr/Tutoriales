package com.umariana.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
  public boolean existeTutorial(String idTutorial) {
        boolean existe = false;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = establecerConexion();
            if (conn != null) {
                String sql = "SELECT COUNT(*) FROM tutorial WHERE idTutorial = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, idTutorial);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    existe = count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return existe;
    }

public boolean existeCat(String idCategoria) {
    boolean existe = false;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = establecerConexion();
        if (conn != null) {
            String sql = "SELECT COUNT(*) FROM categoria WHERE idCategoria = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idCategoria)); // Cambio aquí
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                existe = count > 0;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return existe;
    }
    public Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
