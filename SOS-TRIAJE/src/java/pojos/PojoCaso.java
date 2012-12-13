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
//    public String fechaInicio;
//    public String fechaSolucion;
    
    public PojoCaso(){
    }
            
}
