/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

//import java.util.Date;

/**
 *
 * @author prod1
 */
public class PojoPaciente {
    public String nombre;
    public String apellido;
    public String cedula;
    public String sexo;
    public String nacionalidad;
    public String fechaNacimiento;
//    public Date Fecha;
    
    public PojoPaciente(String nombre, String apellido, String cedula, String sexo, String nacionalidad, String fechaNacimiento){
        this.nombre = nombre;
        this.apellido = apellido;
        this.cedula = cedula;
        this.sexo = sexo;
        this.nacionalidad = nacionalidad;
        this.fechaNacimiento = fechaNacimiento;
    }
    
}
