/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author esney
 */
public class listarCat {
    public static List<Categoria> listarCat() throws SQLException {
        List<Categoria> categorias = new ArrayList<>();
            gestionarTutoriales conexion = new gestionarTutoriales();

        try (Connection conn = conexion.establecerConexion();
        PreparedStatement statement = conn.prepareStatement("SELECT * FROM tutoriales.categoria;");
        ResultSet resultSet = statement.executeQuery())
        {             
            while (resultSet.next()) {
                String idCategoria = resultSet.getString("idCategoria");
                String nombreCat = resultSet.getString("nombreCat");
                
                Categoria categoria = new Categoria(idCategoria, nombreCat);
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener las categorías: " + e.getMessage());
            throw e;
        }             
        return categorias;
    }
}