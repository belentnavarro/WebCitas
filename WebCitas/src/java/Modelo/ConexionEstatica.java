/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Auxiliar.Constantes;
import java.sql.SQLException;
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
}
