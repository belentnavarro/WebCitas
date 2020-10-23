/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author belen
 */
public class Mensaje {
    /***************************************************************************
     * ******************** ATRIBUTOS CLASE MENSAJE ****************************
     ***************************************************************************/
    
    private int idMensaje;
    private String dniOrigen;
    private String dniDestino;
    private String asunto;
    private String cuerpo;
    private Date fecha;
    private boolean leido;

    /***************************************************************************
     * ********************** CONSTRUCTORES MENSAJE ****************************
     ***************************************************************************/
    
    public Mensaje(){
    }
    
    public Mensaje(int idMensaje, String dniOrigen, String dniDestino, String asunto, String cuerpo) {
        this.idMensaje = idMensaje;
        this.dniOrigen = dniOrigen;
        this.dniDestino = dniDestino;
        this.asunto = asunto;
        this.cuerpo = cuerpo;
        this.fecha = new Date();
        this.leido = false;
    }

    /***************************************************************************
     * *********************** GETTERS AND SETTERS *****************************
     ***************************************************************************/
    
    public int getIdMensaje() {
        return idMensaje;
    }

    public String getDniOrigen() {
        return dniOrigen;
    }

    public String getDniDestino() {
        return dniDestino;
    }

    public String getAsunto() {
        return asunto;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public Date getFecha() {
        return fecha;
    }

    public boolean isLeido() {
        return leido;
    }

    public void setLeido(boolean leido) {
        this.leido = leido;
    }
    
    
}
