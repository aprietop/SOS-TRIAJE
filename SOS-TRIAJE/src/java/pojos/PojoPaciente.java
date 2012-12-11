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
    public String Nombre;
    public String Apellido;
    public String Cedula;
    public String Sexo;
    public String Nacionalidad;
    public String FechaNacimiento;
//    public Date Fecha;
    
    public PojoPaciente(String Nombre, String Apellido, String Cedula, String Sexo, String Nacionalidad, String FechaNacimiento){
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Cedula = Cedula;
        this.Sexo = Sexo;
        this.Nacionalidad = Nacionalidad;
        this.FechaNacimiento = FechaNacimiento;
    }
    
}
