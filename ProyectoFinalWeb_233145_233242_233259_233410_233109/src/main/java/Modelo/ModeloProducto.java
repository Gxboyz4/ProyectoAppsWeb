/*
Clase ModeloProducto.java creada el 05/11/2023.
*/
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Gabriel Mancinas 233410
 */
public class ModeloProducto extends Conexion{
    //Conexion conexion = new Conexion();

    public ModeloProducto() {
    }
//    public Connection getConexion(){
//        return conexion.getConexion();
//    }
    public ArrayList<Producto> getAllProductos(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            String sql = "call selectProductos()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
               
                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"),rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"),rs.getString("categoria")));
            }
        }catch(Exception ex){
            System.out.println("Error en: "+ex);
        }finally{
            try{
                if(rs!=null){
                    rs.close();
                }
                if(pst!=null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch(Exception ex){}
        }
        return productos;
        
    }
    public ArrayList<Producto> getProductosDogos(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            String sql = "call selectHotdogs()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
               
                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"),rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"),rs.getString("categoria")));
            }
        }catch(Exception ex){
            System.out.println("Error en: "+ex);
        }finally{
            try{
                if(rs!=null){
                    rs.close();
                }
                if(pst!=null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch(Exception ex){}
        }
        return productos;
        
    }
     public ArrayList<Producto> getProductosBebidas(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            String sql = "call selectBebidas()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
               
                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"),rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"),rs.getString("categoria")));
            }
        }catch(Exception ex){
            System.out.println("Error en: "+ex);
        }finally{
            try{
                if(rs!=null){
                    rs.close();
                }
                if(pst!=null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch(Exception ex){}
        }
        return productos;
        
    }
    public Producto getProducto(int id){
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            String sql = "call selectProducto(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getInt("id"), rs.getString("nombre"),
                        rs.getString("img_producto"),rs.getDouble("precio"),
                        rs.getInt("stock"), rs.getString("descripcion"),rs.getString("categoria"));
            }
        }catch(Exception ex){
            System.out.println("Error en: "+ex);
        }finally{
            try{
                if(rs!=null){
                    rs.close();
                }
                if(pst!=null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch(Exception ex){
                System.out.println("Error en: "+ex);
            }
        }
        System.out.println("Imprimo el producto: "+producto);
        return producto;
    }
}
