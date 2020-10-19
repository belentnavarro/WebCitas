/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Auxiliar.Constantes;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.swing.JOptionPane;

/**
 *
 * @author belen
 */
public class ConexionEstatica {
     //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;


    public static void nueva(){
        try {
         //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "com.mysql.cj.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName("org.mariadb.jdbc.Driver");              
            //Class.forName(controlador).newInstance();
            //Class.forName(controlador);
            //Class.forName("com.mysql.jdbc.Driver").newInstance(); 

            String URL_BD = "jdbc:mysql://127.0.0.1:3306/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";
            String connectionString = "jdbc:mysql://localhost:3306/" + Constantes.BBDD + "?user=" + Constantes.usuario + "&password=" + Constantes.password + "&useUnicode=true&characterEncoding=UTF-8";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(connectionString);
            //Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            //Conex = DriverManager.getConnection(  
                //   "jdbc:mariadb://localhost:3306/"+ Constantes.BBDD, Constantes.usuario, Constantes.password); 
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }
    
    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static Persona login (String email, String passwd) {
        Persona usuario = null;
        try{
            // Seleccionamos al usuario de la tabla de personas donde tenemos sus datos más básicos.
            String sentencia = "SELECT * FROM " + Constantes.tablaPersonas + " WHERE email = '" + email + "' AND password = '" + passwd + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            
            if(ConexionEstatica.Conj_Registros.next()){
                usuario = new Persona (Conj_Registros.getString("dni"), Conj_Registros.getString("email"), Conj_Registros.getString("passwd"), Conj_Registros.getString("nombre"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getString("ocupacion"), Conj_Registros.getBoolean("activo"), Conj_Registros.getBoolean("preferenciasOk"));
                
                // Seleccionamos el rol que tiene el usuario desde la tabla asignacionRoles.
                sentencia = "SELECT * FROM " + Constantes.tablaAsignacionRoles + ", " + Constantes.tablaRoles + "WHERE idPersona = '" + usuario.getDni() + "' AND asignacionRoles.idRol = roles.id";
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                if(Conj_Registros.next()){
                    usuario.setRol(Conj_Registros.getString("roles.descripcion"));
                }
                
                if(usuario.isPreferenciasOk()){
                    //Seleccionamos sus preferencias si se encuentran registradas.
                    sentencia = "SELECT * FROM " + Constantes.tablaPreferencias + " WHERE dniPersona = '" + usuario.getDni() + "'";
                    ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                    if(Conj_Registros.next()){
                        usuario.setRelacionSeria(Conj_Registros.getBoolean("relacionSeria"));
                        usuario.setDeportes(Conj_Registros.getInt("deportes"));
                        usuario.setArtes(Conj_Registros.getInt("artes"));
                        usuario.setPolitica(Conj_Registros.getInt("politica"));
                        usuario.setTieneHijos(Conj_Registros.getBoolean("tieneHijos"));
                        usuario.setQuiereHijos(Conj_Registros.getBoolean("quiereHijos"));
                        usuario.setInteresHombres(Conj_Registros.getBoolean("interesHombres"));
                        usuario.setInteresMujeres(Conj_Registros.getBoolean("interesMujeres"));
                    }
                }
            }
        } catch(SQLException ex){
            System.out.println("Error en el acceso a la Base de Datos.");
        }
        return usuario;
    }
    
    public static LinkedList <Persona> getUsers(){
        LinkedList <Persona> listaUsuarios = null;
        Persona usuario = null;
        
        try {
            // Seleccionamos a todas las personas de la tabla de la base de datos.
            String sentencia = "SELECT * FROM " + Constantes.tablaPersonas;
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            
            while(Conj_Registros.next()){
                usuario =  new Persona (Conj_Registros.getString("dni"), Conj_Registros.getString("email"), Conj_Registros.getString("passwd"), Conj_Registros.getString("nombre"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getString("ocupacion"), Conj_Registros.getBoolean("activo"), Conj_Registros.getBoolean("preferenciasOk"));
                
                // Seleccionamos el rol que tiene el usuario desde la tabla asignacionRoles.
                sentencia = "SELECT * FROM " + Constantes.tablaAsignacionRoles + ", " + Constantes.tablaRoles + "WHERE idPersona = '" + usuario.getDni() + "' AND asignacionRoles.idRol = roles.id";
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                if(Conj_Registros.next()){
                    usuario.setRol(Conj_Registros.getString("roles.descripcion"));
                }
                
                //Seleccionamos sus preferencias si se encuentran registradas.
                if(usuario.isPreferenciasOk()){
                    //Seleccionamos sus preferencias si se encuentran registradas.
                    sentencia = "SELECT * FROM " + Constantes.tablaPreferencias + " WHERE dniPersona = '" + usuario.getDni() + "'";
                    ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                    if(Conj_Registros.next()){
                        usuario.setRelacionSeria(Conj_Registros.getBoolean("relacionSeria"));
                        usuario.setDeportes(Conj_Registros.getInt("deportes"));
                        usuario.setArtes(Conj_Registros.getInt("artes"));
                        usuario.setPolitica(Conj_Registros.getInt("politica"));
                        usuario.setTieneHijos(Conj_Registros.getBoolean("tieneHijos"));
                        usuario.setQuiereHijos(Conj_Registros.getBoolean("quiereHijos"));
                        usuario.setInteresHombres(Conj_Registros.getBoolean("interesHombres"));
                        usuario.setInteresMujeres(Conj_Registros.getBoolean("interesMujeres"));
                    }
                }
                
                //Añadimos al usuario a la lista de usuarios que devolveremos.
                listaUsuarios.add(usuario);
            }
        } catch (SQLException ex){
            System.out.println("Error en el acceso a la Base de Datos.");
        }
        
        return listaUsuarios;
    }
    
    public static boolean changePassword(String email, int clave){
        boolean conseguido = false;
        try {
            String sentencia = "UPDATE " + Constantes.tablaPersonas + " SET password = " + clave + " WHERE email LIKE '" + email + "'";
            Sentencia_SQL.executeUpdate(sentencia);
            conseguido = true;
        } catch(SQLException ex){
            System.out.println("Error en el acceso a la base de datos.");
        }
        return conseguido;
    }
    
    public static boolean insertUser(Persona p){
        boolean conseguido = false;
        try {
            // Añadimos un usuario a la tabla de datos personas con los datos esenciales de dicho usuario.
            // VALUES ('1A', 'belentrujillo1997@gmail.com', 'hola1A', 'Belen', '23', 'mujer', 'Estudiante', '1', '1', '0', '');
            String sentencia = "INSERT INTO " + Constantes.tablaPersonas + " VALUES('" + p.getDni() + "', '" + p.getEmail() + "', '" + p.getPasswd() + "', '" + p.getNombre() + "', " + p.getEdad() + ", '"
                     + p.getSexo() + "', " + p.getOcupacion() + ", " + p.isActivo() + ", " + p.isPreferenciasOk() + ", '')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            
            // Añadimos a la tabla de asignación de roles al nuevo usuario como usuario común (1).
            sentencia = "INSERT INTO " + Constantes.tablaAsignacionRoles + " VALUES(1, '" + p.getDni() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            
            conseguido = true;
        } catch(SQLException ex){
            System.out.println("Error en el acceso a la BD.");
        }
        
        return conseguido;
    }
    
    public static boolean setLikes(Persona p){
        boolean conseguido = false;
        try {
            String sentencia = "INSERT INTO " + Constantes.tablaPreferencias + " VALUES ('" + p.getDni() + "', " + p.isRelacionSeria() + ", " + p.getDeportes() + ", " + p.getArtes()+ ", " 
                    + p.getPolitica() + ", " + p.isQuiereHijos() + ", " + p.isTieneHijos() + ", " + p.isInteresHombres() + ", " + p.isInteresMujeres() + ")";
            Sentencia_SQL.executeUpdate(sentencia);
            conseguido = true;
        } catch (SQLException ex){
            System.out.println("Error en el acceso a la BD.");
        }
        return conseguido;
    }
    
    public static boolean doneLikes(Persona p){
        boolean conseguido = false;
        try {
            String sentencia = "UPDATE " + Constantes.tablaPersonas + " SET preferenciasOk = true WHERE dni = '" + p.getDni() + "'";
            Sentencia_SQL.executeUpdate(sentencia);
            conseguido = true;
        } catch(SQLException ex){
            System.out.println("Error en el acceso a la BD.");
        }
        return conseguido;
    }
}
