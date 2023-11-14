/*
Clase ModeloProducto.java creada el 05/11/2023.
 */
package Modelo;

import Controlador.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Gabriel Mancinas 233410
 */
public class ModeloProducto extends Conexion {
    

    public ModeloProducto() {
    }

    public void agregarProducto(Producto producto) {
        CallableStatement cstmt = null;

        try {
            String sql = "call hotdogs.agregarAlimento(?, ?, ?, ?, ?, ?)";
            cstmt = getConexion().prepareCall(sql);

            cstmt.setString(1, producto.getCategoria());
            cstmt.setString(2, producto.getImg());
            cstmt.setInt(3, producto.getStock());
            cstmt.setString(4, producto.getNombre());
            cstmt.setDouble(5, producto.getPrecio());
            cstmt.setString(6, producto.getDescripcion());

            cstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al insertar producto: " + ex);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }               
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
    }

    public void eliminarProducto(int idProducto) {
        CallableStatement cstmt = null;

        try {
            String sql = "call eliminarAlimento(?)";
            cstmt = getConexion().prepareCall(sql);

            cstmt.setInt(1, idProducto);

            cstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar producto: " + ex);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }               
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
    }

    public void actualizarProducto(int productoId, String nuevoNombre, double nuevoPrecio,
            String nuevaDescripcion, String nuevaCategoria, String nuevaImagen, int nuevoStock) {
        CallableStatement cstmt = null;

        try {
            String sql = "call actualizarAlimento(?, ?, ?, ?, ?, ?, ?)";
            cstmt = getConexion().prepareCall(sql);

            cstmt.setInt(1, productoId);
            cstmt.setString(2, nuevoNombre);
            cstmt.setDouble(3, nuevoPrecio);
            cstmt.setString(4, nuevaDescripcion);
            cstmt.setString(5, nuevaCategoria);
            cstmt.setString(6, nuevaImagen);
            cstmt.setInt(7, nuevoStock);

            cstmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar producto: " + ex);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }               
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
    }

    public ArrayList<Producto> getAllProductos() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "call hotdogs.selectProductos()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"), rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"), rs.getString("categoria")));
            }
        } catch (Exception ex) {
            System.out.println("Error en: " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
        return productos;

    }

    public ArrayList<Producto> getProductosDogos() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "call selectHotdogs()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"), rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"), rs.getString("categoria")));
            }
        } catch (Exception ex) {
            System.out.println("Error en: " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
        return productos;

    }

    public ArrayList<Producto> getProductosBebidas() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "call selectBebidas()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {

                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"), rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"), rs.getString("categoria")));
            }
        } catch (Exception ex) {
            System.out.println("Error en: " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
            }
        }
        return productos;

    }

    public Producto getProducto(int id) {
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM productos WHERE id = ?";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"), rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"), rs.getString("categoria"));
            }
        } catch (Exception ex) {
            System.out.println("Error en: " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception ex) {
                System.out.println("Error en: " + ex);
            }
        }
        System.out.println("Imprimo el producto: " + producto);
        return producto;
    }
}
