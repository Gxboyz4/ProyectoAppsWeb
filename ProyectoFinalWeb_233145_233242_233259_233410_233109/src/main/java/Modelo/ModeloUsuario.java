/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author julio
 */
public class ModeloUsuario extends Conexion{

    public ModeloUsuario() {
    }
    
    public boolean eliminarUsuario(int idUsuario){
        CallableStatement cstmt = null;

        try {
            String sql = "call eliminarUsuario(?)";
            cstmt = getConexion().prepareCall(sql);

            cstmt.setInt(1, idUsuario);

            cstmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al eliminar usuario: " + ex);
            return false;
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }  
            } catch (Exception ex) {
            }
        }
    }
    
    public boolean actualizarUsuario(int idUsuario,String nuevaPasssword){
        CallableStatement cstmt = null;

        try {
            String sql = "call actualizarUsuario(?, ?)";
            cstmt = getConexion().prepareCall(sql);

            cstmt.setInt(1, idUsuario);
            cstmt.setString(2, nuevaPasssword);
            

            cstmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al actualizar usario: " + ex);
            return false;
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                } 
            } catch (Exception ex) {
            }
        }
    }
    
    public ArrayList<Usuario> getAllUsuarios(){
        ArrayList<Usuario> usuario = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "Select * from usuarios";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                usuario.add(new Usuario(rs.getInt("id"),rs.getString("nombre"),rs.getString("usuario"),
                rs.getString("correo"),rs.getString("password"),rs.getBoolean("administrador")));
            }
        } catch (Exception ex) {
            System.out.println("Error en: " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception ex) {
            }
        }
        return usuario;
    }
    public Usuario getUsuario(int id) {
        Usuario usuario = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "Select * from usuarios where id = ?";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                usuario = new Usuario(rs.getInt("id"),rs.getString("nombre"),rs.getString("usuario"),
                rs.getString("correo"),rs.getString("password"),rs.getBoolean("administrador"));
            }
        } catch (Exception ex) {
            System.out.println("Error en: " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception ex) {
                System.out.println("Error en: " + ex);
            }
        }
        return usuario;
    }
    public Usuario getUsuarioCorreo(String correo)
    {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        Usuario usuario = null;
        try {
            String sql = "call selectUsuario(?)";
            cstmt = getConexion().prepareCall(sql);
            
            cstmt.setString(1, correo);
            rs = cstmt.executeQuery();
            if (rs.next()) {
                usuario = new Usuario(rs.getInt("id"),rs.getString("nombre"),rs.getString("usuario"),
                rs.getString("correo"),rs.getString("password"),rs.getBoolean("administrador"));
            }
            return usuario;
        } catch (SQLException ex) {
            System.out.println("Error al obtener usuario: " + ex);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                } 
            } catch (Exception ex) {
            }
        }
        return usuario;
    }
    
    public boolean actualizarUsuarioPorCorreo(String nombre,String usuario,String correo, String password){
        CallableStatement cstmt = null;

        try {
            String sql = "call actualizarUsuarioPorCorreo(?,?,?,?)";
            cstmt = getConexion().prepareCall(sql);
            cstmt.setString(1, nombre);
            cstmt.setString(2, usuario);
            cstmt.setString(3, correo);
            cstmt.setString(4, password);
            cstmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al actualizar usario: " + ex);
            return false;
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                } 
            } catch (Exception ex) {
            }
        }
    } 
}
