/*
Clase ControladorProducto.java creada el 31/10/2023.
*/
package Controlador;

import Modelo.ModeloProducto;
import Modelo.Producto;



/**
 *
 * @author GabrielMancinas233410
 */
public class ControladorProducto {

    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.getAllProductos()) {
            htmlcode += "<div class=\"col-sm-4\">\n"
                    + "	<div class=\"card\">\n"
                    + "	<div class=\"productoinfo text-center\">\n"
                    + "<img src=\"img/" + producto.getImg()+"\">\n"
                    + "	<h2>$" + producto.getPrecio() + "</h2>\n"
                    + "	<p>" + producto.getNombre() + "</p>\n"
                    + "	<a href=\"product-details.jsp?id=" + producto.getId() + "\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n"
                    + "	</div>\n"
                    + "	<div class=\"card-footer\">\n"
                    + "	<a href=\"product-details.jsp?id=" + producto.getId() + "\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Agregar producto</a>\n"
                    + "	</div>\n"
                    + "	</div><br>"
                    + "	</div>";
        }
        return htmlcode;
    }

    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }

}
