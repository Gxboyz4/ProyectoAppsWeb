/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */

import Controlador.Consultas;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author julio
 */
public class ConsultasTest {
    
   

    public ConsultasTest() {
    }

    

    

    @Test
    public void registrar_RegistroExitoso() {
      
        Consultas consultas = new Consultas();
        String nombre = "Julio";
        String usuario = "chon";
        String correo= "julio@gmail.com";
        String password = "julio";
      
        boolean resultado = consultas.registrar(nombre, usuario, correo, password);
        assertTrue(resultado);
    }

    @Test
    public void registrar_FalloEnRegistro() {
        
        Consultas consultas = new Consultas();
        String nombre = "Julio";
        String usuario = "chon";
        String correo= "julio@gmail.com";
        String password = "julio";

       
        boolean resultado = consultas.registrar(nombre, usuario, correo, password);
        assertFalse(resultado);
    }
    @Test
    public void autenticacion_UsuarioValido() {
        
        Consultas consultas = new Consultas();
        String correo = "julio@gmail.com";
        String password = "julio";

        
        boolean resultado = consultas.autenticacion(correo, password);
        assertTrue(resultado);
    }

    @Test
    public void autenticacion_UsuarioInvalido() {
        
        Consultas consultas = new Consultas();
        String correo = "julio@gmail.com";
        String password = "chon";

        
        boolean resultado = consultas.autenticacion(correo, password);
        assertFalse(resultado);
    }
}
