/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Controlador;

/**
 *
 * @author GabrielMancinas233410
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Conexion conexion = new Conexion();
        System.out.println(conexion.getConexion());
        Consultas consultas = new Consultas();
       System.out.println(consultas.registrar("Gabriel","123"));
        
     }
    
}
