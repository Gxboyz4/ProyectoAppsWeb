/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Controlador.ControladorPedidos;
import Controlador.ControladorProducto;
import Controlador.ControladorUsuario;
import Modelo.Articulo;
import Modelo.Producto;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author mario
 */
public class PagarCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession sesion = request.getSession(true);
        ArrayList<Articulo> articulos = (ArrayList) sesion.getAttribute("carrito");

        String correo = (String) sesion.getAttribute("usuario");
        float total = 0f;

        ControladorPedidos cp = new ControladorPedidos();
        ControladorUsuario cu = new ControladorUsuario();
        ControladorProducto cpr = new ControladorProducto();
        
        Usuario usuario = cu.getUsuarioCorreo(correo);

        String descripcion = "La compra fue de: ";
        if (articulos.size() > 0) {
            for (Articulo a : articulos) {
                Producto producto = cpr.getProducto(a.getIdProducto());
                descripcion+= a.getCantidad()+" "+producto.getNombre()+"| ";
                total+= a.getCantidad() * producto.getPrecio();
            }
            total+= (int)(total*0.16f);
            cp.agregarPedido(usuario.getId(), descripcion, total);
            sesion.setAttribute("carrito", null);
            response.sendRedirect("compras_usuario.jsp");
        }else{
           response.sendRedirect("cart.jsp"); 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
