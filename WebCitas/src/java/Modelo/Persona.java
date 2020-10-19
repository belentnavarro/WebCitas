/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author belen
 */
public class Persona {
    /***************************************************************************
     * ******************** ATRIBUTOS CLASE PERSONA ****************************
     ***************************************************************************/
    
    //Datos esenciales de la persona.
    private String dni; 
    private String email;
    private String passwd;
    private String nombre;
    private int edad;
    private String sexo;
    private String ocupacion;
    private String rol; // Rol que tiene el usuario: administrador o usuario común.
    private boolean activo;
    private boolean preferenciasOk;
    private String fotoPerfil;
    
    // Preferencias de la persona.
    private boolean relacionSeria;
    private int deportes;
    private int artes;
    private int politica;
    private boolean quiereHijos;
    private boolean tieneHijos;
    private boolean interesHombres;
    private boolean interesMujeres;

    
    /***************************************************************************
     * ********************** CONSTRUCTORES PERSONA ****************************
     ***************************************************************************/
    
    public Persona (){
        this.dni = "";
        this.email = "";
        this.passwd = "";
        this.nombre = "";
        this.edad = 0;
        this.sexo = "";
        this.ocupacion = "";
        this.rol = "";
        this.activo = false;
        this.preferenciasOk = false;
        this.fotoPerfil = "";
    }

    public Persona(String dni, String email, String passwd, String nombre, int edad, String sexo, String ocupacion, boolean activo, boolean preferenciasOk) {
        this.dni = dni;
        this.email = email;
        this.passwd = passwd;
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = sexo;
        this.ocupacion = ocupacion;
        this.rol = "";
        this.activo = activo;
        this.preferenciasOk = preferenciasOk;
        this.fotoPerfil = "";
    }

    /***************************************************************************
     * *********************** GETTERS AND SETTERS *****************************
     ***************************************************************************/
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public boolean isPreferenciasOk() {
        return preferenciasOk;
    }

    public void setPreferenciasOk(boolean preferenciasOk) {
        this.preferenciasOk = preferenciasOk;
    }

    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    public boolean isRelacionSeria() {
        return relacionSeria;
    }

    public void setRelacionSeria(boolean relacionSeria) {
        this.relacionSeria = relacionSeria;
    }

    public int getDeportes() {
        return deportes;
    }

    public void setDeportes(int deportes) {
        this.deportes = deportes;
    }

    public int getArtes() {
        return artes;
    }

    public void setArtes(int artes) {
        this.artes = artes;
    }

    public int getPolitica() {
        return politica;
    }

    public void setPolitica(int politica) {
        this.politica = politica;
    }

    public boolean isQuiereHijos() {
        return quiereHijos;
    }

    public void setQuiereHijos(boolean quiereHijos) {
        this.quiereHijos = quiereHijos;
    }

    public boolean isTieneHijos() {
        return tieneHijos;
    }

    public void setTieneHijos(boolean tieneHijos) {
        this.tieneHijos = tieneHijos;
    }

    public boolean isInteresHombres() {
        return interesHombres;
    }

    public void setInteresHombres(boolean interesHombres) {
        this.interesHombres = interesHombres;
    }

    public boolean isInteresMujeres() {
        return interesMujeres;
    }

    public void setInteresMujeres(boolean interesMujeres) {
        this.interesMujeres = interesMujeres;
    }
    
    
}
