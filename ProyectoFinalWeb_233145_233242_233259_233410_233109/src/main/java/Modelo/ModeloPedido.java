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
public class ModeloPedido extends Conexion{

    public ModeloPedido() {
    }

    
    public ArrayList<Pedido> obtenerPedidosUsuario(int idUsuario){
        ArrayList<Pedido> pedidos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "Select * from pedidos where usuario_id = ?";
            
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, idUsuario);
            rs = pst.executeQuery();
            while (rs.next()) {

                pedidos.add(new Pedido(rs.getInt("id"), rs.getInt("usuario_id")
                        , rs.getFloat("precio_venta"),rs.getString("descripcion"), rs.getDate("fecha")));
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
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
        return pedidos;
    }
    
    public void agregarPedido(int id_usuario,String descripcion,float precio_venta) {
        CallableStatement cstmt = null;

        try {
            String sql = "call hotdogs.agregarPedido(?, ?, ?)";
            cstmt = getConexion().prepareCall(sql);

            cstmt.setString(1, descripcion);
            cstmt.setInt(2, id_usuario);
            cstmt.setFloat(3, precio_venta);
            cstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al insertar pedido: " + ex);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }               
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
    }
}
