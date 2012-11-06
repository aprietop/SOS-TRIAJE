package medico

import persona.*
import opinion.*

class Medico extends ActorSistema {
//ATRIBUTOS
    Integer numColegioMedico
    Integer numMinisterioSalud
    

//MAPEO
    static mapping = {
        tablePerHierarchy false
    }
    
//RELACIIONES
    static hasMany = [opiniones:Opinion]
   
//CONSTRAINTS    
    static constraints = {        
        numColegioMedico(nullable: true)
        numMinisterioSalud(nullable: true)
    }
}
