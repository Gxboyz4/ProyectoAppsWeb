/*
Clase Producto.java creada el 05/11/2023.
*/
package Modelo;

/**
 *
 * @author Gabriel Mancinas 233410
 */
public class Producto {
    
    private int id;
    private String nombre;
    private String img;
    private double precio;
    private int stock;
    private String descripcion;

    public Producto() {
    }

    public Producto(int id, String nombre, String img, double precio, int stock, String descripcion) {
        this.id = id;
        this.nombre = nombre;
        this.img = img;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
