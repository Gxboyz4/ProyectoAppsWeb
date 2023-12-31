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
    private String categoria;

    //public static final String CARPETA_DESTINO = "C:\\Users\\julio\\OneDrive\\Escritorio\\ProyectoWebDogosCarballo\\ProyectoAppsWeb\\ProyectoFinalWeb_233145_233242_233259_233410_233109\\src\\main\\webapp\\img\\gallery\\";
    
    public static final String CARPETA_DESTINO = "dd";
    
    public Producto() {
    }

    public Producto(int id, String nombre, String img, double precio, int stock, String descripcion,String categoria) {
        this.id = id;
        this.nombre = nombre;
        this.img = img;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.categoria=categoria;
    }
    public Producto (String nombre, String img, double precio, int stock, String descripcion,String categoria) {
        
        this.nombre = nombre;
        this.img = img;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.categoria=categoria;
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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
}
