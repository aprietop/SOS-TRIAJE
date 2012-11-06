package caso

import medico.*

class HistorialCaso {
//ATRIBUTOS
    Date fecha
//    Caso caso
    Medico medico
    String estadoCaso
    
    static belongsTo = [caso:Caso]
  
//CONSTRAINTS
    static constraints = {
        fecha(nullable: false)
        caso(nullable: false)
        medico(nullable: false)
    }
}
