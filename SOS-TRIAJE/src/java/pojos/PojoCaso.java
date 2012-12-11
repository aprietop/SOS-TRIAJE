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
    public String idCasoSOS;
    public List<PojoArchivo> archivos;
    public List<PojoEspecialidad> especialidad;
    public PojoPaciente paciente;
    public String descripcion;
    public String fechaInicio;
    public String fechaSolucion;
    
    public PojoCaso(String idCasoSOS, List<PojoArchivo> archivos, List<PojoEspecialidad> especialidad, PojoPaciente paciente, String descripcion, String fechaInicio, String fechaSolucion){
        this.idCasoSOS = idCasoSOS;
        this.archivos = archivos;
        this.especialidad = especialidad;
        this.paciente = paciente;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio;
        this.fechaSolucion = fechaSolucion;        
    }
            
}
