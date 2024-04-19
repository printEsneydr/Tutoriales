/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.conexion;

/**
 *
 * @author esney
 */
public class Tutorial {
    
    private String idTutorial;
    private String nombre;
    private String url;
    private String estado;
    private String categori;
    private String prioridad;

    public Tutorial(String idTutorial, String nombre, String url, String estado, String categori, String prioridad) {
        this.idTutorial = idTutorial;
        this.nombre = nombre;
        this.url = url;
        this.estado = estado;
        this.categori = categori;
        this.prioridad = prioridad;
    }

    public String getIdTutorial() {
        return idTutorial;
    }

    public void setIdTutorial(String idTutorial) {
        this.idTutorial = idTutorial;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCategori() {
        return categori;
    }

    public void setCategori(String categori) {
        this.categori = categori;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }
    
}
