package status

import caso.*
import opinion.*

class Status {
    
//ATRIBUTOS
    String nombre
    Date fechaStatus
    String decripcion
    
//CONSTRAINTS    
    static constraints = {        
        nombre(nullable: false)
        fechaStatus(nullable: false)
        decripcion(nullable: false)
    }
}
