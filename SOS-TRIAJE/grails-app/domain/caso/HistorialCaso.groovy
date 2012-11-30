package caso

import java.util.Date
import medico.*

class HistorialCaso {
//ATRIBUTOS
    Date fecha
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
