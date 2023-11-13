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

    public String getProductosDogos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.getProductosDogos()) {
            htmlcode += "<div class=\"col-sm-6 col-md-4 col-xl mb-5 h-100\">\n" +
"                                                <div class=\"card card-span h-100 rounded-3\">\n" +
"                                                    <img class=\"img-fluid rounded-3 h-100\" src=\"img/gallery/"+producto.getImg()+"\" alt=\"...\" />\n" +
"                                                    <div class=\"card-body ps-0\">\n" +
"                                                        <h5 class=\"fw-bold text-1000 text-truncate mb-1\">"+producto.getNombre()+"</h5>\n" +
"                                                        <span class=\"text-1000 fw-bold\"> $ "+producto.getPrecio()+"</span>\n" +
"                                                    </div>\n" +
"                                                </div>\n" +
"                                                <div class=\"d-grid gap-2\"><a class=\"btn btn-lg btn-danger\" href=\"#!\" role=\"button\">Comprar</a></div>\n" +
"                                            </div>";
        }
        return htmlcode;
    }
  public String getProductosBebidas() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.getProductosBebidas()) {
            htmlcode += "<div class=\"col-sm-6 col-md-4 col-xl mb-5 h-100\">\n" +
"                                                <div class=\"card card-span h-100 rounded-3\"><img class=\"img-fluid rounded-3 h-100\" src=\"img/gallery/"+producto.getImg()+"\" alt=\"...\" />\n" +
"                                                    <div class=\"card-body ps-0\">\n" +
"                                                        <h5 class=\"fw-bold text-1000 text-truncate mb-1\">"+producto.getNombre()+"</h5>\n" +
"                                                        <span class=\"text-1000 fw-bold\">$"+producto.getPrecio()+"</span>\n" +
"                                                    </div>\n" +
"                                                </div>\n" +
"                                                <div class=\"d-grid gap-2\"><a class=\"btn btn-lg btn-danger\" href=\"#!\" role=\"button\">Comprar</a></div>\n" +
"                                            </div>";
        }
        return htmlcode;
    }
    
    
    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }

}
