/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;


import Modelo.ModeloProducto;
import Modelo.ModeloUsuario;
import Modelo.Producto;
import Modelo.Usuario;
import java.util.ArrayList;

/**
 *
 * @author julio
 */
public class ControladorUsuario {
    public String getUsuarios(){
        ModeloUsuario mu = new ModeloUsuario();
        ArrayList<Usuario> usuarios = mu.getAllUsuarios();
        String html = "";
        for (Usuario usuario : usuarios) {
             html += "<tr>"
                    + "<td>" + usuario.getId() + "</td>"
                    + "<td>" + usuario.getNombre() + "</td>"
                    + "<td>" + usuario.getUsuario()+ "</td>"
                    + "<td>" + usuario.getCorreo()+ "</td>"
                    + "<td>" + usuario.getPassword()+ "</td>"
                    + "<td>" + usuario.isAdministrador()+ "</td>"
                    + "<td>"
                    + "<button onclick=\"enviarModificarUsuario(" + usuario.getId() + ")\">Modificar</button>"
                    + "<button onclick=\"enviarEliminarUsuario(" + usuario.getId() + ")\">Eliminar</button>"
                    + "</td>"
                    + "</tr>";
        }
        return html;
    }
    public Usuario getUsuario(int id) {
        return new ModeloUsuario().getUsuario(id);
    }
    public Usuario getUsuarioCorreo(String correo)
    {
        return new ModeloUsuario().getUsuarioCorreo(correo);
    }

}
