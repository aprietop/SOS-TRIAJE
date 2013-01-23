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
public class PojoResultadoClinico {
    public String idCasoSOS;
    public PojoMedico responsable;
    public String opinion;
    public List<PojoArchivo> archivosClinicos;
    public String fechaSolucion;
    
    public PojoResultadoClinico(){
    }
    
}
