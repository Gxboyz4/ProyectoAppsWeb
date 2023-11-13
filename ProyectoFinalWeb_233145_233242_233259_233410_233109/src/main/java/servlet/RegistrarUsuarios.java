/*
Clase RegistrarUsuarios.java creada el 05/11/2023.
 */
package servlet;

import Controlador.Consultas;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Gabriel Mancinas 233410
 */
@WebServlet(name = "RegistrarUsuarios", urlPatterns = {"/nuevousuario"})
public class RegistrarUsuarios extends HttpServlet {

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
        //Variables del formulario    
        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        if (password.equals(password2)) {
            Consultas sql = new Consultas();
            if (sql.registrar(nombre, usuario, correo, password)) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("registro.jsp");
            }
        } else {
            // Mostrar una alerta de que las contraseñas no son iguales
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Las contraseñas no son iguales');");
            out.println("window.location='registro.jsp';");
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
