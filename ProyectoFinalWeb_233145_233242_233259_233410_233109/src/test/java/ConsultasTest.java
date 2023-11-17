/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */

import Controlador.Consultas;
import Modelo.ModeloPedido;
import Modelo.ModeloProducto;
import Modelo.ModeloUsuario;
import Modelo.Producto;
import Modelo.Usuario;
import java.util.List;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author julio
 */
public class ConsultasTest {

    public ConsultasTest() {
    }

    //1
    @Test
    public void registrarRegistroExitosoTest() {
        Consultas consultas = new Consultas();
        String nombre = "Julio";
        String usuario = "chon";
        String correo = "julio@gmail.com";
        String password = "julio";

        boolean resultado = consultas.registrar(nombre, usuario, correo, password);
        assertTrue(resultado);
    }

    //2
    @Test
    public void registrarFalloEnRegistroTest() {
        Consultas consultas = new Consultas();
        String nombre = "Julio";
        String usuario = "chon";
        String correo = "julio@gmail.com";
        String password = "julio";

        boolean resultado = consultas.registrar(nombre, usuario, correo, password);
        assertFalse(resultado);
    }

    //3
    @Test
    public void autenticacionUsuarioValidoTest() {
        Consultas consultas = new Consultas();
        String correo = "julio@gmail.com";
        String password = "julio";

        boolean resultado = consultas.autenticacion(correo, password);
        assertTrue(resultado);
    }

    //4
    @Test
    public void autenticacionUsuarioInvalidoTest() {
        Consultas consultas = new Consultas();
        String correo = "julio@gmail.com";
        String password = "chon";

        boolean resultado = consultas.autenticacion(correo, password);
        assertFalse(resultado);
    }

    //5
    @Test
    public void consultarUsuarioPorCorreoTest() {
        ModeloUsuario modeloUsuario = new ModeloUsuario();
        Usuario usuarioObtenido = modeloUsuario.getUsuarioCorreo("julio@gmail.com");
        assertNotNull(usuarioObtenido);
    }

    //6
    @Test
    public void consultarProductoExistenteTest() {
        ModeloProducto modeloProducto = new ModeloProducto();
        Producto producto = modeloProducto.getProducto(1);
        assertNotNull(producto);
    }

    //7
    @Test
    public void consultaProductoInvalidoTest() {
        ModeloProducto modeloProducto = new ModeloProducto();
        Producto producto = modeloProducto.getProducto(99999);
        assertNull(producto);
    }

    //8
    @Test
    public void eliminarProductoTest() {
        //Registrar un producto
        ModeloProducto mp = new ModeloProducto();
        Producto producto = new Producto(99, "Producto prueba", "imagen.jpg", 50.00, 15, "producto de prueba", "comidas");
        mp.agregarProducto(producto);

        mp = new ModeloProducto();

        boolean resultado = mp.eliminarProducto(99);
        assertTrue(resultado);
    }

    //9
    @Test
    public void actualizarProductoTest() {

        ModeloProducto mp = new ModeloProducto();
        Producto producto = new Producto(99, "Producto prueba", "imagen.jpg", 50.00, 15, "producto de prueba", "comidas");
        mp.agregarProducto(producto);

        mp = new ModeloProducto();

        boolean resultado = mp.actualizarProducto(99, "Horchata nueva", 51.00, "Nueva desc", "bebidas", "imagenNueva.jpg", 15);
        assertTrue(resultado);
    }

    //10
    @Test
    public void agregarPedidoTest() {
        ModeloPedido mp = new ModeloPedido();
        boolean resultado = mp.agregarPedido(2, "1 Dogo sencillo, 2 Coca colas", 50.00f);
        assertTrue(resultado);
    }
    
    //14
    @Test
    public void verificarObtenerListaComidas(){
        ModeloProducto modeloProducto = new ModeloProducto();
        
        List<Producto> listaDogos = modeloProducto.getProductosDogos();
        
        assertTrue(!listaDogos.isEmpty());
    }
    
    //15
    @Test
    public void actualizarProductoValido_test(){
        
        ModeloUsuario modeloUsuario = new ModeloUsuario();
        int idUsuario = 2;
        String nuevaContrasena = "luispablo";
        
        modeloUsuario.actualizarUsuario(idUsuario, nuevaContrasena);
        
        Usuario usuarioActualizado = modeloUsuario.getUsuario(idUsuario);
        
        assertEquals(nuevaContrasena, usuarioActualizado.getPassword());
        
    }
    
    //16
    @Test
    public void eliminarUsuario_test(){
        ModeloUsuario modeloUsuario = new ModeloUsuario();
        int idUsuario = 2;
        
        modeloUsuario.eliminarUsuario(idUsuario);
        
        Usuario usuarioEliminado = modeloUsuario.getUsuario(idUsuario);
        
        assertNull(usuarioEliminado);
    }

}
