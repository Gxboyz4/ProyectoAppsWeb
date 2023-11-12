/*
Clase Conexion.java creada el 31/10/2023.
*/
package Controlador;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author GabrielMancinas233410
 */
public class Conexion {
    
    private String USERNAME ="gab";
    private String PASSWORD = "12345";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "sistema";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
    private Connection con;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Connection getConexion(){
        return con;
    }
    
    
    
}
