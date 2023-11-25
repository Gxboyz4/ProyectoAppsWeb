/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Controlador.ControladorPedidos;
import Controlador.ControladorProducto;
import Controlador.ControladorUsuario;
import Modelo.Articulo;
import Modelo.ModeloProducto;
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

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession(true);
        ArrayList<Articulo> articulos = (ArrayList) sesion.getAttribute("carrito");

        String correo = (String) sesion.getAttribute("usuario");
        float total = 0f;

        ControladorPedidos cp = new ControladorPedidos();
        ControladorUsuario cu = new ControladorUsuario();
        ControladorProducto cpr = new ControladorProducto();

        Usuario usuario = cu.getUsuarioCorreo(correo);

        String descripcion = "La compra fue de: ";
        boolean compraValida = false;
        ArrayList<Articulo> articulosActualizar = new ArrayList<>();
        if (articulos.size() > 0) {
            for (Articulo a : articulos) {
                Producto producto = cpr.getProducto(a.getIdProducto());
                if(producto.getStock() >= a.getCantidad()){
                    compraValida = true;
                }else{
                    articulosActualizar.add(new Articulo(a.getIdProducto(), producto.getStock()));
                    compraValida = false;
                }
            }
            if (compraValida) {
                for (Articulo a : articulos) {
                    ModeloProducto modelo = new ModeloProducto();
                    Producto producto = cpr.getProducto(a.getIdProducto());
                    modelo.actualizarProducto(producto.getId(), producto.getNombre(), producto.getPrecio(),
                            producto.getDescripcion(), producto.getCategoria(), producto.getImg(), (producto.getStock() - a.getCantidad()));
                    descripcion += a.getCantidad() + " " + producto.getNombre() + "| ";
                    total += a.getCantidad() * producto.getPrecio();
                }
                total += (int) (total * 0.16f);
                cp.agregarPedido(usuario.getId(), descripcion, total);
                sesion.setAttribute("carrito", null);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Se realizó la compra correctamente');");
                out.println("window.location='compras_usuario.jsp';");
                out.println("</script>");
            } else {
                for (Articulo articuloActualizar : articulosActualizar) {
                    articulos.remove(articuloActualizar);
                    if(articuloActualizar.getCantidad()!=0){
                        articulos.add(articuloActualizar);
                    }
                }
                out.println("<script type=\"text/javascript\">");
                out.println("alert('No hay stock de algunos productos de tu carrito');");
                out.println("window.location='cart.jsp';");
                out.println("</script>");
            }
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Hubo un error al realizar la compra');");
            out.println("window.location='cart.jsp';");
            out.println("</script>");
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
