/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Modelo.ModeloProducto;
import Modelo.Producto;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ModificarProducto extends HttpServlet {
    
    private static final String CARPETA_DESTINO = 
            "C:\\Users\\mario\\3D Objects\\ProyectoAppsWeb\\ProyectoFinalWeb_233145_233242_233259_233410_233109\\src\\main\\webapp\\img\\gallery\\";

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
        // Variables del formulario  
        PrintWriter out = response.getWriter();
        String nombre = request.getParameter("nombre");
        Part archivo = request.getPart("img");
        String nombreArchivo = getNombreArchivo(archivo);
        String archivoDestino = CARPETA_DESTINO + nombreArchivo;

        try (InputStream input = archivo.getInputStream(); OutputStream output = new FileOutputStream(new File(archivoDestino))) {
            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) != -1) {
                output.write(buffer, 0, length);
            }
            System.out.println("Archivo guardado: " + archivoDestino);
        } catch (IOException e) {
            return;
        }
        
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String descripcion = request.getParameter("descripcion");
        int identificadorProducto = Integer.parseInt(request.getParameter("identificador"));
        String categoria = request.getParameter("categoria");
        
        ModeloProducto mp = new ModeloProducto();
        
        if(mp.actualizarProducto(identificadorProducto, nombre, precio, descripcion, 
                categoria, nombreArchivo, stock)){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Producto actualizado correctamente');");
            out.println("window.location='productos_adm.jsp';");
            out.println("</script>"); 
        }else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error al actualizar producto');");
            out.println("window.location='productos_adm.jsp';");
            out.println("</script>"); 
        }
    }
    
    private String getNombreArchivo(final Part archivo) {
        final String headerArchivo = archivo.getHeader("content-disposition");
        for (String contenido : headerArchivo.split(";")) {
            if (contenido.trim().startsWith("filename")) {
                return contenido.substring(contenido.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
