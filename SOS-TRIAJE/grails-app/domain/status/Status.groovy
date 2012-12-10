package status

import caso.*
import opinion.*

class Status {
    
//ATRIBUTOS
    String nombre
    String decripcion
    
//CONSTRAINTS    
    static constraints = {        
        nombre(nullable: false)
        decripcion(nullable: false)
    }
}
