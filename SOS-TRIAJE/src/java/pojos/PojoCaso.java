/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.util.List;

/**
 *
 * @author prod1
 */
public class PojoCaso {
    public String IdCasoSOS;
    public List<PojoArchivo> Archivos;
    public List<PojoEspecialidad> Especialidad;
    public PojoPaciente Paciente;
    public String Descripcion;
    public String FechaInicio;
    public String FechaSolucion;
    
    public PojoCaso(String IdCasoSOS, List<PojoArchivo> Archivos, List<PojoEspecialidad> Especialidad, PojoPaciente Paciente, String Descripcion, String FechaInicio, String FechaSolucion){
        this.IdCasoSOS = IdCasoSOS;
        this.Archivos = Archivos;
        this.Especialidad = Especialidad;
        this.Paciente = Paciente;
        this.Descripcion = Descripcion;
        this.FechaInicio = FechaInicio;
        this.FechaSolucion = FechaSolucion;        
    }
            
}
