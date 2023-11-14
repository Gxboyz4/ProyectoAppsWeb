/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;


import Modelo.ModeloPedido;
import Modelo.ModeloProducto;
import Modelo.Pedido;
import Modelo.Producto;
import Modelo.Usuario;
import java.util.ArrayList;

/**
 *
 * @author julio
 */
public class ControladorPedidos {
    public String getPedidos(int idUsuario){
        ModeloPedido mu = new ModeloPedido();
        ArrayList<Pedido> pedidos = mu.obtenerPedidosUsuario(idUsuario);
        String html = "";
        for (Pedido pedido : pedidos) {
             html += "<tr>"
                    + "<td>" + pedido.getId() + "</td>"
                    + "<td>" + pedido.getDescripcion()+ "</td>"
                    + "<td>" + pedido.getFecha()+ "</td>"
                    + "<td>" + pedido.getPrecio_venta()+ "</td>"
                    + "</tr>";
        }
        return html;
    }
    
    public void agregarPedido(int id_usuario,String descripcion,float precio_venta) {
        ModeloPedido mu = new ModeloPedido();
        mu.agregarPedido(id_usuario, descripcion, precio_venta);
    }
}
