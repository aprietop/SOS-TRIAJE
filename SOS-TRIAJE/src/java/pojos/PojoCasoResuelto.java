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
public class PojoCasoResuelto {
    public String idCasoSOS;
    public PojoMedico responsable;
    public String opinion;
    public List<PojoArchivo> archivos;
    public String fechaSolucion;    
    
    public PojoCasoResuelto(){
        
    }
}
