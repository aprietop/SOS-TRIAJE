/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

/**
 *
 * @author prod1
 */
public class PojoArchivo {
    
    public String nombre;
    public String descripcion;
    public byte[] adjunto;
    
    public PojoArchivo(String nombre, String descripcion, byte[] adjunto){    
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.adjunto = adjunto;
    }    
    
}
