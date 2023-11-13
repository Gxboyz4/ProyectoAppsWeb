/*
Clase Consultas.java creada el 31/10/2023.
*/
package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GabrielMancinas233410
 */
public class Consultas {

    Conexion conexion = new Conexion();

    public Consultas() {
   
    }
    public Connection getConexion(){
        return conexion.getConexion();
    }
    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            
            String consulta = "select * from usuarios where correo=? and password=?";
            System.out.println("Consulta en " + consulta);
            pst = getConexion().prepareStatement(consulta);
            
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs=pst.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Error en "+ex);
        }finally{
            try{
                if(getConexion()!=null){
                    getConexion().close();
                }if(pst!=null){
                    pst.close();
                }if(rs!=null){
                    rs.close();
                }
                
            }catch(Exception ex){
                System.out.println("Error en "+ex);
            }
        }

        return false;
    }
    public boolean autenticacionAdmin(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            
            String consulta = "select * from usuarios where correo=? and password=? and administrador=true";
            System.out.println("Consulta en " + consulta);
            pst = getConexion().prepareStatement(consulta);
            
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs=pst.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("Error en "+ex);
        }finally{
            try{
                if(getConexion()!=null){
                    getConexion().close();
                }if(pst!=null){
                    pst.close();
                }if(rs!=null){
                    rs.close();
                }
                
            }catch(Exception ex){
                System.out.println("Error en "+ex);
            }
        }

        return false;
    }
    public boolean registrar(String nombre,String usuario, String correo, String password){
        PreparedStatement pst=null;
        try{
           String consulta="INSERT INTO usuarios (nombre, usuario,correo,password) VALUES (?, ?, ?, ?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, usuario);
            pst.setString(3, correo);
            pst.setString(4, password);
            if(pst.executeUpdate()==1){
                return true;
            }
            }catch(Exception ex){
             System.out.println("Error en "+ex);
            }finally{
            try{
                if(getConexion()!=null){
                    getConexion().close();
                    if(pst!=null){
                        pst.close();
                    }
                }
            }catch(Exception ex){
                System.out.println("Error en "+ex);
                
            }
        }
        return false;
        }
    }

