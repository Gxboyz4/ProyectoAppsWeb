/*
Clase InicioSesion.java creada el 05/11/2023.
 */
package servlet;

import Controlador.Consultas;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Gabriel Mancinas 233410
 */
@WebServlet(name = "InicioSesion", urlPatterns = {"/iniciar"})
public class InicioSesion extends HttpServlet {

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
        String correo = request.getParameter("correo");
        String clave = request.getParameter("password");
        Consultas sql = new Consultas();
        System.out.println("Estoy en el servlet" + correo + ": " + clave);
        if (sql.autenticacion(correo, clave)) {
            HttpSession objSesion = request.getSession(true);
            objSesion.setAttribute("correo", correo);
            sql = new Consultas();
            if (sql.autenticacionAdmin(correo, clave)) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Usuario logueado correctamente como administrador');");
                out.println("window.location='opcionesadmin.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Usuario logueado correctamente');");
                out.println("window.location='principal.jsp';");
                out.println("</script>");
            }
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Credenciales inválidas');");
            out.println("window.location='index.jsp';");
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
